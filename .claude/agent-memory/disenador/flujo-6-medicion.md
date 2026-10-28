---
name: flujo-6-medicion
description: Flujo 6 (registrar medición, SAL-01/02/07, D-40, ADR 0026): guía y 18 decisiones aprobadas el 28-oct-2026; Renpho sincroniza solo cada noche y a pedido; pieza 3 = 20 dibujos de Cómo medir
metadata:
  type: project
---

Piezas 1 y 2 (diagrama A-D + guía de 19 pasos + sección 3 «Cómo medir» con las 20 instrucciones + 18 decisiones «Por confirmar») en `docs/diseno/mockups/flujo-6-medicion.html`, rama `docs/flujo-6-medicion`, entregadas el 28-oct-2026 sin commit (Francis revisa y publica). Generadas con `gen_flujo6.py` en el scratchpad de esa sesión (toma CSS, sprite, controles y script del flujo-5-mtb.html actual; añade íconos scale, ruler, target, chevron-up, file-import). El HTML es la fuente. Primer documento completo (`<!doctype html>`, head, body).

Propuesta de Salud: pestañas internas como Gym (Composición, Mediciones, Análisis, Informes); abre en Composición con el peso del día como cifra héroe (lb), media de 7 días, cambio y meta, línea del sync con «Sincronizar ahora», recordatorio de cinta (línea con regla en acento), «Registrar medición» (principal) y «Registrar peso» (secundario), y los campos de Renpho. Mediciones = cinta, historial y calculadas.

Cifras del ejemplo (hoy = miércoles 28-oct-2026):
- Pesajes: 6:42 174.6 lb (con zapatos, «No cuenta»), 6:44 172.2 lb = peso del día (78.1 kg); media 7 días 172.5 lb (22-28 oct: 172.8, 172.6, 172.4, 172.8, 172.6, 172.4, 172.2); −0.6 lb desde el 17-oct (172.8). Meta peso 167.6 lb (76 kg): faltan 4.6.
- Cinta de ejemplo 28-oct (9 medidas): cintura 90.5, cuello 38, hombros 119.5, pecho 98, cadera 99.5, brazo relajado 30.5, contraído 33, muslo 56, pantorrilla 37. Meta cintura 88: faltan 2.5.
- Calculadas 28-oct: IMC 26.4, cintura/estatura 0.53, cintura/cadera 0.91, hombros/cintura 1.32, Marina 21.5 % frente a Renpho 20.4 %.
- Abril (sin cuello, calculado con los datos de ese día): 26.5, 0.53, 0.91, 1.31, «Falta el cuello para el % de grasa de la Marina»; Renpho abril 20.3 %.
- Peso a mano 177.2 lb (+4.6 lb sobre la media 172.6 del escenario de fallo, umbral 4.4 lb). Sync falla desde el lunes 26. CSV: 44 pesajes, 2 nuevos.

Verificación: detector URL `[]` a 390 y 1440; consola limpia; contraste 0 fallos en claro y oscuro con los 6 acentos. Lección: el script de contraste tiene que esperar ~400 ms tras cambiar acento/modo, o mide los botones a mitad de la transición de color (falso 4.47 en «Deshacer»). Etiquetas del diagrama: t1 ≤ ~18 caracteres y t2 ≤ ~24; medir con getBBox contra el rect.

**Why:** Francis aprueba guía y decisiones antes de los mockups, los 20 dibujos SVG (pieza 3, `docs/diseno/ilustraciones/medidas/`) y el prototipo.
**How to apply:** reutiliza estas cifras en las piezas siguientes. Ver [[flujo-5-mtb]] y [[verificacion-mockups]].

Aprobación (28-oct-2026): Francis aprobó la guía y las 18 decisiones con un cambio: Renpho sincroniza solo cada noche y con «Sincronizar ahora»; abrir la app NO sincroniza (el nodo «Abres la app» pasó a «Cada noche · sync automático»; ya aplicado por el coordinador en lámina, plan y PRD, commit 2506e6b). No vuelvas a escribir «al abrir la app (más de 15 min)». Desde entonces la lámina se edita directamente (el coordinador la tocó): no regenerarla con gen_flujo6.py. Publicada por el coordinador en https://claude.ai/artifact/9RmmHHs9Pz7ZbjBUbjbmv4.

