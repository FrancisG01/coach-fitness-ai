---
name: flujo-10-bienvenida
description: Flujo 10 (bienvenida SIS-08, D-32, D-33): piezas 1 a 3 aprobadas; prototipo (pieza 4) entregado el 18-oct-2026 y pendiente de aprobar
metadata:
  type: project
---

Archivo: `docs/diseno/mockups/flujo-10-bienvenida.html` (diagrama, cálculo, guía de 11 pasos, lámina de ilustraciones, mockups móvil y web). SVG versionados en `docs/diseno/ilustraciones/bienvenida/01-tu.svg` a `07-tu-plan.svg` (viewBox 112, trazo 2.5, currentColor + `--ilus-secundario` + `--ilus-acento`). Se generan con `gen_flujo10.py` + `pieza3.py` + `ilus.py` + `base.css` en el scratchpad; el HTML y los SVG son la fuente.

Aprobado (D-33): la guía y mis 11 decisiones (pantalla completa, Salir sin confirmar y tarjeta en Hoy, tabla de nivel de actividad, proteína 2.2/2.0/1.8 por objetivo, cuello obligatorio con meta de % de grasa sin Renpho, metas intermedias desde el paso 6, etc.). Francis: nacido 27-jul-1996 (30 años), 2,350 kcal con 172 g de proteína, 270 g de carbohidratos y 65 g de grasas; la revisión del plan es cada 6 semanas desde la primera actividad registrada, nunca una fecha fija. Texto elegido: «Se revisa 6 semanas después de tu primer entreno».

Cálculo: Katch-McArdle 1,718 × 1.55 −10 % = 2,400; Mifflin con 30 años 1,714 (daría 2,390).

Pieza 3 aprobada con sus 7 decisiones. Ajustes pedidos y hechos: la revisión ("6 semanas después de tu primer entreno") va solo en la nota del coach; la tarjeta del plan muestra solo kcal, proteína y "Cómo se calculó"; los macros completos van en la hoja.

Prototipo: `flujo-10-bienvenida-prototipo.html` (JS en `proto10.js` del scratchpad, embebido por `gen_flujo10.py`). Vista teléfono o web, sin conexión, Renpho que falla, ejemplo de Francis o en blanco, retomar en el otro dispositivo. Propuestas mías dentro: −15 % en perder grasa y +5 % en ganar músculo (extremos prudentes del rango de D-32), metas intermedias cada 28 días antes de la fecha final, aviso de ritmo si la meta pide más de 0.5 pp de grasa, 1 % de peso o 1 cm por semana, y la medida «otra» de la meta pasa a ser obligatoria en el paso 6.

**Why:** lo que no está aprobado (prototipo) sigue pendiente de Francis.
**How to apply:** las ilustraciones solo viven en la bienvenida (ADR 0024); reutiliza los SVG en la Fase 3. Ver [[flujo-1-gym]] y [[verificacion-mockups]].

Campos tipados (feedback de Francis, 18-oct-2026, aprobado): fecha con máscara dd/mm/aaaa y selector propio (años → meses → días para nacimiento; en el mes para fechas cercanas), nunca type="date"; números filtrados con decimales por magnitud y coma o punto; hora hh:mm con botón a. m./p. m. Regla general «The Typed Field Rule» añadida a DESIGN.md (Inputs / Fields).
