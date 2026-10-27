---
name: flujo-3-comida
description: Flujo 3 (registrar una comida, D-37) aprobado completo el 26-oct-2026; cifras del día de ejemplo y patrones que reutiliza el flujo 4
metadata:
  type: project
---

Flujo 3 aprobado completo por Francis el 26-oct-2026 (piezas 1-3 y prototipo; D-37, plan v1.16). Archivos: `docs/diseno/mockups/flujo-3-comida.html` y `flujo-3-comida-prototipo.html`. Sin `<!doctype>/<html>/<head>/<body>`: empiezan en `<title>` porque se publican como artefacto. Se generaban con scripts Python en el scratchpad de aquella sesión (`gen_flujo3.py`, `f3_mock.py`); el HTML del repo es la fuente.

Cifras del ejemplo (lunes 19-oct, 1:18 p. m.): desayuno 625 (avena 80 g 303, 3 huevos 215, guineo 105, café 2; P 31 C 82 G 19); media mañana mango 99; almuerzo 677 (habichuelas 152, arroz 205, pollo guisado 150 g 240, aguacate 80; P 51 C 79 G 17); tras el almuerzo 1,539 / P 108 / C 189 / G 41; merienda programada 299 (yogur 118, piña 83, nueces 15 g 98) + cena 400 (tilapia 192, yuca 168, ensalada 40) → "Con lo programado: 2,238". Suplementos 138 kcal (whey 120 + omega-3 18). Día pasado domingo 18 con paseo: objetivo 2,950 (P 216, C 339, G 82). "Pollo guisado" es un ALIMENTO (160 kcal, P 23.9, C 2.4, G 5.4 por 100 g) y es el ejemplo de "Faltan datos" (sin potasio ni zinc); no convertirlo en receta (decisión de Francis, 26-oct).

Cambios tras probar el prototipo en Android: botón + flotante con menú en el día del teléfono; hojas con campo se anclan arriba al tocar (no se detecta el teclado); barras de nutrientes de 4 px; Restan con ícono solo si el exceso pasa del 5 %.

**Why:** el flujo 4 y los demás de Comida reutilizan estas cifras y patrones.
**How to apply:** no tocar el flujo 3 aprobado; reutiliza sus cifras en mockups nuevos. El detector marcó "monotonous-spacing" por un `gap: 2px` suelto: evita valores fuera de la escala. Ver [[flujo-4-receta-plan]] y [[verificacion-mockups]].
