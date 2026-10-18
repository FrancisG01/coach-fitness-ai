# Estado del proyecto

Última actualización: 18-oct-2026 (Fase S, sesión en Claude Code con el agente pm)

## Fase actual: S (setup) — criterio de salida cumplido; se cierra al fusionar el PR del servidor

### Hecho

- Entorno de Francis verificado e instalado en WSL: Node 24.22 (fnm, `.node-version`), pnpm 12.14, uv 0.13.1 + Python 3.12.15, EAS CLI 25.2, Playwright 1.64.1 + Chromium con dependencias del sistema.
- Repositorio público https://github.com/FrancisG01/coach-fitness-ai (decisión de Francis; el Anexo A de salud queda público a sabiendas). Commits con el correo privado `37189333+FrancisG01@users.noreply.github.com`.
- Monorepo (PR #1): backend FastAPI `/health`, web Vite + React + TS con página "hola", `@coach/brand`, Postgres 16 + pgvector y Redis en Docker. `apps/mobile` y `apps/watch` solo con README (fases 7 y 7b).
- CLAUDE.md, agentes (todos `model: inherit`), skills Impeccable 4.6.0 y UX Heuristics 1.6.0, hook SessionStart (ADR 0019).
- CI (web, backend, e2e, design) en verde; `main` protegida, solo por PR. Dependabot, escaneo de secretos.
- **Servidor Oracle `coach` (ADR 0020, rama `chore/fase-s-servidor`):**
  - Minecraft y todo su ecosistema retirados (sin respaldo, por decisión de Francis); Funnel apagado.
  - Nombre `coach` en el sistema y en Tailscale; Ubuntu 24.04 al día, con actualizaciones automáticas de seguridad.
  - Usuarios: `ubuntu` (admin, sudo) y `deploy` (Docker, sin sudo). SSH solo con llave, sin root, solo por Tailscale.
  - Sin puertos públicos: iptables + lista de seguridad de la VCN (solo ICMP 3/4). Verificado desde fuera.
  - Docker 29.9 + Compose v5.6; Caddy 2.10.2 en `infra/oracle/`, escuchando solo en la IP de Tailscale.
- **Criterio de salida de la Fase S cumplido (18-oct-2026):** Francis abrió https://coach.tail72ec86.ts.net desde el teléfono por Tailscale con HTTPS. Playwright: 200, cero mensajes en la consola.
- Cada cambio entra por rama + PR; Francis fusiona con `gh pr merge <n> --squash --delete-branch`.

### Decisiones de esta sesión

- D-20 / ADR 0020: preparación del servidor Oracle.
- Carpeta nueva `infra/` en la raíz del monorepo para la configuración de servidores.
- Claude Code tiene permiso solo para `ssh oracle` y `scp … oracle:` (`.claude/settings.local.json`). Lo que toca el acceso SSH lo ejecuta Francis con un script preparado.
- Llave de WSL `~/.ssh/coach_oracle`, sin frase de contraseña; alias `oracle` y `oracle-deploy`.

## Siguiente

1. Revisión del agente revisor y fusión del PR del servidor → Fase S cerrada.
2. Fase 0: PRD, `/impeccable init`, ADRs D-01 a D-18. Después, la Fase 0.5 (mockups).
3. Fase 1: despliegue automático desde el CI (llave propia del CI y Tailscale en el runner).

## Pendientes de Francis

- Plan Max: en la Fase 5, vincular los créditos de API a Claude Console y crear la clave del coach.
- Nombre definitivo y logo (más adelante).

## Bloqueos

- Ninguno.

## Red Tailscale (verificado 18-oct-2026)

- `francisdesign`: PC Windows (WSL2 ve la red Tailscale con networkingMode=mirrored).
- `coach` (antes `minecraft-server`), 100.105.148.38: Oracle Cloud (Ashburn), producción.
- `la-tribu-server`: servidor de casa; no se usa salvo decisión nueva.
- `francis-s24-ultra`: teléfono Android, con Tailscale activo.
