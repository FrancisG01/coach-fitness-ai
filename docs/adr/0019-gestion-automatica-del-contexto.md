# 0019 — Gestión automática del contexto

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, sección 12 ("Memoria del proyecto"); decisión D-19

## Contexto

Cada conversación de Claude Code empieza en blanco, y en sesiones largas la conversación se compacta automáticamente: el historial se resume y se pierde detalle. El plan ya guarda el conocimiento en el repositorio (`CLAUDE.md`, `docs/estado.md`, ADRs y la memoria de cada agente), pero recuperarlo dependía de que alguien pidiera "lee docs/estado.md" al empezar. Tras una compactación automática no lo pide nadie.

Además, la conversación principal se llena rápido cuando lee muchos archivos o recibe salidas largas, lo que adelanta la compactación.

## Decisión

1. **Hook `SessionStart`** en `.claude/settings.json`, con el matcher `startup|clear|compact|resume`. Ejecuta `.claude/hooks/inyectar-estado.sh`, que imprime `docs/estado.md` con un encabezado, y Claude Code lo recibe como contexto:
   - `startup`: conversación nueva.
   - `clear`: después de `/clear`.
   - `compact`: después de compactar, automática o manualmente.
   - `resume`: al reanudar una conversación (`--resume`, `/resume`).

   El script sale con código 0 aunque el archivo no exista, así que nunca bloquea el inicio.
2. **Reglas en `CLAUDE.md`, sección "Gestión de contexto":**
   - `docs/estado.md` se actualiza al terminar cada tarea o commit, sin que Francis lo pida, y se mantiene en menos de 100 líneas.
   - El trabajo que lee muchos archivos o produce salidas largas se delega a agentes; la conversación principal coordina.
   - Al cerrar un bloque grande de trabajo, Claude sugiere: "Buen momento para abrir una conversación nueva".

## Alternativas consideradas

- **Solo la regla en `CLAUDE.md`, sin hook.** `CLAUDE.md` sí sobrevive a la compactación, pero leer `estado.md` quedaría a criterio de Claude. Se descarta porque no es determinista.
- **Copiar el estado dentro de `CLAUDE.md`.** Mezcla reglas estables con estado cambiante y haría crecer `CLAUDE.md` por encima de las 200 líneas recomendadas. Se descarta.
- **Hook `PreCompact` que escriba el estado antes de compactar.** Escribiría un resumen automático sin criterio del pm. Se descarta por ahora; se puede sumar más adelante si hace falta.

## Consecuencias

- Toda conversación (nueva, limpiada, compactada o reanudada) arranca sabiendo en qué fase está el proyecto, qué sigue y qué falta de Francis.
- `docs/estado.md` pasa a ser crítico: si está desactualizado, Claude arranca con información vieja. Por eso se actualiza en cada tarea o commit.
- Cada inicio consume unos pocos miles de tokens de contexto, proporcional al tamaño de `estado.md`; de ahí el límite de 100 líneas.
- La conversación principal se mantiene más liviana al delegar en agentes, y la compactación llega más tarde.

## Verificación (17-oct-2026)

Se probó con sesiones de Claude Code sin interfaz (`claude -p`), con las herramientas de lectura desactivadas para que la única vía de recibir el estado fuera el hook:

- `startup`: la sesión citó textualmente líneas de `estado.md`.
- `resume`: se agregó a `estado.md` una marca temporal que la sesión no había visto; al reanudarla, la citó.
- `compact`: tras `/compact`, el registro de la sesión muestra `SessionStart:compact` con salida 0 y el estado vigente inyectado.
- `clear`: tras `/clear`, el registro muestra `SessionStart:clear` con salida 0 y el estado inyectado.
