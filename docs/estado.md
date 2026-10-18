# Estado del proyecto

Última actualización: 18-oct-2026 (cierre de la Fase S, arranque de la Fase 0)

## Fase actual: 0 (fundaciones)

Criterio de salida: repo compila, CI en verde, Francis aprueba el PRD y el diseño.

### Fase S — cerrada el 18-oct-2026

- Entorno WSL: Node 24.22 (fnm), pnpm 12.14, uv 0.13.1 + Python 3.12.15, EAS CLI 25.2, Playwright 1.64.1 + Chromium.
- Repo público https://github.com/FrancisG01/coach-fitness-ai (Anexo A público a sabiendas). Commits con `37189333+FrancisG01@users.noreply.github.com`.
- Monorepo (PR #1): backend FastAPI `/health`, web Vite + React "hola", `@coach/brand`, Postgres 16 + pgvector y Redis en Docker. `apps/mobile` y `apps/watch` solo con README.
- CLAUDE.md, agentes (`model: inherit`), skills Impeccable 4.6.0 y UX Heuristics 1.6.0, hook SessionStart (ADR 0019).
- CI (web, backend, e2e, design) en verde; `main` protegida, solo por PR; Dependabot y escaneo de secretos.
- Servidor Oracle `coach` (PR #5, ADR 0020): Minecraft retirado; SSH solo con llave y por Tailscale; usuarios `ubuntu` (admin) y `deploy` (Docker); sin puertos públicos; Caddy en `infra/oracle/` solo en la IP de Tailscale.
- Criterio de salida: Francis abrió https://coach.tail72ec86.ts.net desde el teléfono con HTTPS; Playwright 200 y consola limpia.

### Decisiones vigentes

- D-20 / ADR 0020: servidor Oracle. Carpeta `infra/` para configuración de servidores.
- Claude Code solo puede `ssh oracle` y `scp … oracle:`; lo que toca el acceso SSH lo ejecuta Francis con un script preparado. Llave `~/.ssh/coach_oracle`, alias `oracle` y `oracle-deploy`.
- Dirección B2 confirmada: acento de fábrica Caribe, modo según el sistema, nombre provisional "Coach Fitness AI" (casilla marcada en la sección 21 del plan).
- Dependabot ignora los saltos de versión mayor en npm y uv; PRs #3 (`@types/node` 26) y #4 (TypeScript 7) cerrados.
- Cada cambio entra por rama + PR; Francis fusiona con `gh pr merge <n> --squash --delete-branch`.

## Siguiente (Fase 0, un paso a la vez)

1. ADRs 0001 a 0018 escritos (PR #7). Pendiente: Francis resuelve las contradicciones del plan que encontró el arquitecto (tipografía, modo por defecto, pago del coach, staging con dominio, backlog cerrado y detalles menores).
2. PRD (agente `pm`): incluye recálculo de metas del Anexo A con la medición del 17-oct, estimación del costo de la API del coach y estimaciones de tiempo por fase. Lo aprueba Francis.
3. `/impeccable init`: PRODUCT.md y DESIGN.md desde B2 y `docs/diseno/tokens.json`. Lo aprueba Francis.
4. Después: Fase 0.5 (mockups).
5. Para la Fase 1 (del revisor, PR #5): despliegue automático desde el CI (llave propia y Tailscale en el runner); `Content-Security-Policy` y `Permissions-Policy` en el Caddyfile; despliegue atómico (carpeta versionada + enlace simbólico) sin reiniciar Caddy si no cambió el Caddyfile.

## Pendientes de Francis

- Plan Max: en la Fase 5, vincular los créditos de API a Claude Console y crear la clave del coach.
- Nombre definitivo y logo (más adelante).

## Bloqueos

- Ninguno.

## Red Tailscale (verificado 18-oct-2026)

- `francisdesign`: PC Windows (WSL2 ve la red Tailscale con networkingMode=mirrored).
- `coach`, 100.105.148.38: Oracle Cloud (Ashburn), producción.
- `la-tribu-server`: servidor de casa; no se usa salvo decisión nueva.
- `francis-s24-ultra`: teléfono Android, con Tailscale activo.
