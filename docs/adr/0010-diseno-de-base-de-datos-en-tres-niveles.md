# 0010 — Diseño de la base de datos en tres niveles con DBML, DBeaver y Mermaid

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 10 ("Diseño de la base de datos"), 12 (agente Arquitecto, Definition of Done) y 16 (Fases 0.5 y 1); decisiones D-09, D-10 y D-12

## Contexto

Siete módulos comparten una sola base de datos y el coach lee todos. Francis quiere ver y aprobar el esquema como diagrama, y el diagrama tiene que corresponder siempre a la base real; un diagrama desactualizado es peor que no tenerlo.

## Decisión

- **Tres niveles, como en una empresa de desarrollo:**
  1. **Conceptual:** entidades y relaciones. Se aprueba en la Fase 0.5.
  2. **Lógico:** tablas, columnas, tipos, claves, cardinalidades y normalización. Fase 1.
  3. **Físico:** índices, restricciones, particiones por fecha para series de tiempo y convenciones de nombres. Se implementa con migraciones de Alembic.
- **Herramientas:**
  - DBML en `docs/database/schema.dbml` como diagrama oficial y fuente de verdad del diseño, visible en dbdiagram.io;
  - DBeaver para explorar la base real;
  - Mermaid en `docs/` para diagramas ER por módulo.
- **Siempre sincronizado:** en cada cambio de esquema, el CI regenera el DBML desde la base real y falla si el diagrama y la base no coinciden.
- **Diccionario de datos** en `docs/database/`: cada tabla y columna documentada (qué guarda, unidad, ejemplo).
- **Revisión:** el Arquitecto diseña, el Revisor valida y Francis aprueba el diagrama antes de cada migración importante.

## Alternativas consideradas

El plan no compara otras herramientas de modelado.

## Consecuencias

- Esquema visible y confiable: el CI impide que diagrama y base diverjan.
- Todo cambio de esquema exige migración de Alembic reversible y actualizar el DBML (`CLAUDE.md`, Definition of Done).
- Más trabajo por cada cambio de esquema: diagrama, diccionario y aprobación además de la migración.
