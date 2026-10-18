# 0009 — Fase 0.5 de Diseño UX: ninguna pantalla se programa sin mockup aprobado

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 10 (diseño de la base de datos, modelo conceptual), 12 (Definition of Ready), 14 ("Fase 0.5: Diseño UX antes de programar") y 16 (fases); decisiones D-08, D-09, D-10 y D-17

## Contexto

Francis es diseñador gráfico y dueño del producto. Programar pantallas sin un diseño aprobado lleva a rehacer trabajo y a interfaces genéricas. Las metas de uso (una serie en 3 toques o menos, una comida en 30 segundos o menos) dependen del diseño de cada flujo.

## Decisión

Entre la Fase 0 (fundaciones) y la Fase 1 (núcleo) va una Fase 0.5 de Diseño UX. Cada flujo clave se entrega en cuatro piezas:

1. diagrama del flujo;
2. guía paso a paso en imágenes, con anotaciones de qué tocas y qué pasa;
3. mockups de alta fidelidad en web y móvil;
4. prototipo navegable.

Los flujos son: entrenar en el gym, programar entrenamientos, registrar una comida, crear receta o plan, registrar paseo MTB, registrar medición, hablar con el coach, empezar el día y entrenar desde el reloj. En la misma fase se aprueba el modelo conceptual de la base de datos (ADR 0010).

Regla: ninguna pantalla se programa sin su mockup aprobado. Está en la Definition of Ready y en `CLAUDE.md`.

## Alternativas consideradas

El plan no plantea alternativas a esta fase. Solo indica que Francis puede refinar los mockups en Figma si lo prefiere.

## Consecuencias

- Diseño primero: el código parte de flujos que Francis ya recorrió y aprobó en el prototipo.
- Al aprobar un flujo, Impeccable lo usa como referencia al programar.
- Los flujos de la Fase 0.5 son la base de las pruebas E2E con Playwright (sección 13).
- El inicio de la programación se retrasa hasta tener los flujos aprobados.
