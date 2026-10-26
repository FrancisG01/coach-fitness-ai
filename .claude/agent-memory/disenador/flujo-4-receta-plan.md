---
name: flujo-4-receta-plan
description: Flujo 4 (crear receta o plan, D-38): revisión aprobada el 26-oct-2026 con sus 14 decisiones y las cifras de ejemplo para los mockups
metadata:
  type: project
---

Revisión del flujo 4 aprobada por Francis el 26-oct-2026 (D-38, plan v1.17, PRD v1.13, modelo conceptual 1.2). Siguiente: diagrama, guía y mockups.

Decisiones que más afectan al dibujo:
- Receta: crudo o cocido por ingrediente ("Crudo" de fábrica), rendimiento = porciones, SIN peso de la olla; se agrega SOLO en porciones (Francis cambió mi propuesta de gramos cocidos). Editar = una sola receta con versiones invisibles; "Guardar como receta nueva" para variantes.
- Revisión de propuesta = pantalla propia compartida con el flujo 7 (no diálogo): casillas marcadas, "Otra opción" por comida, "Aprobar 31 de 35 comidas", aviso con Deshacer.
- Plan de mes = 4 semanas de 2 semanas tipo, materializadas al aprobar; cabecera "Semana tipo 1/2".
- Vista de mes de Comida: punto lleno = registro, contorno = solo programado, sin cifras.
- Planes también pasan a Sonnet desde el 80 % del tope, con aviso.

Cifras de ejemplo (objetivo 2,350, P 172 / C 270 / G 65; semana 4 del 26-oct al 1-nov: Día A lun 26, B mié 28, C vie 30 a las 8:00; análisis de sangre jue 29 a las 7:30, en ayunas):
- Receta "Pechuga al horno con vegetales", 6 porciones: pechuga cruda 900 g (1,080 kcal), papa cruda 900 g (693), zanahoria cruda 300 g (123), cebolla cruda 200 g (80), aceite de oliva 3 cdas · 40 g (354). Total 2,330 kcal, P 225 / C 205 / G 65. Por porción: 388 kcal, P 38 / C 34 / G 11.
- Combo "Mi desayuno de avena": 625 kcal, P 31 / C 82 / G 19.
- Plan del lunes 26: desayuno 625, media mañana mango 99 + whey 120, almuerzo 677, merienda 397 (nueces 30 g), cena 400, resto de suplementos 18 → 2,336 kcal, P 177 / C 269 / G 65. Es también el día de referencia del Anexo A.7.
- Plan de mes 26-oct al 22-nov, "Con pollo y piña, sin mariscos"; revisión de 6 semanas el 16-nov; "Aprobar 31 de 35 comidas" en la semana tipo 1 (cenas de martes y jueves con "Otra opción").
- Evitar de ejemplo: "Mariscos · gusto" y "Maní · alergia". La alergia es SOLO un ejemplo de mockup: Francis no tiene alergias.
- Costo estimado: día ≈ $0.15, semana ≈ $0.35, mes ≈ $0.55.

Piezas 1 y 2 (diagrama en carriles + guía de 19 pasos) en `docs/diseno/mockups/flujo-4-receta-plan.html`, generadas el 26-oct con `gen_flujo4.py` + `gen_base.py` + `gen_diagrama.py` + `gen_pasos.py` + `f4_extra.css` (scratchpad de esa sesión; toman CSS, sprite, controles y script de flujo-3-comida.html). Detector: `.nota.con-icono .i { margin-top: 1px }` disparó "monotonous-spacing" (los valores sueltos de 1-2 px lo disparan); un botón de pie con texto largo en dos columnas dio "cramped-padding": el pie de la revisión va apilado (principal arriba, Descartar de texto abajo). Por confirmar (7, pendientes): botón cuenta los 28 días (132 de 140) y cada semana tipo su cuenta; tira de 7 días; aviso de copiar sin contar la comida saltada por hora; evitar solo alimento o grupo; tomas sin casilla; pedir plan sin conexión activo; la semana muestra Gym y Salud.

**Why:** Francis aprobó estas cifras y reglas antes de dibujar; cambiarlas obliga a revisar plan, PRD y modelo.
**How to apply:** úsalas tal cual en diagrama, guía, mockups y prototipo del flujo 4. Ver [[flujo-3-comida]] y [[verificacion-mockups]].
