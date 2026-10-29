---
name: flujo-7-coach
description: Flujo 7 (hablar con el coach, COA-01 a COA-04, D-41): piezas 1-2 aprobadas 28-oct (3cacc5a); pieza 3 (40 móvil + 7 web, 14 decisiones por confirmar) entregada 28-oct sin commit; cifras del 28-oct y de la semana 5
metadata:
  type: project
---

Piezas 1 y 2 (diagrama A-D con B en carriles + guía de 25 pasos + 25 decisiones «Por confirmar») en `docs/diseno/mockups/flujo-7-coach.html`, rama `docs/flujo-7-coach`, entregadas el 28-oct-2026 sin commit (el coordinador revisa y publica). Generadas con `f7/gen_flujo7.py` + `f7/diagrama.py` del scratchpad de esa sesión (toman CSS, sprite, controles y script de flujo-6-medicion.html; añaden el ícono `archive` y el bloque CSS «flujo 7»). El HTML es la fuente.

Cifras del ejemplo (hoy = miércoles 28-oct-2026, 8:10 p. m., Día B a las 8:00 a. m.):
- Peso 172.2, media 172.5, −0.6 desde el 17-oct, ~0.4 lb/semana, faltan 4.6 a 167.6; cintura 90.5, faltan 2.5 a 88.
- Comidas 22-28 oct: 2,310 kcal, proteína 166 g (objetivo 172), 5 de 7; fallaron sábado 24 y domingo 25 (sin entreno ni whey). Propuesta: whey 30 g con la merienda los días sin entreno (+25 g, +120 kcal).
- Datos usados: 11 sesiones (5-28 oct.), volumen 4 semanas, 12 pesajes (17-28 oct.), cinta 28-oct, metas, comidas 22-28 oct., 5 paseos (8-22 oct.).
- Semana 5 (2-6 nov.): sentadilla 90→95, banca se queda 90 (8, 8, 7), press militar 3 × 12 con 20 lb, peso muerto 125→130, remo 70→75, jalón 75→80 (desmarcado), búlgara 20 lb igual → «Aprobar 4 de 5 cambios». Recuperación del martes 3: peso muerto 130 → 115.
- Memoria de ejemplo: «En las máquinas subes tras 2 sesiones con 3 × 12» (no uso «curl femoral a prensa» porque la negativa propone prensa 3 × 12, 100 lb, lunes 2).
- Hoy a la 1:15 p. m.: 98 g de proteína, 1,240 de 2,350 kcal (entrada con contexto, conversación «Proteína de hoy»).

Lecciones: con `.desliza.al-pie` lo de arriba de una respuesta larga se recorta, y la anotación puesta en la línea del coach desaparece: ponla en el párrafo visible. La anotación de la pestaña tapa el punto de pendientes: usa `anota izq`. En el diagrama, el t2 de los nodos de inicio (fondo suave) da 4.44:1 en oscuro con Mango: va en texto principal. Una entrada del chat junto a «Detener» necesita `min-width: 0` y elipsis.

Verificación: detector URL `[]` a 390 y 1440; consola limpia; contraste 0 fallos (12 casos, incluye texto SVG); etiquetas del diagrama dentro de sus cajas.

Piezas 1-2 aprobadas el 28-oct-2026 con sus 25 decisiones (commit 3cacc5a). Pieza 3 (28-oct, sin commit): sección 3 «Mockups móvil» (40 teléfonos en 5 grupos: las 25 de la guía sin anotaciones + 15 estados nuevos) y 4 «Mockups web» (7 escritorios); «Decisiones» con 14 nuevas por confirmar arriba y las 25 aprobadas debajo. Generada con `f7p3/gen_p3.py` del scratchpad de esa sesión a partir de la lámina de las piezas 1-2: reutiliza los teléfonos de la guía quitando `.anota`, toma Cintura de flujo-6 (figura 27). El HTML es la fuente.
Cifras nuevas de la pieza 3: Día B del 28 (52 min, 10,860 lb, 15 series: peso muerto 125, remo 70, jalón 75, curl bíceps 25, curl femoral 60); semana 5 en Comida (semana tipo 2, sin entreno +120 kcal por el whey); recuperación del martes 3: peso muerto 130 → 115, curl femoral 60 → 50 (decisión abierta: redondear al más cercano daría 55); revisión del lunes 2: media 172.1 lb, proteína 6 de 7, sin propuestas; web Salud: «No tengo pesajes del 1 al 16 de octubre».
Lecciones: en la web, los párrafos del coach dentro de la columna de 8 necesitan `max-width: 60ch` (68ch seguía dando «line-length» a 1440). El gráfico de la web se dibuja con viewBox de 520 para que los rótulos queden a 13 px reales. `.cab-hoja` solo tiene estilo dentro de `.hoja`: en `.panel-w` hay que darle columna. En la hoja de una cifra, el campo no va enfocado al abrir.
Verificación pieza 3: consola limpia (390 y 1440, claro y oscuro), detector URL `[]` a 390 y 1440, contraste 0 fallos con 6 acentos en los dos modos, sin desborde horizontal a 390.

**Why:** Francis aprueba guía y decisiones antes de los mockups y el prototipo del flujo 7.
**How to apply:** reutiliza estas cifras en las piezas siguientes. Ver [[flujo-6-medicion]], [[flujo-5-mtb]] y [[verificacion-mockups]].
