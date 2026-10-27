---
name: flujo-5-mtb
description: Flujo 5 (registrar paseo MTB, CAR-01/02, D-39): guía y mockups aprobados el 27-oct-2026 (commit 1a2936c); prototipo entregado ese día y por aprobar
metadata:
  type: project
---

Piezas 1 y 2 (diagrama en 4 bloques A-D + guía de 21 pasos) en `docs/diseno/mockups/flujo-5-mtb.html`, aprobadas por Francis el 27-oct-2026 con sus 12 decisiones (commit b8abb3f). Pieza 3 (28 pantallas móvil + 6 web) añadida el mismo día con `mock5.py`, que ejecuta `gen_flujo5.py`; 13 decisiones nuevas por confirmar. Generadas con `gen_flujo5.py` en el scratchpad de esa sesión (toma CSS, sprite, controles y script de flujo-4-receta-plan.html; añade íconos calendar, photo, heartbeat, route, paperclip). El HTML es la fuente. Siguiente: aprobar mockups y luego el prototipo. Patrones documentados en DESIGN.md › «Paseo MTB y Cardio y MTB (Gym, D-39)».

Cifras del ejemplo (Francis, objetivo 2,350, FC máx. 190 → zonas Strava Z1 0–112, Z2 113–148, Z3 149–166, Z4 167–184, Z5 185+):
- Canónico: sábado 17-oct, inicio 7:12 a. m., registrado 9:40 a. m.: 18.4 km, +240 m, 52 min en movimiento, 1 h 04 total, 21.2 km/h, 640 kcal → +320 → 2,670, FC 158 / máx. 181. Zonas Z4 26 % 14 min, Z3 45 % 23, Z2 27 % 14, Z1 2 % 1, Z5 0. Propuesta: 1 taza más de arroz en el almuerzo (+205) y 30 g de avena en la merienda (+114).
- Día pasado sin zonas: sábado 10-oct registrado lunes 12: 24.1 km, +310 m, 1 h 12, 20.1 km/h, 830 kcal → +415 → 2,765, FC 154 (cifras del prototipo del flujo 2).
- Jueves 8-oct: 12.7 km, 38 min, 20.1 km/h, 410 kcal, 150 m. Semana 1 (5-11 oct): 36.8 km · 1 h 50 min · 460 m.
- Comida sábado 17 a las 9:45: objetivo 2,670 = P 195 / C 307 / G 74; desayuno 625 → Restan 2,045.
- Sin kcal (Samsung Health): jueves 22-oct 5:30 p. m., 14.6 km, 46 min, 19.0 km/h, +150 m, FC 141.
- Recuperación: martes 3-nov (el del flujo 4 paso 17): 41.8 km, 2 h 05 min (>90 min = fuerte), 1,200 kcal → 2,950; zonas Z1 4 % 5, Z2 36 % 45, Z3 44 % 55, Z4 16 % 20; Día B (peso muerto, curl femoral) miércoles 4 a las 8:00.

Correcciones del flujo 2 aplicadas (lámina y prototipo): 21.2 km/h y «185+ ppm». El flujo 3 (domingo 18, paseo de 1,200 kcal → 2,950) NO se tocó: su «hoy» es el lunes 19 y el martes 3-nov sería futuro; propuse tratarlo como un segundo paseo de Francis (pendiente de confirmar).

Contraste: el detalle en texto secundario sobre el fondo suave da 4.44:1 en oscuro con Mango; sobre `--suave` usar texto principal.

Detector: `text-wrap: pretty` en p/li y `balance` en títulos quita los avisos «straggler» y «unbalanced-heading». Los chats desplazados se dibujan con `.desliza.al-pie` (justify-content: flex-end) para ver el final de la tarjeta; las pestañas de Gym con «Cardio y MTB» activa usan `.sub-tabs.al-final`.

**Why:** Francis tiene que aprobar la guía y las 12 decisiones de la sección «Por confirmar» antes de los mockups.
**How to apply:** reutiliza estas cifras en los mockups y el prototipo del flujo 5. Ver [[flujo-4-receta-plan]], [[flujo-2-calendario]] y [[verificacion-mockups]].

Mockups aprobados con sus 15 decisiones (commit 1a2936c): el domingo 18 del flujo 3 es un segundo paseo de Francis (40.6 km, 2 h 01, +580 m, 1,200 kcal → 2,950, en el prototipo); sábado 10 = 830 kcal → 2,765.

Prototipo (pieza 4, 27-oct): `flujo-5-mtb-prototipo.html`, generado con `gen_proto5.py` + `proto5.js` (scratchpad de esa sesión); toma CSS y sprite de flujo-5-mtb.html y las reglas de prototipo de flujo-4-receta-plan-prototipo.html. Solo teléfono (sin vista web). Escenarios: sábado 17 a las 9:40 a. m. o p. m. (comparten estado) y martes 3-nov 6:10 p. m. (recuperación, se reinicia). Recorridos probados con `recorrido5.cjs` (1440 claro y 390 oscuro), `contraste-proto.cjs` y `movil5.cjs`.
Lecciones: `.proto .desliza` pisa el padding de `.desliza.con-chat`: hay que repetirlo con `.proto .desliza.con-chat`. En oscuro la hoja (elevado) y el campo (elevado) se funden: el campo baja a fondo dentro de la hoja. Un guion largo dispara «first-viewport-column-overflow» a 1440. Sin `<meta viewport>` el archivo local no se prueba con isMobile (lo pone el artefacto); usar viewport 390 sin isMobile.
