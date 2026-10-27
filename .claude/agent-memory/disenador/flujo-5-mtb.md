---
name: flujo-5-mtb
description: Flujo 5 (registrar paseo MTB, CAR-01/02, D-39): piezas 1 y 2 entregadas el 27-oct-2026 con 21 pasos; cifras de ejemplo y decisiones por confirmar
metadata:
  type: project
---

Piezas 1 y 2 (diagrama en 4 bloques A-D + guía de 21 pasos) en `docs/diseno/mockups/flujo-5-mtb.html`, entregadas el 27-oct-2026. Generadas con `gen_flujo5.py` en el scratchpad de esa sesión (toma CSS, sprite, controles y script de flujo-4-receta-plan.html; añade íconos calendar, photo, heartbeat, route, paperclip). El HTML es la fuente. Pendiente: aprobación de Francis, luego mockups y prototipo.

Cifras del ejemplo (Francis, objetivo 2,350, FC máx. 190 → zonas Strava Z1 0–112, Z2 113–148, Z3 149–166, Z4 167–184, Z5 185+):
- Canónico: sábado 17-oct, inicio 7:12 a. m., registrado 9:40 a. m.: 18.4 km, +240 m, 52 min en movimiento, 1 h 04 total, 21.2 km/h, 640 kcal → +320 → 2,670, FC 158 / máx. 181. Zonas Z4 26 % 14 min, Z3 45 % 23, Z2 27 % 14, Z1 2 % 1, Z5 0. Propuesta: 1 taza más de arroz en el almuerzo (+205) y 30 g de avena en la merienda (+114).
- Día pasado sin zonas: sábado 10-oct registrado lunes 12: 24.1 km, +310 m, 1 h 10, 20.7 km/h, 860 kcal → 2,780.
- Jueves 8-oct: 12.7 km, 41 min, 18.6 km/h, 470 kcal, 120 m. Semana 1 (5-11 oct): 36.8 km · 1 h 51 min · 430 m.
- Sin kcal (Samsung Health): jueves 22-oct 5:30 p. m., 14.6 km, 46 min, 19.0 km/h, +150 m, FC 141.
- Recuperación: martes 3-nov (el del flujo 4 paso 17): 41.8 km, 2 h 05 min (>90 min = fuerte), 1,200 kcal → 2,950; zonas Z1 4 % 5, Z2 36 % 45, Z3 44 % 55, Z4 16 % 20; Día B (peso muerto, curl femoral) miércoles 4 a las 8:00.

Corregí respecto al flujo 2: velocidad 21.2 (no 21.3) y «185+ ppm». El flujo 3 menciona un paseo el domingo 18 con objetivo 2,950 que el flujo 2 no tiene: señalado a Francis.

Detector: `text-wrap: pretty` en p/li y `balance` en títulos quita los avisos «straggler» y «unbalanced-heading». Los chats desplazados se dibujan con `.desliza.al-pie` (justify-content: flex-end) para ver el final de la tarjeta; las pestañas de Gym con «Cardio y MTB» activa usan `.sub-tabs.al-final`.

**Why:** Francis tiene que aprobar la guía y las 12 decisiones de la sección «Por confirmar» antes de los mockups.
**How to apply:** reutiliza estas cifras en los mockups y el prototipo del flujo 5. Ver [[flujo-4-receta-plan]], [[flujo-2-calendario]] y [[verificacion-mockups]].
