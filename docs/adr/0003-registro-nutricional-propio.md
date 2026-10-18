# 0003 — Registro nutricional propio; Cronometer opcional

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 1, 2, 4 (alcance), 5 (módulo Nutrición, NUT-01 a NUT-09) y 7 (integraciones); decisiones D-03 y D-04

## Contexto

El plan de abril contaba con Cronometer para la nutrición, pero Francis nunca llegó a usarlo. Al verificar la integración (sección 7), Cronometer no ofrece API para usuarios individuales: solo a socios seleccionados, más la exportación CSV. Sin API, el coach no podría leer la nutrición de forma automática.

## Decisión

El registro de comidas vive dentro del sistema, desde cero:

- base de alimentos propia (ADR 0004);
- registro de comidas, recetas y planes;
- totales diarios contra objetivos por tipo de día.

Cronometer queda como fuente opcional mediante importación CSV (NUT-08, prioridad W, fuera de la v1.0).

## Alternativas consideradas

- **Integrar Cronometer por API.** Descartado: no hay API pública. La API de Cronometer figura como "fuera de la v1.0" en la sección 4.
- **Usar Cronometer como herramienta principal e importar su CSV.** Queda solo como opción secundaria: obligaría a registrar fuera del sistema y a importar a mano.

## Consecuencias

- El coach tiene acceso directo y completo a la nutrición, junto con el gym, la salud y los suplementos.
- Hay que construir el módulo de Nutrición completo (Fase 4) y una base de alimentos con alimentos dominicanos.
- La meta de registrar una comida en 30 segundos o menos (objetivo O1) depende del diseño del módulo: alimentos frecuentes y recientes, porción habitual y total del plato mientras se arma (NUT-09).
- La importación CSV de Cronometer queda en el backlog para después de la v1.0.
