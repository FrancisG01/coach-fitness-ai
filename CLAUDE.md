# Coach Fitness AI — reglas del proyecto

Plataforma personal de entrenamiento, nutrición y salud con coach IA. Dueño del producto: Francis Guzman (diseñador gráfico, usuario único en la v1.0, arquitectura multiusuario).

## Fuente de verdad

- `docs/plan-maestro.md` — plan completo: requisitos (IDs GYM-, SAL-, NUT-, SUP-, CAR-, COA-, DSH-, SIS-), stack, fases, decisiones. Léelo antes de planificar cualquier cosa.
- `docs/estado.md` — dónde quedó la última sesión. Léelo al empezar; actualízalo al terminar.
- `docs/diseno/` — dirección visual aprobada (B2 "Caucho y acento") y tokens.
- `docs/adr/` — decisiones técnicas. Una decisión nueva = un ADR nuevo.

Si algo choca con el plan, no improvises: pregunta a Francis y registra la decisión.

## Idioma

- Conversación, documentación, commits y textos de la interfaz: español.
- Código (nombres de variables, funciones, tablas): inglés.
- Interfaz: tuteo, tipo oración, sin mayúsculas en etiquetas, sin signos de exclamación.

## Stack (no cambiar sin ADR)

- Backend: Python 3.12, FastAPI, Pydantic v2, SQLAlchemy 2, Alembic, PostgreSQL 16 + pgvector, Redis + ARQ.
- Web: React + TypeScript + Vite, TanStack Router y Query, Tailwind CSS v4, Radix UI, Motion, Apache ECharts.
- Móvil: Expo (React Native) + TypeScript, NativeWind, Reanimated, expo-haptics, SQLite local (offline-first), Health Connect.
- Monorepo: pnpm + Turborepo — `backend/`, `apps/web/`, `apps/mobile/`, `apps/watch/`, `packages/`, `docs/`.
- Reloj: app Wear OS nativa (Kotlin + Jetpack Compose for Wear OS, Horologist, Health Services), Wear OS 3+, conectada a la app Android por Data Layer.
- Coach: API de Anthropic con tool use, pagada con los créditos de API del plan Max (clave en variable de entorno, nunca en el repo).
- Infra: Docker Compose + Caddy en Oracle Cloud, acceso solo por Tailscale.

## Entorno

- Desarrollo en Windows dentro de WSL2 (Ubuntu). El código vive en el sistema de archivos de Linux (`~/proyectos/...`), nunca en `/mnt/c/`.
- Postgres y Redis en Docker. Comandos del proyecto vía `pnpm` y `uv`.

## Comandos

- Servicios locales (Postgres + Redis): `docker compose up -d` / `docker compose down`.
- Todo el monorepo desde la raíz: `pnpm install`, `pnpm lint`, `pnpm typecheck`, `pnpm test`, `pnpm build`.
- Web: `pnpm --filter @coach/web dev` (http://localhost:5173).
- Backend, dentro de `backend/`: `uv sync`, `uv run pytest`, `uv run ruff check .`, `uv run ruff format .`, `uv run mypy`, `uv run fastapi dev src/coach_api/main.py`.
- Versiones fijadas: Node en `.node-version` (fnm), pnpm en `package.json`, Python en `backend/.python-version` (uv).

## Forma de trabajar

1. Ninguna tarea empieza sin requisito y criterios de aceptación. Ninguna pantalla sin mockup aprobado (Fase 0.5).
2. Una rama por tarea (`feat/gym-04-modo-gym`), Conventional Commits, fusión solo por pull request con CI en verde.
3. Tests junto con el código: pytest (backend), Vitest (web), Playwright (E2E web), Maestro (móvil).
4. Si un cambio toca la web: recorre el flujo con Playwright (Chromium headless dentro de WSL), captura la consola y una captura de pantalla. Cero errores nuevos. La integración Claude in Chrome (`@browser`) no funciona en WSL; no la uses.
5. Cambios de esquema: migración Alembic reversible + actualizar `docs/database/schema.dbml`.
6. Nunca dar una tarea por terminada si falla lint, tipos, tests, detector de diseño o la consola del navegador.
7. Cada funcionalidad terminada lleva su guía de uso en el Centro de ayuda (agente `documentador`).
8. Al cerrar la sesión: actualiza `docs/estado.md`.

## Gestión de contexto

- Al terminar cada tarea o cada commit, actualiza `docs/estado.md` sin que te lo pidan: qué se hizo, qué sigue, decisiones tomadas y pendientes. Mantenlo corto (menos de 100 líneas): se inyecta al inicio de cada conversación.
- Delega a los agentes todo trabajo que lea muchos archivos o produzca salidas largas; la conversación principal solo coordina.
- Al cerrar un bloque grande de trabajo, dile a Francis: "Buen momento para abrir una conversación nueva".
- Un hook `SessionStart` (`.claude/settings.json`) inyecta `docs/estado.md` al iniciar, al usar `/clear`, tras compactar y al reanudar (ADR 0019).

## Modelos

- Opus 5.5 es el modelo por defecto para el trabajo diario: pantallas, endpoints, pruebas, documentación, configuración.
- Fable 5.1 se reserva para tareas críticas: diseño de arquitectura y base de datos (Fase 1), sincronización offline entre móvil, reloj y servidor, seguridad y aislamiento por usuario (RLS), y errores que Opus no resuelva en dos intentos.
- Fable comparte el límite semanal del plan Max de Francis (tope del 50 %) y lo consume más rápido: úsalo solo cuando aporte de verdad.
- Claude no cambia de modelo por su cuenta. Cuando una tarea califique para Fable, avisa antes de empezarla con: "Esta tarea merece Fable 5.1: escribe /model y elígelo". Al terminarla, recuerda volver a Opus 5.5.
- Ningún agente de `.claude/agents/` lleva Fable fijo: todos usan `model: inherit`.

## Diseño

- Solo tokens de `docs/diseno/tokens.json`: nunca colores, tamaños o radios sueltos.
- Base neutra (caucho/tiza) + un acento; acento de fábrica Caribe; modo según el sistema.
- Archivo como única fuente; cifras con `tnum`.
- Nombre y logo provisionales ("Coach Fitness AI" / "Coach"): siempre desde el archivo de marca `packages/brand`, nunca escritos a mano en pantallas.

## Seguridad

- Secretos solo en `.env` (no versionado). Nunca imprimir claves en logs.
- Toda consulta filtra por `user_id`; RLS en Postgres como segunda barrera.
- El coach nunca diagnostica ni prescribe fármacos.

## Equipo de agentes

Definidos en `.claude/agents/`. El agente `pm` coordina: divide, asigna, verifica criterios y cierra. Los demás no fusionan nada sin su visto bueno.
