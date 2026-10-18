# 0002 — Stack: Python/FastAPI y PostgreSQL, React con Vite, Expo para Android

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 7 (integraciones), 9 (stack tecnológico) y 10 (arquitectura y datos); decisiones D-01, D-02, D-06 y D-18

## Contexto

La plataforma (ADR 0001) necesita un backend que maneje datos numéricos con fechas, cálculos (volumen por músculo, conversiones, nutrientes de recetas) y la sincronización con Renpho, cuya única vía automática es una librería Python no oficial (`renpho-py`). Web y app Android deben hablar con la misma API y compartir tipos para no desalinearse.

## Decisión

- **Backend:** Python 3.12 con FastAPI y Pydantic v2; SQLAlchemy 2 y Alembic para el ORM y las migraciones.
- **Base de datos:** PostgreSQL 16 con pgvector.
- **Tareas en segundo plano:** Redis con ARQ.
- **Web:** React con TypeScript y Vite, con TanStack Router y TanStack Query.
- **Android:** Expo (React Native) con TypeScript.
- **Cliente de API:** generado desde el OpenAPI de FastAPI, en un paquete compartido.
- **Monorepo:** pnpm con Turborepo.

El detalle completo de capas (estilos, gráficos, pruebas, calidad, infraestructura) está en la sección 9 del plan.

## Alternativas consideradas

El plan no compara otros stacks para el backend, la web o el móvil. Lo único que la sección 9 descarta de forma explícita es React Native para el reloj: Wear OS no lo ejecuta, y eso lleva a la app nativa de la ADR 0018.

## Consecuencias

- Renpho y el análisis de datos quedan en el mismo lenguaje que el backend.
- FastAPI genera OpenAPI automáticamente; el cliente generado mantiene web y móvil alineados, y las pruebas de contrato detectan cambios rompientes (sección 13).
- PostgreSQL guarda datos relacionales, series de tiempo y la memoria semántica del coach en un solo motor (ADR 0006).
- Dos lenguajes en el repositorio (Python y TypeScript), más Kotlin para el reloj: cada uno con su lint, tipos y tests en el CI.
- Cambiar cualquier pieza de este stack exige un ADR nuevo.
