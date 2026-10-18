# 0021 — Embeddings de la memoria del coach con un modelo local en el servidor

- Fecha: 18-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 8 (coach IA y memoria), 9 (stack), 11 (seguridad y privacidad) y 18 (costos de operación); PRD, secciones 6 y 9; decisiones D-06, D-15, D-20 y D-21

## Contexto

La memoria del coach usa búsqueda semántica con pgvector para recordar conversaciones viejas, decisiones y resúmenes semanales (D-06, [ADR 0006](0006-coach-con-herramientas-y-memoria.md)). Para eso cada texto se convierte en un vector (embedding) que se guarda en Postgres.

Anthropic no ofrece un modelo de embeddings, así que los créditos de API del plan Max (D-15) no cubren esta parte. Los textos que se convierten son conversaciones sobre salud, peso, comidas y análisis de sangre.

El servidor Oracle `coach` (D-20) es ARM, con 2 núcleos y 11 GB de RAM, y está dedicado al sistema.

## Decisión

- Los embeddings se generan con un **modelo local que corre en el servidor Oracle**, dentro del despliegue con Docker. Ningún texto sale del servidor para esto.
- El modelo concreto se elige en la **Fase 1**, con un benchmark sobre textos en español del dominio. Se mide:
  - calidad de búsqueda;
  - velocidad en ARM;
  - RAM ocupada.
- La generación corre en segundo plano (ARQ), no en el camino de la respuesta del chat.

## Alternativas consideradas

- **Servicio externo de embeddings (de pago, de otro proveedor).** Descartado:
  - un tercero vería conversaciones con datos de salud;
  - suma un costo mensual que los créditos de Max no cubren.

## Consecuencias

- Costo de API cero para la memoria semántica. A cambio, el modelo consume RAM y CPU del servidor, que comparte con Postgres, Redis, el backend y Caddy. El benchmark de la Fase 1 debe confirmar que todo cabe con margen.
- La dimensión del vector la fija el modelo elegido y condiciona la columna `vector(n)` de pgvector. Cambiar de modelo más adelante obliga a una migración y a regenerar todos los embeddings.
- El modelo se fija por versión en la imagen Docker, para que los vectores sean reproducibles.
- Si el sistema se abre al público (sección 11), hay que revisar si el servidor aguanta la carga o si conviene un servidor aparte para los embeddings.
