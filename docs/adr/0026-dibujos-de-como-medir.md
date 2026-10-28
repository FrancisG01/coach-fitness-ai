# 0026 — Dibujos de cómo medir con la cinta

- Fecha: 28-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 5 (medidas corporales, SAL-02) y 20 (D-40); `docs/prd.md` §2 (criterios de SAL-01, SAL-02 y SAL-07) y §9, decisión 28; `DESIGN.md` (Estados vacíos); ADR 0024 (ilustraciones solo en la bienvenida), ADR 0022 (íconos Tabler) y ADR 0017 (dirección visual B2)

## Contexto

El ADR 0024 limita las ilustraciones a los 7 pasos de la bienvenida y pide una decisión nueva para cualquier otra pantalla.

Con la revisión del flujo 6 (registrar medición, D-40), cada medida con cinta lleva una instrucción de "cómo medir". Medir siempre en el mismo punto es lo que hace comparables las mediciones: 2 cm de cintura pueden ser solo la cinta en otro sitio. Claude propuso dar la instrucción solo en texto para respetar el ADR 0024. Francis decidió que lleve un dibujo del cuerpo, para que el usuario sepa dónde va la cinta sin tener que interpretar una frase.

## Decisión

1. **Dónde:** en la hoja "Cómo medir" que abre el ícono de información de cada medida con cinta (perímetros y pliegues de SAL-02), en el registro de medición (flujo 6) y en el punto de partida de la bienvenida (paso 6). Un dibujo por medida. No aparecen en listas, gráficos, estados vacíos ni en ninguna otra pantalla.
2. **Qué muestran:** una figura humana neutra de trazo lineal (sin rostro, sin rasgos, sin personaje), de frente, de perfil o de espalda según la zona, con la línea de la cinta o el punto del pliegue marcado. La figura es una sola para todos los usuarios; las medidas que cambian por sexo (cadera) lo dicen en el texto.
3. **Estilo y color:** los del ADR 0024: SVG de trazo lineal coherente con Tabler outline, colores solo de tokens con `currentColor` y variables, cambian con el modo y el acento. La figura va en texto secundario y la cinta o el punto en acento: es el único detalle de color (One Accent Rule).
4. **Texto:** cada dibujo va con una instrucción de una o dos líneas que dice lo mismo ("A la altura del ombligo, al final de una exhalación normal"). El dibujo ayuda a ubicar; el texto es la referencia.
5. **Accesibilidad:** a diferencia de la bienvenida, el dibujo sí informa, así que lleva un texto alternativo igual a la instrucción.
6. **Quién los hace:** Claude, como SVG versionados en `docs/diseno/ilustraciones/medidas/`, con la misma revisión de diseño que cualquier pantalla. Francis los aprueba en los mockups del flujo 6.

## Alternativas consideradas

- **Solo texto.** Respeta el ADR 0024 sin excepción y no da trabajo extra, pero una frase como "punto medio entre el hombro y el codo" se interpreta distinto cada vez. Descartada por decisión de Francis.
- **Dibujo siempre visible junto a cada campo.** Más directo, pero con 13 perímetros y 7 pliegues llenaría la pantalla de figuras y los datos dejarían de ser protagonistas. Descartada: el dibujo vive en la hoja "Cómo medir".
- **Fotos de una persona midiendo.** Más realistas, pero no siguen el modo ni el acento, no encajan con la dirección B2 y piden un modelo o un banco de imágenes. Descartada.

## Consecuencias

- El ADR 0024 sigue vigente; este ADR es su segunda excepción permitida y DESIGN.md la registra junto a la de la bienvenida.
- El flujo 6 de la Fase 0.5 incluye 20 dibujos (13 perímetros y 7 pliegues), en claro y oscuro y con al menos dos acentos.
- El detector de diseño y la revisión visual aceptan estos SVG solo dentro de la hoja "Cómo medir".
