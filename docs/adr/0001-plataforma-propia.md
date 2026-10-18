# 0001 — Plataforma propia en Oracle

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 1 (resumen ejecutivo), 2 (punto de partida), 4 (alcance) y 12 (herramientas); decisiones D-01, D-02, D-07 y D-12

## Contexto

Antes del plan, el seguimiento estaba repartido: GymTracker en Google Sheets para el gym y archivos Markdown trabajados en Cursor como "memoria" del coach (VISION_v1, CONTEXT_v1 y v2, Consolidado v3). Los datos no estaban en un solo lugar, no se podían consultar ni graficar con fiabilidad y ningún coach tenía el panorama completo. El gym además estaba parado desde el 2-jun-2026 y GymTracker v1 quedó descartado.

## Decisión

Construir una plataforma propia con tres piezas sobre una sola base de datos:

- backend propio;
- web responsive instalable (PWA);
- app Android.

Se despliega en el servidor Oracle de Francis (capa gratuita, ARM). Se abandonan GymTracker en Sheets y el enfoque de Cursor más archivos `.md`; todo pasa a vivir dentro de la nueva plataforma.

## Alternativas consideradas

- **Seguir con GymTracker en Sheets.** Descartado en la sección 2: no cubre nutrición, salud, coach ni modo gym sin conexión.
- **Cursor con archivos Markdown como base del coach.** Descartado: los datos son números con fechas que hay que sumar y graficar, y Cursor duplicaría el agente de IA que ya aporta Claude Code (secciones 8 y 12).

## Consecuencias

- Control total sobre datos, funciones y diseño, y un solo sistema que el coach puede leer completo.
- Hay que construir y mantener backend, web y app, con su CI, despliegue y respaldos (secciones 13 y 15).
- La infraestructura depende de la capa gratuita de Oracle. Riesgo registrado en la sección 17: si Oracle limita la instancia, el despliegue con Docker es reproducible en otro servidor.
- Riesgo de que el desarrollo retrase el regreso al gym: se mitiga entrenando ya con la rutina A/B/C en papel y haciendo el módulo Gym primero.
