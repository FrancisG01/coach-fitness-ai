# Base de datos

Diseño en tres niveles (ADR 0010):

1. **Conceptual** (Fase 0.5): [`modelo-conceptual.md`](modelo-conceptual.md), entidades y relaciones por módulo, con diagramas Mermaid que GitHub dibuja solo. `modelo-conceptual.html` es un visor generado desde el Markdown para revisarlo en el teléfono; la fuente es el `.md`.
2. **Lógico** (Fase 1): `schema.dbml`, diagrama oficial (se abre en https://dbdiagram.io), y `diccionario.md`, cada tabla y columna documentada.
3. **Físico** (Fase 1): migraciones de Alembic en `backend/`. El CI verifica que el diagrama coincida con la base real.
