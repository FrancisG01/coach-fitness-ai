# Coach Fitness AI — Documento de producto (PRD) v1.0

| Campo | Valor |
| --- | --- |
| Versión | 1.12 |
| Fecha | 19-oct-2026 |
| Estado | Aprobado por Francis, 18-oct-2026 |
| Dueño del producto | Francis Guzman |
| Redacta | Agente `pm` |
| Fuentes | [`plan-maestro.md`](plan-maestro.md) v1.16, [`adr/`](adr/), [`diseno/`](diseno/) |

Este documento resume qué se construye en la v1.0, para quién y cómo sabremos que funcionó. No añade alcance: el backlog de la v1.0 está cerrado (D-16, [ADR 0016](adr/0016-wsl2-fase-s-y-backlog-cerrado.md)); las excepciones que decidió Francis (D-24, D-28, D-35, D-37) están en la sección 9. El detalle de cada requisito vive en el plan maestro; aquí solo se resume y se enlaza. Junto con el diseño (`/impeccable init`), cierra la Fase 0.

Francis aprobó el documento el 18-oct-2026, incluidas las metas físicas, el costo del coach y los tiempos (secciones 5, 6 y 7). Sus respuestas están en la sección 9.

---

## 1. Visión, problema y usuario

### Visión

Un coach personal que conoce todos tus datos de entrenamiento, nutrición y salud, y una plataforma que hace fácil registrarlos todos los días: web instalable, app Android y app para el Galaxy Watch.

### Problema

