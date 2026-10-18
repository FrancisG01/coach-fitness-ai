# 0004 — Base de alimentos y unidades de medida

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 5 ("Base de alimentos y unidades de medida", NUT-01, NUT-02, NUT-04) y 11 (licencias al abrir al público); decisiones D-03 y D-04

## Contexto

Con el registro nutricional dentro del sistema (ADR 0003), hace falta una base de alimentos con micronutrientes completos que incluya comida dominicana, y una forma de registrar en la unidad que Francis use en el momento (gramos, libras, mililitros, porciones caseras).

## Decisión

- **Fuentes de la base inicial:**
  - USDA FoodData Central: micros completos, dominio público.
  - Tabla INCAP como apoyo para alimentos locales.
  - Open Food Facts para productos con código de barras.
  - Registros manuales de Francis.

  Cada alimento guarda su fuente.
- **Nutrientes por 100 g.** Todo cálculo se hace en gramos.
- **Unidades de registro:**
  - masa: g, kg, lb (453.592 g) y oz (28.3495 g);
  - volumen: ml y L, multiplicados por la densidad del alimento. Si falta la densidad, se asume 1.00 g/ml y se marca como estimado;
  - porciones caseras como opción extra (taza, cucharada, unidad, cucharón), con su equivalencia en gramos por alimento.
- **Crudo y cocido** con factores de rendimiento; las recetas se calculan desde sus ingredientes.

## Alternativas consideradas

El plan no compara otras fuentes de datos para la base. La alternativa de depender de Cronometer se descarta en la ADR 0003. El escáner de código de barras queda en el backlog, fuera de la v1.0 (sección 4).

## Consecuencias

- Micronutrientes completos y libertad de unidad al registrar, con un solo modelo de cálculo (por 100 g).
- El modelo de datos debe guardar fuente, densidad, porciones caseras y factores de rendimiento por alimento.
- Las conversiones de unidades y los nutrientes de recetas llevan pruebas unitarias (sección 13).
- Licencias pendientes si la app se abre al público (sección 11): Open Food Facts es ODbL (atribución y compartir datos derivados), USDA solo pide citar la fuente y la tabla INCAP necesita confirmar permiso de uso y redistribución.
