# Estado del proyecto

Última actualización: 17-oct-2026 (Fase S, sesión en Claude Code con el agente pm)

## Fase actual: S (setup) — en curso

### Hecho

- Entorno de Francis verificado e instalado en WSL: Node 24.22 (fnm, `.node-version`), pnpm 12.14, uv 0.13.1 + Python 3.12.15, EAS CLI 25.2, Playwright 1.64.1 + Chromium con dependencias del sistema.
- Repositorio público https://github.com/FrancisG01/coach-fitness-ai (decisión de Francis; el Anexo A de salud queda público a sabiendas). Commits con el correo privado `37189333+FrancisG01@users.noreply.github.com`.
- Monorepo (rama `chore/fase-s-setup`, PR #1): backend FastAPI `/health` (uv, pytest, Ruff, mypy estricto), web Vite + React + TS con página "hola" (ESLint, Vitest, Playwright), `@coach/brand`, Postgres 16 + pgvector y Redis en Docker. `apps/mobile` y `apps/watch` solo con README (se crean en las fases 7 y 7b).
- CLAUDE.md: secciones Comandos, Modelos y Gestión de contexto.
- Agentes: pm aplica la regla de modelos y exige CI en verde + revisor; Impeccable agregó 4 agentes auxiliares (todos `model: inherit`).
- Skills: Impeccable 4.6.0 (detector como hook y en el CI) y UX Heuristics 1.6.0.
- CI (GitHub Actions, acciones fijadas por SHA): web, backend, e2e, design; en verde en el PR #1. Dependabot semanal, escaneo de secretos con bloqueo del push, plantillas de PR e issues.
- Revisión del agente revisor del PR #1: aprobado con observaciones, corregidas.
- Hook SessionStart que inyecta este archivo (ADR 0019).

### Decisiones de esta sesión

- ESLint en vez de oxlint (lo que trae hoy Vite), por el plan. TypeScript 6.0 (typescript-eslint aún no admite la 7).
- `httpx2` en pruebas del backend (sucesor oficial de httpx que pide Starlette).
- `/impeccable init` (PRODUCT.md y DESIGN.md) se deja para la Fase 0.
- ADR 0019: gestión automática del contexto.

## Siguiente

1. Francis protege `main` (comando `gh api ... /branches/main/protection` que el pm le pasó) y fusiona el PR #1.
2. Servidor Oracle (`minecraft-server`, 100.105.148.38 en Tailscale): respaldar y retirar Minecraft, actualizar Ubuntu, usuario de despliegue, SSH solo con llave, Docker, cerrar puertos públicos. Requiere acceso SSH de Francis.
3. Página "hola" servida desde Oracle con HTTPS de Tailscale y abierta desde el teléfono → criterio de salida de la Fase S.
4. Después: Fase 0 (PRD, `/impeccable init`, ADRs D-01 a D-18) y Fase 0.5.

## Pendientes de Francis

- Proteger `main` y fusionar el PR #1.
- Acceso SSH al servidor Oracle (la llave que usa en Termius).
- Plan Max: en la Fase 5, vincular los créditos de API a Claude Console y crear la clave del coach.
- Nombre definitivo y logo (más adelante).

## Bloqueos

- Ninguno.

## Red Tailscale (verificado 17-oct-2026)

- `francisdesign`: PC Windows (WSL2 ve la red Tailscale con networkingMode=mirrored).
- `minecraft-server`: Oracle Cloud (Ashburn), destino de producción. Resuelve desde WSL.
- `la-tribu-server`: servidor de casa; no se usa salvo decisión nueva.
- `francis-s24-ultra`: teléfono Android.
