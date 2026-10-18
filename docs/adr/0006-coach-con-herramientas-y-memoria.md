# 0006 — Coach con herramientas sobre la base de datos y memoria con pgvector; Obsidian solo para documentación

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 5 (módulo Coach IA, COA-01 a COA-04), 8 (coach IA, memoria y Obsidian), 9 (stack) y 12 ("Memoria del proyecto"); decisiones D-02, D-06 y D-15

## Contexto

El enfoque anterior usaba archivos Markdown sueltos como memoria del coach. Obsidian se volvió popular para IA porque un agente puede leer y escribir notas enlazadas como memoria de largo plazo. Pero los datos de Francis son números con fechas que hay que consultar, sumar y graficar, y llenar el contexto del modelo con archivos no escala.

## Decisión

- **El coach consulta la base de datos con herramientas (tool use)**, como un analista, en lugar de leer archivos:
  - consultar mediciones, sesiones, volumen por músculo, nutrición por rango de fechas, suplementos y análisis;
  - crear borradores de plan, rutina o sesión que Francis aprueba antes de guardar.
- **Contexto fijo:** perfil, etapa actual, objetivos y reglas del coach.
- **Memoria:**
  - tabla de decisiones y preferencias;
  - resúmenes semanales automáticos;
  - búsqueda semántica con pgvector para recordar conversaciones viejas.
- **Proactivo:** un job semanal revisa tendencias y deja alertas en el dashboard.
- **Obsidian:** no es base del sistema ni memoria del coach. La documentación en `docs/` se escribe compatible (enlaces `[[...]]`) y Francis puede abrirla como bóveda si quiere.

## Alternativas consideradas

- **Obsidian como base de datos del coach.** Descartado: Markdown no consulta, suma ni grafica; PostgreSQL sí.
- **Obsidian como memoria del coach.** Descartado: la tabla de memoria más pgvector hace lo mismo y es accesible desde web y móvil.
- **Archivos `.md` en Cursor.** Descartado en la ADR 0001.

## Consecuencias

- El coach tiene el panorama completo sin llenar su contexto, y cada respuesta puede citar los datos que usó (objetivo O3).
- Las herramientas filtran por `user_id` como cualquier otra consulta (ADR 0012).
- Ningún cambio se guarda sin aprobación: las herramientas de escritura solo crean borradores (COA-04).
- Hacen falta evals del coach en el CI cada vez que cambian el prompt o las herramientas, y control de costo con tope mensual y registro de tokens (sección 8).
- Obsidian queda como herramienta opcional de Francis, no como pieza crítica.
