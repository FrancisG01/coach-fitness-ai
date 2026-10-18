# 0008 — Skills de diseño: Impeccable y UX Heuristics; Taste Skill descartada

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 12 ("Skills de programación"), 13 (calidad y pruebas) y 14 (diseño visual y UX, "Skills de diseño"); decisiones D-08, D-09 y D-17

## Contexto

El look "hecho con IA" sale de usar plantillas por defecto: shadcn sin tocar, gradientes violeta, tarjetas iguales, emojis, Inter en todo. Francis define la dirección visual como diseñador, pero los agentes que programan las pantallas necesitan reglas que no puedan romper y una forma automática de detectar diseño genérico y problemas de usabilidad.

## Decisión

- **Impeccable como skill principal:**
  - `PRODUCT.md` y `DESIGN.md`;
  - comandos (typeset, layout, colorize, animate, distill, critique, audit, polish) y Live Mode;
  - detector de diseño genérico de IA, que corre como hook y en el CI.
- **UX Heuristics** para auditar usabilidad (Nielsen más Krug, severidad 0 a 4) al cerrar cada módulo, con prioridad en el modo gym, el registro de comida y la confirmación de capturas.
- **Candado de diseño:** el PM no da por terminada una pantalla con hallazgos del detector ni con problemas de severidad 3 o 4.

## Alternativas consideradas

- **Taste Skill.** Descartada: se solapa con Impeccable y sus reglas chocarían. No se usa ni como inspiración (aclarado el 18-oct-2026).

## Consecuencias

- Reglas de estilo sin conflictos, y diseño y usabilidad verificados de forma automática en cada pull request.
- El detector de diseño es un paso del CI: si falla, no se fusiona.
- Impeccable rinde más en web que en la app Android.
- UX Heuristics no sustituye una auditoría de accesibilidad WCAG; esta se cubre con Lighthouse y la auditoría de Impeccable (RNF-08).
- Ambas skills son de terceros con licencia MIT; quedan en el inventario de licencias.
