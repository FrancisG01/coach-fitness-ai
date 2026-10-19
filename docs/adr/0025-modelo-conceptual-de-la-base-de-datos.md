# 0025 — Modelo conceptual de la base de datos

- Fecha: 19-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 5 (requisitos), 10 ("Diseño de la base de datos"), 16 (Fases 0.5 y 1) y 20 (D-36); `docs/prd.md` §2 y §4; ADR 0004, 0006, 0010, 0012, 0018, 0021 y 0023; `docs/database/modelo-conceptual.md`

## Contexto

La ADR 0010 fija tres niveles de diseño de la base de datos y pide aprobar el conceptual en la Fase 0.5, antes de escribir el DBML y las migraciones de la Fase 1. Con el PRD v1.11, las decisiones D-24 a D-35 y los flujos 1, 2 y 10 aprobados, ya existía el detalle suficiente para definir qué guarda el sistema y cómo se relaciona.

## Decisión

El modelo conceptual aprobado vive en [`docs/database/modelo-conceptual.md`](../database/modelo-conceptual.md): 73 entidades en 9 módulos, con diagramas Mermaid por módulo, patrones transversales, trazabilidad requisito → entidad y la lista de lo que se calcula sin guardarse. Es la entrada del modelo lógico y físico de la Fase 1.

Reglas de modelado que fija (las 18 de la sección 14 del documento, todas aprobadas por Francis):

1. Mediciones corporales como catálogo de **tipos de medida** más **valores medidos**, no una tabla ancha.
2. Las **medidas calculadas** (SAL-07) se guardan como mediciones de fuente "calculada".
3. Alergias y lista de evitar como **preferencias de alimento** sobre un grupo de alimentos o un alimento.
4. Lesiones y condiciones como **condición de salud** con fecha de inicio y fin.
5. Toda escritura del coach pasa por una **propuesta** con estado (incluye el paseo desde captura y el alimento desde etiqueta).
6. La **sesión** guarda el estado de las series y el **registro de eventos** con hora real; manda el evento.
7. **Rutina** con orden de rotación; sin entidad "programa" en la v1.0.
8. **Cita y análisis de sangre** son un mismo registro con estado.
9. **Suplementos** con aporte propio por dosis, sumado en una fila aparte del desglose.
10. Crudo y cocido con un **factor por alimento** y una marca por registro.
11. **Objetivo nutricional** con vigencia; el porcentaje de kcal del paseo es un parámetro suyo.
12. Una sola entidad **meta** (intermedia, por medida, por fuerza); los hitos apuntan a una meta o a un récord.
13. Una sola entidad **aviso** para el coach y el sistema.
14. **Llamada al modelo** por cada uso de la API y **presupuesto de IA** por mes.
15. Health Connect como **resumen diario** y **sesión de sueño**, sin muestras minuto a minuto.
16. **Dispositivo** como entidad para la sincronización y las notificaciones.
17. Catálogo y elementos propios en la **misma entidad**, con dueño.
18. **Nombres técnicos en inglés** propuestos en el documento para la Fase 1.

Patrones que aplican a todas las entidades personales: `user_id` y RLS (ADR 0012); UUID generado en el cliente, hora real, dispositivo de origen, versión y lápidas para la sincronización (plan §10, ADR 0018); unidades canónicas con `entered_unit` (ADR 0023); fecha local además del instante; historial en lugar de sobrescritura; archivos en almacenamiento privado.

## Alternativas consideradas

Las alternativas de cada decisión están en la sección 14 del documento: tabla ancha de mediciones, medidas calculadas al vuelo, dos alimentos por crudo y cocido, entidad "programa", tres tablas de metas, tablas "mis ejercicios" separadas.

## Consecuencias

- La Fase 1 escribe `schema.dbml`, el diccionario de datos, las políticas RLS y las migraciones a partir de este modelo; lo que falta está en su sección 15 (tipos, claves, índices, particiones, dimensión del vector, esquema SQLite y protocolo de sincronización, datos semilla).
- Cualquier entidad o relación nueva que pida un requisito posterior se añade primero al modelo conceptual y después al DBML.
- El visor `docs/database/modelo-conceptual.html` se genera desde el Markdown; la fuente es el `.md`.
