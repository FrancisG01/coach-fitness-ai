# 0015 — Desarrollo con Claude Code; coach de la app con la API de Anthropic

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 4 (supuestos), 8 (coach IA), 12 (Fase S, cuentas), 17 (riesgos), 18 (costos de operación) y 21 (pendientes); decisiones D-06, D-07 y D-15

## Contexto

Claude interviene de dos formas distintas: como herramienta de desarrollo (Claude Code, con los agentes del proyecto) y como coach dentro de la app, que el backend llama en cada conversación. Son usos con límites y condiciones diferentes. Francis tiene el plan Max de Claude.

## Decisión

- **Desarrollo:** Claude Code con la suscripción de Claude de Francis.
- **Coach de la app:** la API de Anthropic con tool use, llamada desde el backend:
  - la clave se crea en Claude Console y vive en variables de entorno del servidor, nunca en el repositorio;
  - el gasto sale de los créditos mensuales de API que incluye el plan Max ($100 en Max 5x, $200 en Max 20x), vinculados a una organización de Claude Console. Solo créditos Max; el pago por uso queda como opción futura (aclarado el 18-oct-2026);
  - los créditos se activan en la Fase 5.

## Alternativas consideradas

- **Que el coach use la suscripción de Claude Code en lugar de la API.** Descartada: gastaría los límites de Claude Code del desarrollo. La API es la vía estable para un backend y la única válida si la app se abre al público.

## Consecuencias

- El coach no tiene costo extra mientras alcancen los créditos de Max, y no compite con los límites del desarrollo.
- Según la sección 18, los créditos no se acumulan y, si se agotan, la API se detiene sin cobros extra: el coach dejaría de responder hasta el mes siguiente.
- Hace falta un tope mensual configurable, registro de tokens por conversación, resúmenes y caché para reducir el gasto, y modelos más ligeros para tareas simples (secciones 8 y 17).
- Al abrir al público hay que revisar los términos comerciales de la API, el costo por usuario y las políticas para datos de salud (sección 11).
