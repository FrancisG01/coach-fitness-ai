# 0023 — Unidades preferidas por usuario y almacenamiento en kg, cm y m

- Fecha: 18-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 5 (unidades preferidas y SIS-07), 6 (RNF-10) y 20 (D-24); `docs/prd.md` §9, decisión 13; requisitos GYM-04, GYM-05, GYM-07, SAL-01, SAL-02, CAR-01, COA-01, NUT-02; ADR 0016 (backlog cerrado)

## Contexto

El plan decía "unidades métricas por defecto con conversión" (RNF-10) sin precisar qué se convierte ni dónde se elige. En comida ya se registra en g, kg, lb, oz, ml o L en cada registro (NUT-02, D-04).

El 18-oct-2026 Francis pidió manejar libras y kilos para el peso, y cm, metros, pulgadas y pies para las medidas corporales, con una sección en Ajustes que guarde la preferencia. Además pidió km y millas para la distancia. El backlog de la v1.0 estaba cerrado (D-16); Francis decidió que esto entra en la v1.0.

Hay que decidir dos cosas: qué opciones ve el usuario y cómo se guardan los datos para que cambiar de unidad no los dañe.

## Decisión

**Opciones del usuario (SIS-07)**, guardadas en su cuenta y aplicadas en web, móvil, reloj y coach:

| Magnitud | Opciones | De fábrica |
| --- | --- | --- |
| Peso corporal | kg · lb | lb |
| Cargas del gym | kg · lb | lb |
| Estatura | m · cm · pies y pulgadas | cm |
| Perímetros | cm · pulgadas | cm |
| Distancia | km · millas | km |

La velocidad y el desnivel siguen a la distancia. La comida sigue eligiendo la unidad en cada registro.

**Almacenamiento:**

1. Toda masa se guarda en kg, toda longitud corporal en cm y toda distancia en m, con precisión suficiente para que la ida y vuelta no cambie la cifra mostrada (por ejemplo, 45 lb → 20.4117 kg → 45.0 lb). El tipo y la escala de cada columna se fijan en el diseño de la base de datos de la Fase 1.
2. Cada registro escrito a mano guarda también la unidad en que se escribió (`entered_unit`), para auditoría y para importaciones (Strava puede venir en millas, Renpho y Health Connect vienen en el SI).
3. La conversión ocurre en un solo módulo compartido por plataforma: Python en el backend y un paquete TypeScript en `packages/` para web y móvil; el reloj recibe la preferencia por Data Layer y usa la misma tabla de factores. Factores: 1 lb = 0.45359237 kg; 1 in = 2.54 cm; 1 ft = 30.48 cm; 1 mi = 1,609.344 m.
4. Cambiar la preferencia no reescribe datos: solo cambia cómo se muestran y en qué unidad se escriben los nuevos.
5. En el gym, los incrementos, la rampa (GYM-05) y la sugerencia de progresión se redondean a pasos de disco de la unidad elegida (2.5 o 5 lb, 1.25 o 2.5 kg). La configuración exacta de discos disponibles queda para la Fase 2.
6. Las herramientas del coach devuelven las cifras ya convertidas a la preferencia del usuario y con su unidad, para que el modelo no convierta por su cuenta.

## Alternativas consideradas

- **Guardar en la unidad que escribió el usuario, sin unidad canónica.** Cada cálculo (volumen, 1RM, tendencias, carga combinada) tendría que convertir antes de sumar, y un error ahí mezcla kg con lb en silencio. Descartada.
- **Una sola preferencia de peso para cuerpo y gym.** Más simple, pero Francis puede pesarse en kg con la Renpho y entrenar con discos en libras. Descartada por decisión de Francis.
- **Una sola unidad de longitud para estatura y perímetros.** Nadie mide la cintura en metros ni en pies. Descartada.
- **Posponer después de la v1.0.** Añadirlo con tablas y pantallas ya hechas obliga a migrar datos y revisar cada pantalla con cifras. Descartada.

## Consecuencias

- Nuevo requisito SIS-07 (M) y RNF-10 reescrito; plan maestro v1.4 y PRD v1.1.
- La Fase 0.5 agrega el mockup de Ajustes → Unidades, y los mockups con cifras de peso pasan a mostrar libras, que es lo de fábrica.
- El diseño de la base de datos (Fase 1) incluye las preferencias del usuario y la columna `entered_unit` donde aplique; el diccionario de datos documenta la unidad canónica de cada columna.
- Las pruebas unitarias de conversión (plan, sección 13) cubren la ida y vuelta de cada factor y el redondeo a discos.
- Los datos del Anexo A siguen en kg; la interfaz los muestra en libras si esa es la preferencia.
