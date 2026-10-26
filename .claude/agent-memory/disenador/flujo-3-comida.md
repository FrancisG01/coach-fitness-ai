---
name: flujo-3-comida
description: Flujo 3 (registrar una comida, D-37): piezas 1-2 aprobadas el 19-oct-2026; pieza 3 (mockups móvil y web) entregada, 12 decisiones nuevas por confirmar
metadata:
  type: project
---

Archivo: `docs/diseno/mockups/flujo-3-comida.html` (diagrama en 4 carriles + guía de 16 pasos + "Por confirmar"). Sin `<!doctype>/<html>/<head>/<body>`: empieza en `<title>` porque se publica como artefacto. Se genera con `gen_flujo3.py` + `f3_extra.css` en el scratchpad (CSS base tomado de flujo-1 hasta "web"); la copia envuelta para probar va en `scratchpad/ver/`.

Cifras del ejemplo (lunes 19-oct, 1:18 p. m.): antes del almuerzo 862 kcal; almuerzo 677 (habichuelas 152, arroz 205, pollo guisado 150 g 240, aguacate 80); tras el almuerzo 1,539 / P 108 / C 189 / G 41; programado pendiente (merienda 299 + cena 400) 699 → "Con lo programado: 2,238". Suplementos 138 kcal (whey 120 + omega-3 18). Día pasado domingo 18 con paseo: objetivo 2,950 (P 216, C 339, G 82), P −20 g, sodio −120 mg, magnesio "280 de 350 mg".

Resumen Total/Objetivo/Restan: columnas 56/58/80 px con gap 4 y padding 12 para que quepan "Carbohidratos g" y "Cumplido".

Piezas 1-2 aprobadas con sus 12 decisiones (19-oct). Pieza 3: `f3_mock.py` + `f3_mock.css` (ejecutado con exec desde gen_flujo3.py, que ahora también toma el CSS web de flujo-1). Web: buscar/cantidad/crear en un panel en la columna derecha (no diálogo), comida destino con borde de acción. El detector marcó "monotonous-spacing" por una regla `gap: 2px` en el CSS: evitar valores sueltos fuera de la escala.

**Why:** las 12 decisiones nuevas de "Por confirmar" (pieza 3) siguen pendientes de Francis.
**How to apply:** reutiliza estas cifras en los mockups de alta fidelidad y el prototipo del flujo 3. Ver [[verificacion-mockups]].
