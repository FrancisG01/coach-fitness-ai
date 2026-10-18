# 0016 — Desarrollo en Windows con WSL2; Fase S antes de la Fase 0; backlog de la v1.0 cerrado

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 12 (herramientas y "Preparación del entorno (Fase S — Setup)"), 16 (fases), 17 (riesgos) y 19 (backlog de mejoras); decisiones D-07, D-16 y D-20

## Contexto

La PC de Francis usa Windows, y el servidor Oracle corre Ubuntu con Docker. Antes de escribir producto hay que preparar cuentas, PC, servidor, teléfono y repositorio. Además, uno de los dos riesgos mayores del proyecto es que el alcance crezca sin control y el desarrollo retrase el regreso al gym (sección 17).

## Decisión

- **WSL2 con Ubuntu 24.04 en Windows:**
  - el código vive y corre dentro de WSL2, en su sistema de archivos;
  - Docker Desktop corre Postgres y Redis igual que en el servidor;
  - VS Code se conecta a WSL.
- **Fase S (Setup) antes de la Fase 0:**
  - cuentas, PC, servidor Oracle con Docker y Tailscale, teléfono, repositorio, agentes y CI;
  - criterio de salida: página "hola" por Tailscale con HTTPS desde el teléfono, CI en verde y Claude Code abriendo el proyecto en VS Code dentro de WSL.
- **Backlog de la v1.0 cerrado** el 17-oct-2026:
  - entran el modo gym con temporizador y vibración, 1RM y RM múltiples con récords, la carga combinada gym más MTB, el informe mensual en PDF y el calendario de análisis de sangre;
  - el resto espera (prioridad W).

## Alternativas consideradas

El plan no compara WSL2 con otras opciones de entorno en Windows. Sobre el alcance, la regla de la sección 17 descarta meter ideas nuevas en la fase en curso salvo que sean críticas.

## Consecuencias

- El entorno de desarrollo es idéntico al del servidor (Linux con Docker), y se evitan diferencias entre Windows y producción.
- El código nunca va en `/mnt/c/`; la integración Claude in Chrome no funciona en WSL, así que la web se prueba con Playwright dentro de WSL.
- Ninguna línea de producto se escribe hasta cerrar la Fase S. Se cerró el 18-oct-2026 (sección 21).
- Toda idea nueva entra al backlog (sección 19) para después de la v1.0, salvo que sea crítica y Francis lo decida (aclarado el 18-oct-2026).