Pieza 3, dibujos (28-oct-2026, sin commit): 20 SVG en `docs/diseno/ilustraciones/medidas/` (waist, neck, shoulders, chest, hips, arm-relaxed, arm-flexed, forearm, wrist, thigh, calf, ankle, lower-abdomen, skinfold-chest, -midaxillary, -triceps, -subscapular, -abdomen, -suprailiac, -thigh). Generados con `gen_medidas.py` (se arma con parte_cab/geo/acento/medidas/svg.py del scratchpad de esa sesión): una figura base en cm (172 de alto) de frente con brazos un poco separados, de perfil sin brazo y de espalda con omóplatos; cada dibujo es un encuadre (lienzo 112 como la bienvenida) con grosores compensados por la escala (2.5 figura, 3.5 cinta, 1.5 guías). Variables ilus-secundario e ilus-acento como la bienvenida. Integrados en la lámina (hoja del paso 6 y sección 3) con `reintegrar.py`, que lee los textos de la copia previa `f6-antes-dibujos.html`.
Lecciones: un comentario XML no admite «--»: los SVG de la bienvenida lo tienen y no son XML válido sueltos. Los textos de la sección 3 se buscan desde «<h3>Pliegues…», no desde la primera aparición (el protocolo también dice «Pliegues con plicómetro»).

Aprobación de los dibujos (28-oct-2026): Francis aprobó los 20 dibujos con las 12 decisiones de dibujo, sin cambios. El coordinador corrigió los comentarios de los 7 SVG de la bienvenida (ya son XML válido) e hizo commit (93c94af y siguiente). Siguiente: pieza 4, mockups móvil y web del flujo 6 en la misma lámina.

Pieza 4, mockups (28-oct-2026, sin commit): 36 pantallas móvil y 5 web añadidas a la lámina como secciones 4 y 5 (ids movil y web) con `gen_pieza4.py` del scratchpad; se ejecuta sobre la copia previa `f6-antes-pieza4.html` (se niega a correr si ya existe id="movil"). 15 decisiones nuevas por confirmar; la sección final pasó a «Decisiones». DESIGN.md › «Salud: composición y mediciones (D-40)». Cifras extra: sync nocturno a las 11:00 p. m.; antes de sincronizar, «Último peso · martes 27, 6:51 a. m.» 172.4 lb, media 172.6, −0.4 desde el 17-oct, faltan 4.8; pesajes 17-28 oct: 172.8, 172.6, 172.9, 172.7, 172.5, 172.8, 172.6, 172.4, 172.8, 172.6, 172.4, 172.2. Web: Registrar medición es una página con el panel «Cómo medir» a la derecha que sigue al campo (cambia la nota web del paso 5; por confirmar).

Aprobación de los mockups (28-oct-2026): Francis aprobó las 15 decisiones de la pieza 4. En la 1 decidió dejar el sync solo a las 11:00 p. m. y con «Sincronizar ahora» (sin sync de mañana por ahora). El coordinador cambió el corte de «desde el 17-oct» a la clase `.sin-corte` (no `.nw`) e hizo commit (8c6a7ae y siguiente). Siguiente y última pieza: prototipo `flujo-6-medicion-prototipo.html`.

Pieza 5, prototipo (28-oct-2026, sin commit): `flujo-6-medicion-prototipo.html` con `gen_proto6.py` + `proto6.js` del scratchpad de esa sesión (toma CSS y sprite de la lámina, los 20 dibujos de medidas.json y las reglas de prototipo del flujo 4). Escenarios: «Miércoles 28, 7:04 a. m.» y «Sync falla desde el lunes 26» (se reinicia); interruptor de conexión. Recorrido `recorrido6.cjs` (26 capturas, ~60 comprobaciones) y `contraste-p6.cjs` (11 estados × 12 casos). Lecciones: con una hoja abierta, la pantalla de debajo debe pintarse con el formulario guardado (`formBase = S.formGuardado || S.form`); `.entrada input { font: inherit }` pisa `.cifra` en inputs (añadir `.entrada input.cifra`); al deshacer un borrado, restaurar solo los datos, no la pila de pantallas. Antes de No contar, el pesaje con zapatos (174.6) es el peso del día y la media es 172.9.
