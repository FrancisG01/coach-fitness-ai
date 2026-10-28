---
name: flujo-6-medicion
description: Flujo 6 (registrar medición, SAL-01/02/07, D-40, ADR 0026): piezas 1 y 2 entregadas el 28-oct-2026 para revisión; propuesta de Salud, cifras de ejemplo y 18 decisiones por confirmar
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