- En 6 meses (17-abr a 17-oct-2026) tu composición corporal no se movió: mismo peso, misma grasa y algo menos de músculo ([plan, Anexo A.2b](plan-maestro.md#a2b-medición-del-17-oct-2026-nuevo-punto-de-partida)). El MTB solo no bastó.
- Tus datos están dispersos o no existen: GymTracker en Sheets (descartado), Renpho sin integrar, nunca usaste Cronometer, sin análisis de sangre.
- Las herramientas comerciales no se conectan entre sí: Strava prohíbe usar su API con IA y Cronometer no tiene API pública ([plan, sección 7](plan-maestro.md#7-integraciones)).
- Sin datos juntos, ningún coach (humano o IA) puede decidir bien.

### Usuario

| Aspecto | Detalle |
| --- | --- |
| Quién | Francis Guzman: 30 años, 172 cm, diseñador gráfico y trader algorítmico (trading 8-9 PM), República Dominicana |
| Experiencia | Conoce series rampa, periodización y progresión de carga |
| Contexto de uso | Gym completo a las 8:00 AM, a veces sin señal; MTB registrado en Strava; teléfono Galaxy S24 Ultra y Galaxy Watch4 Classic |
| Usuarios en v1.0 | Solo tú. La arquitectura queda lista para varios usuarios (D-12) |

### Objetivos medibles de la v1.0

Del [plan, sección 3](plan-maestro.md#3-visión-objetivos-y-métricas-de-éxito):

| # | Objetivo | Métrica |
| --- | --- | --- |
| O1 | Registrar sin fricción | Una serie en ≤ 3 toques; una comida en ≤ 30 s |
| O2 | Uso constante | ≥ 90 % de sesiones de gym y ≥ 80 % de días de comida registrados |
| O3 | Coach con datos reales | 100 % de respuestas basadas en tus datos o declarando que faltan |
| O4 | Progreso visible | Tendencias de peso, grasa, fuerza y volumen por músculo siempre a la vista |
| O5 | Confiable | Cero pérdida de datos; disponibilidad ≥ 99 % |
| O6 | Progreso físico | Cumplir las metas a 3 meses de la sección 5 |

---

## 2. Alcance de la v1.0

Prioridad MoSCoW del plan: **M** imprescindible, **S** debería entrar, **W** después de la v1.0. Total: 60 requisitos, 50 M, 4 S, 6 W. Lista completa en el [plan, sección 5](plan-maestro.md#requisitos-funcionales); requisitos no funcionales (RNF-01 a RNF-11) en la [sección 6](plan-maestro.md#6-requisitos-no-funcionales).

| Módulo | Qué incluye en la v1.0 | IDs (prioridad) | Fase |
| --- | --- | --- | --- |
| Gym | Biblioteca con implicación por músculo, rutinas, calendario con pesos, modo gym con temporizador y vibración, rampa automática, volumen semanal por músculo, historial con 1RM y RM múltiples, cronometría de sesión, autoguardado y recuperación | GYM-01 a 07, 09, 10 (M) | 2 |
| Gym en el reloj | Sesión del día desde el reloj, ciclo serie/check/descanso/vibración, funciona sin el teléfono cerca, sync en tiempo real por Bluetooth | WAT-01, 02, 05, 06 (M); WAT-03 ajuste rápido de peso, WAT-04 FC en la sesión (S) | 7b |
| Salud | Sync diario de Renpho, medidas corporales completas (obligatorias, recomendadas, opcionales y automáticas) y cualquier métrica, medidas calculadas (IMC, índices y % de grasa por el método de la Marina), análisis de sangre con rangos y calendario de análisis, Samsung Health vía Health Connect | SAL-01, 02, 04, 07 (M, fase 3); SAL-06 (M, fase 7) | 3 y 7 |
| Nutrición | Base de alimentos (USDA + INCAP + Open Food Facts + manual) por 100 g, registro por comidas del día en g/kg/lb/oz/ml/L o porción casera con macros por comida, calendario de comidas pasadas y futuras, desglose de nutrientes con Total, Objetivo y Restan, límites y topes máximos seguros (D-37), recetas con crudo/cocido, preferidos y evitar, alimento desde la foto de la etiqueta, planes día/semana/mes del coach, frecuentes y recientes | NUT-01 a 05, 09 a 12 (M) | 4 |
| Suplementos | Catálogo con dosis y horario, registro de toma sumado al día, inventario con alerta de stock bajo | SUP-01, 02 (M); SUP-03 (S) | 4 |
| Cardio | Paseo MTB desde captura de Strava con tarjeta de confirmación; carga combinada gym + MTB | CAR-01, 02 (M) | 6 |
| Objetivos | Objetivo principal con meta medible y fecha, metas intermedias cada 4 semanas, metas por medida y por fuerza, hitos; tarjeta en Hoy y página propia | OBJ-01 a 04 (M) | 3 (tarjeta en Hoy: 6) |
| Coach | Chat con herramientas sobre todos los módulos, memoria de decisiones, consejos diarios y revisión semanal, propuestas que apruebas antes de guardar, re-preguntas periódicas de lo que cambia | COA-01 a 05 (M) | 5 |
| Dashboard | Panel del día; informe mensual en PDF | DSH-01, 02 (M) | 6 |
| Sistema | Login seguro con 2FA y sesión persistente, modo claro/oscuro/sistema, ajustes de apariencia con acentos y color propio, marca configurable, Centro de ayuda, unidades preferidas (kg/lb, cm/m/pulgadas/pies, km/millas), bienvenida de primer uso y perfil editable con historial; exportar datos | SIS-01, 03 a 09 (M; SIS-08 y 09 en la fase 3); SIS-02 (S) | 1 en adelante |

Reglas de producto que aplican a todo:

- El coach no diagnostica, no interpreta síntomas graves (te refiere a un médico) y no prescribe fármacos ([plan, sección 8](plan-maestro.md#reglas-y-límites-del-coach)).
- Ningún cambio del coach se guarda sin tu aprobación (COA-04).
- Acceso solo por Tailscale (D-12, D-14); interfaz en español; peso corporal y cargas del gym en libras de fábrica y lo demás en métrico, cambiable en Ajustes (SIS-07).
- Diseño B2 "Caucho y acento", acento de fábrica Caribe, Archivo como única fuente (D-17, [ADR 0017](adr/0017-direccion-visual-b2.md)).

### Fuera de alcance

| Fuera de la v1.0 | Motivo |
| --- | --- |
| App iOS, publicación en Google Play | Usuario único con Android; APK directo y OTA |
| Apertura al público y registro de otros usuarios | Arquitectura lista, decisión futura (D-12) |
| API de Strava y de Cronometer | Términos de Strava; Cronometer sin API (D-03, D-05) |
| Escáner de código de barras | Backlog (D-35); el botón se dibuja en el formulario de alimento nuevo y se programa después de la v1.0 (D-37). La foto de la etiqueta (NUT-12) cubre lo que no está en la base |
| Farmacología y protocolo capilar | Decisión del dueño del producto (D-11) |
| Dominio propio | Dirección gratuita de Tailscale (D-14) |
| RPE/RIR y sugerencia de progresión | GYM-08 (W) |
| Fotos de progreso con comparador | SAL-03 (W) |
| Check-in diario | SAL-05 (W) |
| Lista de compras, comida por foto o texto libre, importación de Cronometer | NUT-06, 07, 08 (W) |
| Mapa corporal, sustitución automática de ejercicios, hábitos y rachas | Backlog de la [sección 19](plan-maestro.md#19-backlog-de-mejoras). Los hitos de OBJ-04 sí entran (D-28) |

### Criterios de aceptación de los requisitos de D-28

Requisitos añadidos el 18-oct-2026 como excepción al backlog cerrado (sección 9, decisión 17). Detalle en el [plan, sección 5](plan-maestro.md#objetivos-obj).

| ID | Requisito | Criterios de aceptación |
| --- | --- | --- |
| OBJ-01 | Objetivo principal | Se elige un tipo (perder grasa, ganar músculo, recomposición, fuerza, salud general, rendimiento MTB), una meta medible (peso, % de grasa, cintura u otra medida de SAL-02) y una fecha. Solo hay un objetivo principal activo; al crear otro, el anterior pasa al historial con sus fechas. Las metas de enero 2027 de la sección 5 están cargadas como el objetivo principal de Francis. Hoy muestra una tarjeta con el objetivo y la próxima meta intermedia; al tocarla se abre la página de Objetivos. La barra inferior sigue con cinco pestañas |
| OBJ-02 | Metas intermedias | Al guardar el objetivo principal, la app propone una meta cada 4 semanas hasta la fecha, en línea recta desde la media de 7 días del día de inicio hasta la meta. El usuario puede editar, añadir y borrar metas. Cada meta vigente tiene un estado (adelante, en ritmo, atrasado) calculado con la media de 7 días y la tendencia de 4 semanas, y el coach lo usa en sus respuestas y revisiones |
| OBJ-03 | Metas por medida y por fuerza | Se puede crear una meta para cualquier medida de SAL-02 y para un ejercicio (carga o repeticiones, en la unidad preferida de cargas de SIS-07). En el gráfico de esa medida o ejercicio la meta aparece como línea punteada de referencia; la línea no cuenta para el máximo de tres series de DESIGN.md |
| OBJ-04 | Hitos | Cumplir una meta intermedia, por medida o de fuerza registra un hito con fecha, igual que un récord personal de GYM-07. Se avisa con un aviso discreto (sin diálogo) y la página de Objetivos lista todos los hitos. No hay rachas |
| SIS-08 | Bienvenida | Se muestra en el primer uso con 7 pasos: tú, tu objetivo, tu actividad, tu salud, conexiones, tu punto de partida y tu plan (D-32); cada paso con su ilustración (ADR 0024). Se completa en ~3 minutos. Solo peso y cintura son obligatorios en el punto de partida; el resto acepta "lo mido luego". Salud acepta "ninguna" en un toque. Cada conexión (Renpho, Health Connect, reloj) se puede saltar. Si se sale a mitad, al volver retoma en el mismo paso con lo ya escrito, en móvil o en web. Lo que trae Renpho llega lleno al punto de partida. El último paso resume kcal (Katch-McArdle con % de grasa, si no Mifflin-St Jeor, ajustadas al objetivo), proteína (1.8 a 2.2 g/kg) y primeras metas intermedias. Todo lo respondido se edita después en su sección |
| SIS-09 | Perfil editable | Ajustes muestra el perfil con todo lo de la bienvenida y además preferencias de comida, presupuesto, si cocina, suplementos actuales, sueño y estrés. Cada cambio guarda el valor anterior con su fecha y el historial se puede consultar |
| SAL-02 | Medidas corporales completas | Se pueden registrar todas las medidas obligatorias, recomendadas y opcionales del plan; las bilaterales piden solo el lado derecho de fábrica y permiten activar el izquierdo; los perímetros se muestran en la unidad de SIS-07, los pliegues en mm, la presión en mmHg y la FC en ppm. Los campos de Renpho llegan solos (SAL-01). La estatura se pide una vez |
| SAL-07 | Medidas calculadas | La app calcula IMC, cintura/estatura, cintura/cadera, hombros/cintura y % de grasa por el método de la Marina (cuello, cintura y estatura; cadera en mujeres) con la medición más reciente de cada dato. Si falta un dato, dice cuál falta en lugar de mostrar una cifra. El % de grasa de la Marina se ve junto al de la báscula, rotulado como segunda opinión |
| COA-05 | Re-preguntas periódicas | El coach pregunta por la cinta y la actividad cada 4 semanas, y por salud y lesiones cada 3 meses o cuando el usuario las menciona. Cada respuesta confirmada actualiza SIS-09 o SAL-02 y queda en su historial con fecha. No reemplaza el check-in diario (SAL-05), que sigue en W |

### Criterios de aceptación de los requisitos de D-35 y D-37

Nutrición ampliada el 18-oct-2026 como excepción al backlog cerrado (sección 9, decisión 24) y revisada con el flujo 3 el 19-oct-2026 (decisión 25), que suma los topes máximos seguros como otra excepción. Detalle en el [plan, sección 5](plan-maestro.md#comidas-calendario-y-planes-nut).

| ID | Requisito | Criterios de aceptación |
| --- | --- | --- |
| NUT-02 | Registro por comidas | El día trae de fábrica desayuno, media mañana, almuerzo, merienda y cena; en Ajustes se cambian los nombres y la cantidad, y los selectores y el chat usan esos nombres. Al abrir Comida queda elegida la comida según su hora habitual; la hora se pone sola y se edita; un bocado después de medianoche va al día abierto en pantalla. Cada alimento se registra dentro de una comida con unidad en chips que empiezan por las porciones caseras con sus gramos ("1 unidad · 50 g"), luego g, oz, lb y kg; ml y L solo si el alimento tiene densidad. Decimales: g y ml enteros, oz 1, lb, kg y L 2, porción casera 1 con atajos ¼ ½ ¾. En los alimentos donde importa hay selector "Crudo · Cocido" que usa el registro de la base con sus valores, recuerda la última elección y la primera vez marca "Cocido". Editar y quitar usan la misma hoja; quitar no pide confirmación y ofrece "Deshacer". Se puede agregar, editar y quitar en cualquier día pasado, con el objetivo que regía ese día. Cada comida muestra su total de kcal, proteína, carbohidratos y grasa |
| NUT-03 | Desglose de nutrientes | Para un día pasado, hoy o un día futuro se ven kcal, macros, fibra, azúcares, minerales y vitaminas, cada uno con barra de progreso y columnas Total, Objetivo y Restan en su unidad. Restan empieza en el objetivo y baja al comer; en kcal, carbohidratos y grasa, al pasarse muestra el negativo en texto normal, nunca en rojo, con ícono `alert-triangle` solo si el exceso supera el 5 % del objetivo del día ("−1" sin ícono con 340 de 339 g; "−184" con ícono con 3,134 de 2,950 kcal). Proteína y fibra muestran "Cumplido" con check al llegar o pasarse, nunca negativo; un micro alcanzado también dice "Cumplido". Los límites (sodio, azúcar añadida, grasa saturada) no tienen tolerancia: pasarlos siempre lleva ícono. Los objetivos de micros salen de las DRI por edad y sexo. Sodio (2,300 mg), azúcar añadida y grasa saturada (10 % de las kcal objetivo: 59 g y 26 g para Francis con 2,350) se muestran como límite ("hasta 2,300 mg") con marca en la barra. Cada nutriente con tope máximo seguro (UL por edad y sexo, NIH) avisa al 80 % y al pasarse con el mismo estilo neutro; en magnesio, ácido fólico, niacina y vitamina E el tope suma solo suplementos y fortificados. La fila "Suplementos" suma las tomas, whey incluido. Fibra: 14 g por 1,000 kcal, sin cambiar el día del paseo. El día de un paseo MTB registrado el objetivo de kcal sube con el 50 % de sus kcal (D-27), repartidas en la proporción de macros del día, y se lee el origen ("2,350 + 600 del paseo"). Un alimento con datos opcionales faltantes genera el aviso "Faltan datos de 1 alimento". En el móvil el resumen (kcal y 3 macros) va arriba del registro y "Ver todos los nutrientes" abre la pantalla completa; en la web ancha va fijo a la derecha de las comidas. Hoy muestra la tarjeta "Nutrición de hoy" (flujo 8) |
| NUT-04 | Recetas | Una receta guarda ingredientes con cantidades, factor crudo/cocido y rendimiento en porciones. Agregar una receta a una comida pide cuántas porciones; con 1 porción entra en un toque, como combo |
| NUT-09 | Frecuentes y armar el plato | Antes de escribir se ven recientes y frecuentes con su porción habitual (la última cantidad y unidad usadas con ese alimento; uno nuevo arranca en g) y se agregan con un toque. Los resultados salen en este orden: tus alimentos y los usados, la base local (INCAP) y USDA, con la fuente visible y sinónimos (guineo y banana, habichuelas y frijoles). Un alimento de la lista de evitar aparece marcado "En tu lista de evitar". Se agrega un alimento a la vez con la hoja de cantidad y "Agregar", y se vuelve a la búsqueda; una barra fija muestra el total de la comida (kcal y macros) y "Listo". Sin conexión (Android) solo busca en los alimentos guardados y lo dice |
| NUT-05 | Planes del coach | Desde el chat se pide un plan de un día, una semana o un mes con condiciones ("con pollo y piña"). El coach respeta el objetivo del día, los preferidos, la lista de evitar y las condiciones, decide en qué comida va cada cosa, pone más carbohidratos alrededor de los entrenos programados y reparte la proteína en 4 o 5 tomas contando el whey. Solo rellena comidas vacías y pregunta antes de reemplazar una programada. Nada se guarda sin aprobar, completo o por comida (COA-04). Un mes son 2 semanas tipo que se alternan |
| NUT-10 | Calendario de comidas | Comida muestra días pasados, hoy y futuros. En hoy y en un día futuro se programan comidas a mano o por plan del coach y se copia un día o la semana anterior. Una comida programada aparece con sus alimentos y en contorno; no hay tachado ni "Lo comí": se quita con una X lo que no se comió, se agrega lo que sí y se editan cantidades, y lo que queda cuenta como comido. Hoy, una comida programada sin tocar entra en el Total y baja Restan al pasar su hora habitual; antes, la barra muestra lo pendiente como tramo en contorno con "Con lo programado: 2,180". Los suplementos programados del día siguen la misma regla en el bloque "Suplementos" debajo de las comidas y en Hoy. Al programar se guarda una copia de lo programado que no se ve y permite comparar la semana contra el plan |
| NUT-11 | Preferidos y evitar | Hay una lista de alimentos preferidos o de alcance local y otra de alimentos a evitar. Las alergias de la bienvenida aparecen solas en "evitar". El coach nunca propone un alimento de "evitar". Para Francis, la despensa base del plan (Anexo A.7) viene cargada como preferidos |
| NUT-12 | Alimento desde la etiqueta | "Crear alimento" está siempre visible en Comida y en la búsqueda. El formulario tiene "Leer la etiqueta" (teléfono: tomar foto o galería; web: subir foto), selector crudo o cocido y el botón de código de barras dibujado sin función. El coach llena el formulario convertido a 100 g (de %VD a mg, de kJ a kcal y de ml a g con la densidad) y guarda la porción de la etiqueta como porción casera. Los obligatorios que falten (porción en g, kcal, proteína, carbohidratos, grasa) se marcan en rojo y no deja guardar sin ellos; los opcionales no leídos quedan "sin dato", no 0. Con una foto ilegible dice "No se pudo leer la etiqueta · Probar otra foto" y siempre se puede llenar a mano. Leer la etiqueta pide conexión. El alimento queda con fuente "etiqueta" y la foto en almacenamiento privado |

---

## 3. Flujos clave

La [sección 13](plan-maestro.md#13-calidad-y-pruebas) pide pruebas E2E en Playwright de "los 9 flujos clave de la web"; son los flujos de la tabla de la Fase 0.5 ([sección 14](plan-maestro.md#fase-05-diseño-ux-antes-de-programar)) que se usan en la web. El flujo 9 (entrenar desde el reloj) también se diseña en la Fase 0.5, pero se prueba en el reloj real, no en Playwright.

| # | Flujo | Pasos | Requisitos | Prueba |
| --- | --- | --- | --- | --- |
| 1 | Entrenar en el gym | Abrir sesión programada → rampa → tachar series → ajustar peso → descanso → cerrar sesión | GYM-04, 05, 09, 10 | Playwright + Maestro |
| 2 | Programar entrenamientos | Calendario en Gym (mes y semana) → ver día pasado con su resumen → elegir hoy o un día futuro → elegir rutina → confirmar o editar series y repeticiones → confirmar o editar pesos → guardar; editar una sesión programada; mover o copiar una sesión, copiar la semana anterior | GYM-02, 03 | Playwright |
| 3 | Registrar una comida | Comida elegida por la hora → recientes y frecuentes o buscar alimento (o "Crear alimento" con "Leer la etiqueta") → hoja de cantidad con unidad en chips y crudo o cocido → "Agregar" y volver a buscar → "Listo" → macros de esa comida → desglose del día con Total, Objetivo y Restan; quitar o editar lo programado | NUT-02, 03, 09, 10, 12, SUP-02 | Playwright |
| 4 | Crear receta o plan | Receta: ingredientes → porciones; calendario de comidas → programar a mano o copiar; preferidos y evitar → pedir al coach un plan de día, semana o mes con condiciones → aprobar completo o por comida, con suplementos | NUT-04, 05, 10, 11, SUP-01 | Playwright |
| 5 | Registrar paseo MTB | Subir las capturas de Strava al chat (actividad y zonas de FC) → tarjeta de confirmación → guardar | CAR-01, 02 | Playwright |
| 6 | Registrar medición | Renpho automático o manual → medidas con cinta (lista completa de SAL-02: obligatorias, recomendadas y opcionales) → medidas calculadas | SAL-01, 02, 07 | Playwright |
| 7 | Hablar con el coach | Pregunta → respuesta con tus datos → aprobar plan propuesto | COA-01, 04 | Playwright + evals |
| 8 | Empezar el día | Dashboard: entreno, tarjeta "Nutrición de hoy", suplementos pendientes, alertas, tarjeta de objetivos → página de Objetivos (metas intermedias, metas por medida y por fuerza, hitos) | DSH-01, NUT-03, COA-03, OBJ-01 a 04 | Playwright |
| 9 | Entrenar desde el reloj | Iniciar sesión del día → serie → check → descanso → vibración → espera → play → siguiente → resumen de tiempos | WAT-01, 02, 05, 06 | Compose for Wear OS + reloj real |
| 10 | Bienvenida (primer uso) | Tú → tu objetivo → tu actividad → tu salud → conexiones → tu punto de partida → tu plan; salir y retomar en móvil o web | SIS-08, SIS-07, OBJ-01, 02 | Playwright |

Cada flujo se entrega en la Fase 0.5 en cuatro piezas: diagrama, guía paso a paso en imágenes, mockups de alta fidelidad (web y móvil) y prototipo navegable. Orden: primero el flujo 2 (calendario), después el flujo 1 (D-25) y luego el flujo 10 (bienvenida, D-28).

---

## 4. Métricas de éxito y criterios de salida por fase

Las métricas de producto son O1 a O6 (sección 1). Cada fase cierra con demo, tests en verde, documentación técnica y guías del Centro de ayuda al día ([plan, sección 16](plan-maestro.md#16-plan-de-desarrollo-por-fases)).

| Fase | Entrega | Criterio de salida |
| --- | --- | --- |
| S. Setup | Entorno, servidor, repo, CI | Cerrada el 18-oct-2026 |
| 0. Fundaciones | PRD, PRODUCT.md y DESIGN.md, monorepo, CI | Repo compila, CI en verde, apruebas PRD y diseño |
| 0.5 Diseño UX | Modelo conceptual de BD, flujos, wireframes, mockups, guías, prototipo | Recorres cada flujo en el prototipo y lo apruebas |
| 1. Núcleo | Autenticación, BD lógica y física (DBML), perfil, API base, despliegue y respaldos | API en producción con tests y backup verificado |
| 2. Gym | Biblioteca, rutinas A/B/C, calendario, modo gym (PWA), rampa, historial, volumen | Entrenas una semana real registrando todo |
| 3. Salud | Renpho, medidas, análisis de sangre, tendencias | Datos de abril y de octubre cargados y graficados |
| 4. Nutrición y suplementos | Base de alimentos, registro, recetas, planes, suplementos | Una semana de comidas registrada y comparada con el plan |
| 5. Coach IA | Chat con herramientas, memoria, revisiones, planes | Responde con tus datos reales sin inventar (evals al 100 % en casos críticos) |
| 6. Dashboard y cardio | Panel del día, paseos MTB, carga total, informe PDF | Dashboard útil como pantalla de inicio diaria |
| 7. App Android | Offline-first, notificaciones, Health Connect | Instalada en tu teléfono, sin pérdida de datos sin señal |
| 7b. Galaxy Watch | Sesión del día, ciclo de serie, tiempos, sync | Una sesión completa solo con el reloj, tiempos correctos en el sistema |
| 8. Versión 1.0 | Rendimiento, seguridad, monitoreo, pulido | Auditoría del revisor sin hallazgos críticos; etiqueta 1.0.0 |

---

## 5. Metas físicas recalculadas (aprobadas)

Nuevo punto de partida: medición Renpho del 17-oct-2026 ([Anexo A.2b](plan-maestro.md#a2b-medición-del-17-oct-2026-nuevo-punto-de-partida)). Horizonte: 13 semanas, hasta mediados de enero de 2027. Son metas de seguimiento, no un diagnóstico; el coach no diagnostica ni prescribe.

### Ritmos usados (conservadores)

| Variable | Ritmo | En 13 semanas |
| --- | --- | --- |
| Peso | −0.15 % a −0.30 % del peso por semana (0.12-0.23 kg/sem) | −1.5 a −3.0 kg |
| Grasa | ≈ −0.25 kg por semana en el punto medio (déficit de ~275 kcal/día) | −2.5 a −3.5 kg de grasa |
| Masa sin grasa | +0.1 a +0.25 kg al mes | +0.2 a +0.8 kg |

Por qué conservadores: (1) el gym se retoma desde la semana 1 de exploración, con 2 semanas de adaptación y una de descarga; (2) la bioimpedancia de Renpho tiene un error de ±1-2 kg en masa magra y varía con hidratación y glucógeno, así que una meta agresiva de músculo no se podría ni confirmar; (3) la memoria muscular puede acelerar el regreso, pero eso se trata como ganancia extra, no como plan. Para juzgar, usa la media de 7 días de peso y la tendencia de 4 semanas, no una medición suelta.

### Tabla de metas

| Métrica | 17-abr | 17-oct | Meta ene-2027 | Cambio vs 17-oct | Razonamiento |
| --- | --- | --- | --- | --- | --- |
| Peso | 78.4 kg | 78.4 kg | 75.5-76.5 kg | −1.9 a −2.9 kg | Ritmo de peso de arriba; punto medio 76 kg |
| Grasa corporal | 20.3 % (15.9 kg) | 20.4 % (16.0 kg) | 17-18 % (13.0-13.8 kg) | −2.4 a −3.4 pp | Peso meta menos masa sin grasa meta |
| Peso sin grasa | — | 62.4 kg | 62.6-63.2 kg | +0.2 a +0.8 kg | Ganancia magra conservadora |
| Músculo esquelético | 51.4 % (40.3 kg) | 51.3 % (40.2 kg) | 53-54 % (40.5-40.8 kg) | +0.3 a +0.6 kg | ~64 % de la masa sin grasa, como hoy |
| Masa muscular total | 75.7 % (59.4 kg) | 75.6 % (59.2 kg) | ≥ 78 % (59.5-60.0 kg) | +0.3 a +0.8 kg | Sube el % sobre todo porque baja la grasa |
| Grasa subcutánea | 17.6 % | 17.7 % | 14.5-15.5 % | −2.2 a −3.2 pp | En Renpho va ~2.7 pp por debajo de la grasa total |
| Grasa visceral | 9 | 9 | 8 | −1 | Baja lento; 7 sería una sorpresa positiva |
| IMC | 26.5 | 26.5 | 25.5-26.0 | −0.5 a −1.0 | Antes "< 25" exigía < 74 kg, incompatible con ganar músculo. En recomposición el IMC dice poco |
| Agua corporal | 57.5 % | 57.5 % | 58-59 % | +0.5 a +1.5 pp | Sube al bajar la grasa |
| Proteína corporal | 18.2 % | 18.1 % | ≥ 18.2 % | mantener o subir | Depende de la masa magra |
| Masa ósea | 3.2 kg | 3.2 kg | 3.2 kg | mantener | No cambia en 3 meses |
| TMB | 1,721 kcal | 1,726 kcal | ≥ 1,725 kcal | mantener | Renpho la calcula casi solo con la masa sin grasa; "1,780+" pedía +2.5 kg magros |
| Edad metabólica | 30 | 31 | 29-30 | −1 a −2 | Sigue a la grasa y la TMB |
| Cintura (ombligo) | 91 cm | pendiente | 87-89 cm | −2 a −4 cm vs abril | ~1 cm por kg de grasa perdida; Francis enviará las medidas con cinta |
| Cintura/altura | 0.529 | pendiente | ≤ 0.51 | — | Referencia < 0.50, se alcanza en la etapa Principiante |

Las metas a 12 y 24 meses del Anexo A.2 se mantienen como referencia y se revisan con la medición de enero. Las medidas con cinta de octubre (cintura, cadera, pecho, brazos y muslos) están pendientes de Francis; con ellas se fijan las metas de cinta del Anexo A.3.

### Objetivo calórico unificado (aprobado)

El Anexo A tiene dos cifras que no cuadran: el plan de comidas suma ~2,255 kcal (P 187 / C 250 / G 54) y el objetivo declarado es 2,300-2,400 kcal.

| Concepto | Valor |
| --- | --- |
| TMB (17-oct) | 1,726 kcal |
| Gasto estimado con 3 días de gym + 2 de caminata, trabajo sentado (×1.45-1.55) | 2,500-2,675 kcal |
| Déficit para ~0.25 kg de grasa por semana | ~275 kcal/día |
| **Objetivo** | **2,350 kcal/día, único para todos los días** (punto medio del rango declarado) |
| Macros | Proteína 172 g (2.2 g/kg, D-33; antes 187), grasas 65 g (~0.83 g/kg, la propuesta del propio Anexo A.7), carbohidratos 270 g → 2,353 kcal |
| Días con MTB | Se suma el 50 % de las kcal del paseo registrado (D-27), repartido en la proporción de macros del día (D-37); la fibra no cambia |
| Suelo de alerta | Menos de 1,800 kcal en un día (Anexo A.10, sin cambio) |

Para llegar a 2,350 el plan de comidas solo necesita ~100 kcal más (por ejemplo, +10 g de grasa con aceite de oliva o aguacate y algo de carbohidrato); se ajusta en la Fase 4. Punto de control cada 6 semanas desde tu primera actividad registrada (D-33): si bajas más de 0.5 % por semana, subir 100-150 kcal; si la media de 7 días no se mueve en 3 semanas, bajar 100-150 kcal.

---

## 6. Costo estimado de la API del coach

### Precios usados

Precios oficiales de la API de Anthropic por millón de tokens, consultados con la skill `claude-api` (caché del 6-oct-2026). Se vuelven a confirmar en Claude Console al activar los créditos en la Fase 5.

| Modelo | Entrada | Salida | Lectura de caché | Escritura de caché (5 min) |
| --- | --- | --- | --- | --- |
| Claude Fable 5.1 | $10.00 | $50.00 | $0.25 | $12.50 |
| Claude Opus 5.5 | $4.00 | $20.00 | $0.20 | $5.00 |
| Claude Sonnet 5.5 | $2.00 | $10.00 | $0.20 | $2.50 |
| Claude Haiku 5.5 | $0.10 | $0.50 | ~$0.01 | ~$0.13 |

La escritura de caché cuesta 1.25× la entrada (2× con caché de 1 hora); el procesamiento por lotes (Batches) cuesta la mitad. En Opus 5.5 el razonamiento siempre está activo y se cobra como salida.

### Supuestos por interacción

| Interacción | Modelo propuesto | Tokens (aprox.) | Costo unitario |
| --- | --- | --- | --- |
| Mensaje de chat (con 2-3 llamadas a herramientas) | Opus 5.5 | 25K leídos de caché (prompt fijo, herramientas, perfil), 6K de entrada nueva, 4K escritos a caché, 1.5K de salida con razonamiento | ~$0.08 |
| Consejos diarios (COA-03) | Sonnet 5.5 | 15K entrada, 0.8K salida | ~$0.04 |
| Revisión semanal y resumen de memoria | Opus 5.5 | 60K entrada, 4K salida | ~$0.32 ($0.16 por lotes) |
| Lectura de captura de Strava (CAR-01) | Sonnet 5.5 | ~1.6K de imagen + 8K de contexto, 0.5K salida | ~$0.03 |
| Lectura de etiqueta nutricional (NUT-12) | Sonnet 5.5 | ~1.6K de imagen + 8K de contexto, 1K salida | ~$0.03 |
| Generación de plan o rutina (NUT-05, COA-04) | Opus 5.5 | 40K entrada, 12K salida | ~$0.40 |
| Texto del informe mensual (DSH-02) | Opus 5.5 | 50K entrada, 5K salida | ~$0.30 |

Sin caché, el mensaje de chat costaría ~$0.17: el prompt caching recorta casi a la mitad el gasto del chat.

### Escenarios mensuales

| Concepto | Bajo | Medio | Alto |
| --- | --- | --- | --- |
| Mensajes de chat al mes | 150 (5/día) | 450 (15/día) | 1,200 (40/día, conversaciones largas: ~$0.10 c/u) |
| Chat | $12 | $36 | $120 |
| Revisiones semanales | $1.5 | $1.5 | $3 |
| Consejos diarios | $1.2 | $1.2 | $2.3 (con Opus) |
| Capturas de Strava | $0.2 (6) | $0.3 (10) | $0.5 (15) |
| Etiquetas nutricionales | $0.3 (10) | $0.6 (20) | $1.2 (40) |
| Planes y rutinas | $1.2 (3) | $2.4 (6) | $6 (12) |
| Informe mensual | $0.3 | $0.3 | $0.5 |
| **Operación** | **~$17** | **~$43** | **~$133** |
| Evals del coach en CI (sobre todo en la Fase 5) | ~$5 | ~$15 | ~$40 |
| **Total** | **~$22** | **~$58** | **~$173** |
| ¿Alcanza con Max 5x ($100)? | Sí, sobra 78 % | Sí, sobra 42 % | No: se agotaría hacia el día 17 |
| ¿Alcanza con Max 20x ($200)? | Sí | Sí | Sí, justo |

Los embeddings para la memoria semántica (pgvector) no salen de Anthropic, que no ofrece ese servicio: se generan con un modelo local en el servidor, sin costo de API (D-21, [ADR 0021](adr/0021-embeddings-locales-en-el-servidor.md)).

### Decisión

| Tarea | Modelo | Motivo |
| --- | --- | --- |
| Chat del coach, planes y rutinas, revisión semanal | Opus 5.5, esfuerzo medio | Razonamiento sobre muchos datos; precio razonable |
| Consejos diarios, lectura de capturas, extracción de datos | Sonnet 5.5 (esfuerzo bajo) | Tareas acotadas; la mitad del costo |
| Clasificación simple o resúmenes cortos | Haiku 5.5 | Casi gratis |
| Coach en producción | Nunca Fable 5.1 | 2.5× el precio de Opus sin ganancia clara aquí |

- **Plan:** Max 5x, con $100 de créditos de API al mes.
- **Tope en la app:** $80 al mes y $8 al día (este último corta bucles). Así nunca te quedas sin coach a mitad de mes.
- **Al llegar al 80 % del tope ($64):** el chat pasa a Sonnet 5.5 hasta fin de mes y la app te avisa. En el escenario alto esto ocurriría a mitad de mes.
- **Evals:** en cada pull request, solo los casos críticos; la batería completa cuando cambian el prompt o las herramientas.
- Registro de tokens por conversación y panel de costos (RNF-11).

---

## 7. Estimación de tiempo por fase

Recalculada el 18-oct-2026 con la disponibilidad que confirmó Francis: día completo, y si está motivado, el día entero dedicado al proyecto. Ajustada el mismo día por D-28 (objetivos, bienvenida y medidas): +~1 semana, por D-35 (nutrición ampliada): +~1 a 1.25 semanas en la Fase 4, y el 19-oct-2026 por D-37 (topes máximos seguros): +~1 día en la Fase 4, redondeado a 0.25 semanas. Todo cae después de la Fase 2, para que el modo gym no se mueva.

### Supuestos

- Tu revisión deja de ser el cuello de botella: apruebas mockups y pruebas demos el mismo día.
- Los cuellos de botella pasan a ser dos:
  - el desarrollo y las pruebas automáticas;
  - las pruebas reales que no se pueden acelerar: una semana entrenando (Fase 2), una semana de comidas (Fase 4), uso sin señal (Fase 7) y una sesión completa con el reloj (Fase 7b).
- La semana real de comidas de la Fase 4 corre en paralelo con el desarrollo de la Fase 5.
- Límites del plan Max 5x: el uso diario de Claude Code y el tope semanal de Fable 5.1 (50 %) pueden frenar las fases críticas (BD de la Fase 1, sincronización de las fases 7 y 7b).
- No incluye pausas largas ni cambios de alcance. Los requisitos S se pueden posponer si una fase se alarga.

| Fase | Optimista (sem.) | Probable (sem.) | Qué la marca |
| --- | --- | --- | --- |
| 0. Lo que falta (`/impeccable init`) | 0.3 | 0.5 | Una ronda de revisión |
| 0.5 Diseño UX (10 flujos × 4 piezas, modelo conceptual de BD) | 1 | 2 | Producción de mockups y prototipo; el flujo 10 y los flujos 3 y 4 ampliados caben en el rango |
| 1. Núcleo | 1 | 1.5 | Modelo de datos, RLS, despliegue y backups (Fable) |
| 2. Gym (PWA) | 1.5 | 2 | Desarrollo + la semana real de entreno |
| 3. Salud | 1 | 1.5 | Librería no oficial de Renpho; medidas completas, objetivos, bienvenida y perfil (D-28) |
| 4. Nutrición y suplementos | 2.75 | 3.5 | Base de alimentos dominicanos, calendario de comidas, desglose, etiqueta y planes del coach (D-35), topes máximos seguros (D-37) + semana real de comidas |
| 5. Coach IA | 1.25 | 2.25 | Prompt, herramientas y evals; re-preguntas y juicio de metas (D-28) |
| 6. Dashboard y cardio | 0.75 | 1.25 | Informe PDF, carga combinada y tarjeta de objetivos (D-28) |
| 7. App Android | 1.5 | 3 | Offline-first sin pérdida de datos, Health Connect (Fable) |
| 7b. Galaxy Watch | 1.5 | 2.5 | App nativa, Data Layer, pruebas en el Watch4 (Fable) |
| 8. Versión 1.0 | 0.5 | 1 | Hallazgos de la auditoría |
| **Total** | **~13.25 semanas** | **~21 semanas** | |

| Hito | Optimista | Probable |
| --- | --- | --- |
| Modo gym usable en el teléfono (empieza la semana real) | ~7-nov-2026 | ~22-nov-2026 |
| Fase 2 cerrada | ~14-nov-2026 | ~29-nov-2026 |
| Versión 1.0 | ~18-ene-2027 | ~15-mar-2027 |

**Riesgo principal (plan, sección 17):** que el desarrollo retrase tu vuelta al gym. Aun en el escenario optimista, las primeras 3 semanas de la ventana de las metas de enero pasan sin modo gym. Mitigación: empezar ya con la rutina Full Body A/B/C en papel ([Anexo A.6](plan-maestro.md#a6-plan-de-entrenamiento-full-body-abc)), apuntar pesos y reps, y cargarlos en el sistema cuando llegue la Fase 2. Dedicar el día completo al proyecto no debe comerse la hora del gym de las 8:00 AM.

---

## 8. Riesgos principales

Resumen del [plan, sección 17](plan-maestro.md#17-riesgos).

| Riesgo | Prob. | Impacto | Mitigación |
| --- | --- | --- | --- |
| El desarrollo retrasa tu regreso al gym | Alta | Alto | Rutina A/B/C en papel desde ya; Gym es el primer módulo |
| El alcance crece con ideas nuevas | Alta | Alto | Backlog v1.0 cerrado; toda idea va a la sección 19 salvo que sea crítica y tú lo decidas |
| Renpho cambia su API interna | Media | Medio | Importación CSV; aviso si el sync falla 2 días |
| Oracle limita la instancia gratuita | Media | Alto | Backups fuera del servidor; despliegue reproducible con Docker |
| El coach se equivoca | Media | Medio | Evals en CI, respuestas que citan datos, cambios siempre como borrador |
| Lectura errónea de capturas de Strava | Media | Bajo | Tarjeta de confirmación obligatoria |
| Galaxy Watch4 antiguo | Media | Bajo | Wear OS 3+, pantalla activa solo en la sesión, pruebas en el reloj real |
| Costo de la API mayor al esperado | Baja | Medio | Tope mensual y diario, modelos ligeros para tareas simples (sección 6) |
| Pérdida de datos | Baja | Alto | Backups cifrados diarios con restauración probada |

---

## 9. Decisiones tomadas el 18-oct-2026

Respuestas de Francis a las preguntas del borrador.

| # | Tema | Decisión |
| --- | --- | --- |
| 1 | Plan Max | Max 5x: $100 de créditos de API al mes |
| 2 | Metas de enero | Aprobadas tal como están en la sección 5, incluidos el IMC 25.5-26.0 y la TMB ≥ 1,725 |
| 3 | Calorías | 2,350 kcal como objetivo único (P 172 / C 270 / G 65 desde D-33), revisión cada 6 semanas desde la primera actividad. El día de un paseo MTB sube con el 50 % de sus kcal (D-27) |
| 4 | Medidas con cinta | Pendientes de Francis: cintura, cadera, pecho, brazos y muslos |
| 5 | Tope del coach | $80 al mes y $8 al día; al 80 % el chat pasa a Sonnet 5.5 y avisa |
| 6 | Embeddings de la memoria | Modelo local en el servidor Oracle; el modelo concreto se elige en la Fase 1 (D-21, [ADR 0021](adr/0021-embeddings-locales-en-el-servidor.md)) |
| 7 | Fotos de progreso | Fuera de la v1.0 (SAL-03 sigue en W); corregida la Fase 3 del plan |
| 8 | Mapa corporal de músculos | Fuera de la v1.0; aclarada la sección 14 del plan. El volumen por músculo (GYM-06) se ve en tablas y gráficos |
| 9 | Requisitos S | WAT-03, WAT-04, SUP-03 y SIS-02 se pueden posponer si la fase se alarga |
| 10 | Flujos de la Fase 0.5 | Se diseñan los 9, incluido el del reloj |
| 11 | Disponibilidad | Día completo; estimación recalculada en la sección 7 |
| 12 | Nombre del plan | El plan maestro pasa a titularse "Coach Fitness AI" |
| 13 | Unidades (añadida tras aprobar el PRD) | SIS-07 entra en la v1.0 con prioridad M: peso corporal y cargas del gym por separado en kg o lb (lb de fábrica); estatura en m, cm o pies y pulgadas; perímetros en cm o pulgadas; distancia en km o millas (métrico de fábrica). D-24, [ADR 0023](adr/0023-unidades-preferidas.md) |
| 14 | Calendario (añadida tras aprobar el PRD) | Vive en Gym. Muestra días pasados (sesión hecha o no hecha, con resumen), hoy y futuros (programar, mover, copiar), paseos MTB y citas de análisis de sangre de solo lectura que llevan a Salud. Una sesión no hecha ofrece "Mover a otro día"; existe "Copiar la semana anterior". El flujo 2 se diseña antes que el flujo 1. D-25 |
| 15 | Revisión del flujo 2 | Programar en tres pasos: rutina, series y repeticiones, pesos. La semana 1 es la de la primera actividad registrada en la app; Francis arranca desde cero. Pestañas internas de Gym en móvil; subsección Análisis en Salud. D-26 |
| 16 | Datos del paseo MTB | Distancia, desnivel positivo, tiempo en movimiento, velocidad media, calorías, FC promedio y zonas de FC Z1 a Z5 (% y rango en ppm) desde dos capturas de Strava; el objetivo calórico del día sube con el 50 % de las kcal del paseo. D-27 |
| 17 | Objetivos, bienvenida y medidas (añadida tras aprobar el PRD) | Entran en la v1.0 con prioridad M como excepción al backlog cerrado: módulo Objetivos (OBJ-01 a 04) con tarjeta en Hoy y página propia, bienvenida de 7 pasos con ilustraciones (SIS-08, [ADR 0024](adr/0024-ilustraciones-en-la-bienvenida.md)), perfil editable con historial (SIS-09), medidas corporales completas (SAL-02), medidas calculadas (SAL-07) y re-preguntas del coach (COA-05). Las rachas siguen fuera. Flujo 10 en la Fase 0.5 (se diseñan 10 flujos, 9 en Playwright). +~1 semana: ~12 optimista y ~19.5 probable, v1.0 ~9-ene a ~4-mar-2027; el modo gym no se mueve. Criterios de aceptación en la sección 2. D-28 |
| 18 | Revisión del flujo 1 | La rampa depende de las reps objetivo y el peso de trabajo de cada ejercicio, con una sola serie de tanteo si el músculo ya está caliente y sin rampa en aislamiento; potenciación opcional. Descanso con +15 s, −15 s y saltar; ajustes al vuelo solo en la sesión; resumen al cerrar con tiempos, volumen, récords e hitos. Ciclos de entrenamiento fuera de la v1.0 ([plan, §5](plan-maestro.md#modo-gym-y-series-rampa-gym-04-gym-05)). D-29 |
| 19 | Guía del flujo 1 | Modo gym en la app Android y en la web como PWA en el teléfono (escritorio: solo lectura); sesión sin programar desde una rutina o vacía; rampa redondeada hacia abajo; volumen con las dos mancuernas; series por tiempo; cifra del descanso más grande. D-30 |
| 20 | Flujo 1 aprobado | "Empezar otra sesión" el mismo día; volumen ×4 en ejercicios por pierna con mancuernas; avisos que no tapan acciones; contraste del subitem activo web corregido. D-31 |
| 21 | Revisión del flujo 10 | Conexiones antes del punto de partida; kcal con Katch-McArdle o Mifflin-St Jeor ajustadas al objetivo y proteína 1.8 a 2.2 g/kg (los objetivos de Francis no cambian); bienvenida en móvil y web con retomar en el otro dispositivo. D-32 |
| 22 | Guía del flujo 10 | Proteína de Francis 172 g (2.2 g/kg) y carbohidratos 270 g, 2,350 kcal sin cambio; revisión cada 6 semanas desde la primera actividad de cada usuario; experiencia en 3 opciones. D-33 |
| 23 | Flujo 10 aprobado | Ajuste −15 % / +5 % y proteína por objetivo; aviso de ritmo sin bloquear; meta a 4 semanas o más; medidas obligatorias según la meta; fecha con máscara y calendario propio; campos numéricos filtrados en toda la app. D-34 |
| 24 | Nutrición ampliada (añadida tras aprobar el PRD) | Entra en la v1.0 con prioridad M como excepción al backlog cerrado: comidas del día con macros por comida, calendario de comidas pasadas y futuras, desglose con Total, Objetivo y Restan, preferidos y evitar, planes del coach con condiciones y entrenos, recetas de 1 porción como combo y alimento desde la foto de la etiqueta (NUT-10 a 12 nuevos). Código de barras al backlog. Flujos 3 y 4 ampliados. +~1 a 1.25 semanas: ~13 optimista y ~20.75 probable, v1.0 ~16-ene a ~13-mar-2027; el modo gym no se mueve. Criterios de aceptación en la sección 2. D-35 |
| 25 | Revisión del flujo 3 (registrar una comida) | Lo programado se queda y cuenta salvo lo que quites, sin "Lo comí"; hoy cuenta al pasar su hora habitual; copia de lo programado para comparar con el plan. Whey como suplemento que suma al día; café como alimento. Crudo o cocido con su propio registro. Restan negativo en color neutro, "Cumplido" y límites "hasta". Kcal del paseo en la proporción de macros del día. Etiqueta con obligatorios en rojo y opcionales "sin dato". Días pasados editables. Plato de a un alimento con barra fija. De fábrica desayuno, media mañana, almuerzo, merienda y cena. "Crear alimento" siempre visible; código de barras dibujado y programado después de la v1.0. Azúcar añadida y grasa saturada al 10 % de las kcal. Topes máximos seguros (UL) en la v1.0 como excepción al backlog cerrado (M). +~1 día: ~13.25 optimista y ~21 probable, v1.0 ~18-ene a ~15-mar-2027; el modo gym no se mueve. Criterios de aceptación en la sección 2. D-37 |
