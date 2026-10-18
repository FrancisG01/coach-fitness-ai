# Estado del proyecto

Última actualización: 18-oct-2026 (flujo 2 del calendario aprobado y fusionado, PR #15)

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

- PRD v1.0 aprobado (`docs/prd.md`, decisiones en su sección 9): Max 5x; coach con tope de $80/mes y $8/día, al 80 % el chat pasa a Sonnet 5.5 y avisa; metas de enero 2027 aprobadas; 2,350 kcal objetivo único con revisión a las 6 semanas; fotos de progreso y mapa corporal fuera de la v1.0; requisitos S posponibles; 9 flujos en la Fase 0.5.
- D-24 / ADR 0023: unidades preferidas (SIS-07, M, entra en la v1.0). Peso corporal y cargas del gym por separado en kg o lb (lb de fábrica); estatura m/cm/pies y pulgadas, perímetros cm/pulgadas, distancia km/millas (métrico de fábrica). Todo se guarda en kg, cm y m con `entered_unit`. Plan v1.4, PRD v1.1.
- Mockups de las páginas 6 y 13 aprobados con 5 decisiones: barra marca Hoy dentro de Ajustes; Proteína en vez de Peso en Hoy; 2,350 kcal; ícono de selector en "Propio"; sin contorno de día en el calendario.
- Mockups de Ajustes y Unidades aprobados: unidades se guardan al tocar (sin botón); Centro de ayuda dentro de Ajustes en móvil; en web, Ajustes despliega subsecciones en la barra lateral; cargas en lb con cifras reales de disco.
- D-25 (plan v1.5, PRD v1.2): calendario en **Gym** (no en Hoy) con pasado (hecha o no hecha, con resumen), hoy y futuro (programar, mover, copiar), paseos MTB y citas de análisis (solo lectura, llevan a Salud). Marcas aprobadas: punto lleno de acento = hecha, contorno = programada, gris con ✕ = no hecha, `bike` = MTB, ícono propio = análisis. "Mover a otro día" en sesiones no hechas; "Copiar la semana anterior". Se diseña primero el flujo 2 y después el flujo 1.
- D-26 (plan v1.6, PRD v1.3): programar en 3 pasos (rutina → series y reps de la rutina, editables → pesos); sesión programada editable, día hecho de solo lectura. Semana 1 = semana de la primera actividad registrada de cada usuario; Francis arranca desde cero (no se carga el historial del Anexo A). Pestañas internas de Gym en móvil; Salud suma "Análisis". Contraste A4 sobre elevado (4.49:1) se queda por ahora.
- D-27: paseo MTB con distancia, desnivel +, tiempo en movimiento, velocidad media, kcal, FC promedio y zonas Z1-Z5 (% y ppm) desde dos capturas de Strava; el objetivo calórico del día sube con el 50 % de las kcal del paseo.
- Francis quiere que Claude tome iniciativas y las liste para confirmar ("Decisiones que tomé y necesito que confirmes").
- D-21 / ADR 0021: embeddings de la memoria del coach con modelo local en el servidor; el modelo se elige en la Fase 1 con benchmark.
- Plan maestro v1.2: título "Coach Fitness AI".
- Estimación (Francis a tiempo completo): ~11 semanas optimista / ~18.5 probable. Modo gym usable ~7-nov a ~22-nov-2026; v1.0 ~2-ene a ~25-feb-2027.
- D-20 / ADR 0020: servidor Oracle. Carpeta `infra/` para configuración de servidores.
- Claude Code solo puede `ssh oracle` y `scp … oracle:`; lo que toca el acceso SSH lo ejecuta Francis con un script preparado. Llave `~/.ssh/coach_oracle`, alias `oracle` y `oracle-deploy`.
- Dirección B2 confirmada: acento de fábrica Caribe, modo según el sistema, nombre provisional "Coach Fitness AI" (casilla marcada en la sección 21 del plan).
- Dependabot ignora los saltos de versión mayor en npm y uv; PRs #3 (`@types/node` 26) y #4 (TypeScript 7) cerrados.
- Cada cambio entra por rama + PR; Francis fusiona con `gh pr merge <n> --squash --delete-branch`.

## Siguiente (Fase 0, un paso a la vez)

1. ADRs 0001 a 0018 escritos (PR #7). Contradicciones del plan resueltas con Francis (plan v1.1, PR #8): Archivo única fuente, modo según el sistema, coach solo con créditos Max, staging por Tailscale, backlog v1.0 cerrado.
2. PRD hecho y aprobado por Francis el 18-oct-2026 (`docs/prd.md`).
3. PRODUCT.md y DESIGN.md aprobados por Francis el 18-oct-2026 (plataforma `adaptive`; estados, movimiento, diálogos, avisos, vacíos y carga definidos; tokens.json ampliado). Plan v1.3, ADR 0022 (íconos Tabler), D-23 (barra Hoy, Gym, Comida, Salud, Coach; logo provisional mancuerna en `packages/brand`).
4. Fase 0.5 en curso. Unidades (PR #11) y mockups de páginas 6 y 13, Ajustes y Unidades (PR #12) fusionados: `docs/diseno/mockups/b2-paginas-6-y-13.html`, artefacto https://claude.ai/artifact/US2zb54ohddswLsFBNdQyZ.
5. Paso 4A hecho (rama `docs/calendario`): D-25 en plan v1.5, GYM-03 reescrito, flujo 2 ampliado en plan y PRD v1.2, agrupación de DESIGN.md corregida.
6. Paso 4B hecho y aprobado (PR #15): flujo 2 en `docs/diseno/mockups/flujo-2-calendario.html` (https://claude.ai/artifact/289fc21Nzt8UpHPNpznbk3) y `flujo-2-calendario-prototipo.html` (https://claude.ai/artifact/CWy7xv7P44k4nZgzMEP6a8). Francis confirmó: primera actividad = cualquier sesión (aunque sea programada) o paseo; series 1-10 y reps 1-30; editar sesión no cambia la rutina; mover o copiar lleva series, reps y pesos de la sesión; volumen con lo del día; zonas de FC solo con % visible; 50 % de kcal MTB.
7. **Siguiente: flujo 1 (entrenar en el gym)** en 4 piezas, reutilizando lo del flujo 2 (tres pasos, steppers, pestañas de Gym). Después, el modelo conceptual de la BD (califica para Fable 5.1: avisar antes).
8. Para la Fase 1 (del revisor, PR #5): despliegue automático desde el CI (llave propia y Tailscale en el runner); `Content-Security-Policy` y `Permissions-Policy` en el Caddyfile; despliegue atómico (carpeta versionada + enlace simbólico) sin reiniciar Caddy si no cambió el Caddyfile.

## Pendientes de Francis

- Medidas con cinta de octubre: cintura, cadera, pecho, brazos y muslos (fijan las metas del Anexo A.3).
- Empezar ya la rutina A/B/C en papel (riesgo principal del plan).
- Plan Max: en la Fase 5, vincular los créditos de API a Claude Console y crear la clave del coach.
- Nombre definitivo y logo (más adelante). Especificaciones del logo: glifo SVG 24×24 de un color (`currentColor`), legible a 24 px; ícono Android 108 dp con zona segura de 66 dp + versión monocroma; versión circular para el reloj; favicon 16/32; colores solo de tokens.json. Se reemplaza solo en `packages/brand`.

## Bloqueos

- Ninguno.

## Red Tailscale (verificado 18-oct-2026)

- `francisdesign`: PC Windows (WSL2 ve la red Tailscale con networkingMode=mirrored).
- `coach`, 100.105.148.38: Oracle Cloud (Ashburn), producción.
- `la-tribu-server`: servidor de casa; no se usa salvo decisión nueva.
- `francis-s24-ultra`: teléfono Android, con Tailscale activo.
