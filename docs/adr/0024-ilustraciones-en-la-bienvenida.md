# 0024 — Ilustraciones solo en la bienvenida

- Fecha: 18-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 5 (bienvenida y perfil, SIS-08) y 20 (D-28); `docs/prd.md` §2 (criterios de aceptación de D-28) y §9, decisión 17; `DESIGN.md` (Íconos, Estados vacíos); `docs/diseno/tokens.json`; ADR 0017 (dirección visual B2) y ADR 0022 (íconos Tabler)

## Contexto

DESIGN.md prohíbe ilustraciones, emojis y mascotas: los estados vacíos usan un ícono de Tabler de 32 px y texto. La regla evita el aspecto de interfaz hecha con IA y mantiene los datos como protagonistas.

Con D-28 entra la bienvenida de primer uso (SIS-08): 7 pasos, unos 3 minutos, con preguntas personales (objetivo, actividad, salud, punto de partida). Francis pidió una ilustración vectorial en cada paso para que el recorrido se sienta acompañado y cada paso se reconozca de un vistazo.

Hay que decidir si la regla se rompe, dónde y con qué límites para que las ilustraciones no rompan la dirección B2.

## Decisión

1. **Dónde:** solo en los 7 pasos de la bienvenida, una ilustración por paso. En el resto de la app sigue la regla "sin ilustraciones, emojis ni mascotas", incluidos los estados vacíos.
2. **Estilo:** SVG de trazo lineal, coherente con Tabler outline (ADR 0022): extremos y uniones redondeados y un grosor de trazo que, a su tamaño, se lea como el de los íconos. Sin rellenos degradados, sin sombras, sin personajes ni mascotas.
3. **Color:** solo de `docs/diseno/tokens.json`, aplicado con `currentColor` y variables CSS (o su equivalente en React Native). Las ilustraciones cambian solas con el modo claro u oscuro y con el acento elegido; nunca llevan un color suelto. El acento se usa con la misma medida que en el resto de la interfaz (One Accent Rule): un detalle, no la base del dibujo.
4. **Quién las hace:** Claude, como SVG versionados en el repositorio, con la misma revisión de diseño que cualquier pantalla. Francis las aprueba en los mockups del flujo 10.
5. **Accesibilidad:** son decorativas; no llevan información que no esté en el texto del paso y se ocultan a los lectores de pantalla.

## Alternativas consideradas

- **Mantener la regla y componer cada paso con íconos de Tabler.** Coherente y sin trabajo extra, pero un ícono de 32 px no da el tono de bienvenida que Francis pidió. Descartada por decisión de Francis.
- **Ilustraciones también en los estados vacíos.** Más presencia de marca, pero repartiría dibujos por toda la app, competiría con los datos y acercaría la interfaz al aspecto genérico que la regla evita. Descartada.

## Consecuencias

- DESIGN.md registra la excepción en la regla de estados vacíos, remitiendo a este ADR.
- El flujo 10 de la Fase 0.5 incluye las 7 ilustraciones en sus mockups, en claro y oscuro y con al menos dos acentos.
- El detector de diseño y la revisión visual comprueban que las ilustraciones solo usan variables de tokens y que no aparecen fuera de la bienvenida.
- Si más adelante se quiere una ilustración en otra pantalla, hace falta una decisión nueva.
