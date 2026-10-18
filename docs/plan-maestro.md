# Coach Fitness AI — Plan Maestro de Desarrollo

Oct 17, 2026 · @Almonte

## Control del documento

Única fuente de verdad del proyecto. Sustituye a los archivos de abril (VISION\_v1, CONTEXT\_v1 y v2) y al Consolidado v3.

| Campo | Valor |
| --- | --- |
| Proyecto | Coach Fitness AI (nombre provisional) |
| Versión | 1.10 |
| Estado | En definición — Fase 0 |
| Dueño del producto | Francis Guzman |
| Responsable técnico | Claude (agente Project Manager) |
| Próxima revisión | Al cerrar la Fase 0 |

### Historial de cambios

| Versión | Fecha | Cambio |
| --- | --- | --- |
| 0.1 | 17-oct-2026 | Plan inicial: módulos, stack, arquitectura, agentes, fases |
| 0.2 | 17-oct-2026 | Base de alimentos y unidades; MTB por captura; skills de diseño; Fase 0.5 de Diseño UX; diseño de base de datos; fuera protocolo capilar |
| 1.0 | 17-oct-2026 | Reestructura profesional y ficha del atleta integrada (Anexo A) |
| 1.1 | 18-oct-2026 | Coherencia con D-14 a D-20: una sola fuente (Archivo), modo según el sistema, coach solo con créditos Max, staging por Tailscale, backlog v1.0 cerrado, 10 agentes, `apps/watch/`, NativeWind |
| 1.2 | 18-oct-2026 | PRD aprobado (`docs/prd.md`): título "Coach Fitness AI"; fotos de progreso y mapa corporal fuera de la v1.0; embeddings locales en el servidor (D-21); estimación de tiempos en el PRD |
| 1.3 | 18-oct-2026 | PRODUCT.md y DESIGN.md (Impeccable); MTB solo por captura de Strava en §1; íconos Tabler (D-22); barra inferior Hoy, Gym, Comida, Salud, Coach (D-23); logo provisional: mancuerna en `packages/brand` |
| 1.4 | 18-oct-2026 | Unidades preferidas por usuario (SIS-07, D-24, ADR 0023): peso corporal y cargas del gym en lb de fábrica; estatura, perímetros y distancia en métrico de fábrica; RNF-10 actualizado |
| 1.5 | 18-oct-2026 | Calendario de entrenamientos (D-25): GYM-03 reescrito con días pasados, hoy y futuros, mover y copiar sesiones, paseos MTB y citas de análisis; el calendario vive en Gym; flujo 2 de la Fase 0.5 ampliado |
| 1.6 | 18-oct-2026 | Revisión del flujo 2 (D-26): programar en tres pasos (rutina, series y repeticiones, pesos); semana 1 = semana de la primera actividad registrada; pestañas internas de Gym en móvil; subsección Análisis en Salud. Datos del paseo MTB y calorías del día (D-27): CAR-01 y CAR-02 reescritos, flujo 5 con dos capturas |
| 1.7 | 18-oct-2026 | Objetivos, bienvenida y medidas corporales completas (D-28, excepción al backlog cerrado): módulo nuevo Objetivos (OBJ-01 a OBJ-04), bienvenida de primer uso (SIS-08), perfil editable (SIS-09), SAL-02 reescrito con la lista completa de medidas, medidas calculadas (SAL-07), re-preguntas del coach (COA-05); contexto fijo del coach ampliado; flujo 10 de la Fase 0.5 (bienvenida) y flujos 6 y 8 ampliados; ilustraciones solo en la bienvenida (ADR 0024) |
| 1.8 | 18-oct-2026 | Revisión del flujo 1 (D-29): regla de la rampa según las reps objetivo (GYM-05), descanso, ajustes al vuelo y resumen al cerrar (GYM-04); ciclos de entrenamiento al backlog |
| 1.9 | 18-oct-2026 | Guía del flujo 1 aprobada (D-30): modo gym también en la web como PWA, sesión sin programar, redondeo de la rampa, mancuernas, series por tiempo y cifra del descanso |
| 1.10 | 18-oct-2026 | Flujo 1 aprobado (D-31): otra sesión el mismo día, volumen ×4 en ejercicios por pierna con mancuernas, serie por tiempo, sesión minimizada, avisos que no tapan acciones, contraste del subitem activo web corregido |
| 1.11 | 18-oct-2026 | Revisión del flujo 10 (D-32): conexiones antes del punto de partida, cálculo de kcal y proteína en la bienvenida, bienvenida en móvil y web con retomar en el otro dispositivo |

## 1. Resumen ejecutivo

Construimos una plataforma propia: backend en Python, web en React y app Android en React Native, desplegada en tu servidor Oracle y desarrollada con Claude Code en VS Code con un equipo de agentes dirigido por un Project Manager.

- **Reemplaza** GymTracker en Sheets y el enfoque de archivos .md en Cursor.
- **Nutrición propia:** registro de comidas y base de alimentos dominicanos dentro del sistema; Cronometer pasa a opcional (no tiene API pública).
- **Strava no puede alimentar al coach IA** por sus términos; los paseos de MTB entran por captura de pantalla de Strava en el chat del coach (ADR 0005), con archivo GPX opcional para ver la ruta.
- **Obsidian:** no como base del sistema; sí como bóveda de documentación del proyecto (opcional).
- **Arranque físico:** Full Body A/B/C desde cero, combinado con MTB.

## 2. Punto de partida

Gym parado desde el 2 de junio (19 semanas), MTB desde hace 12 semanas, sin Cronometer ni análisis de sangre. El cardio de base está mejor que en abril; la fuerza hay que reconstruirla.

| Tema | Estado hoy | Consecuencia |
| --- | --- | --- |
| Gym | Parado desde 2-jun-2026 | Reinicio Full Body A/B/C desde semana 1 (exploración) |
| MTB | 12 semanas activo | Se integra como carga cardiovascular; afecta recuperación de piernas y calorías |
| Renpho | Pesado hoy 17-oct | Nuevo baseline cargado (Anexo A.2b): prácticamente igual que en abril |
| Cronometer | Nunca usado | Registro nutricional nativo en el sistema |
| Suplementos | Se gestionan en módulo propio | Inventario, dosis, horarios y cálculo dentro de nutrición y dashboard |
| Análisis de sangre | Pendiente | Lista de pruebas al arrancar (módulo Salud) |
| GymTracker v1 / Sheets | Descartado | Todo dentro de la nueva plataforma |

**Sobre los suplementos que preguntabas:** eran los del plan de abril (whey, creatina, D3, omega-3, magnesio glicinato y zinc). Quedan como catálogo inicial del módulo de Suplementación.

## 3. Visión, objetivos y métricas de éxito

Un coach personal de élite que conoce todos tus datos y una plataforma que hace fácil registrarlos. El éxito se mide en tu progreso físico y en que uses el sistema todos los días.

### Objetivos del producto

| # | Objetivo | Métrica de éxito |
| --- | --- | --- |
| O1 | Que registres sin fricción | Registrar una serie en el gym ≤ 3 toques; una comida ≤ 30 s |
| O2 | Que lo uses de forma constante | ≥ 90% de sesiones de gym y ≥ 80% de días de comida registrados |
| O3 | Que el coach decida con datos reales | 100% de respuestas basadas en tus datos o declarando que faltan |
| O4 | Que veas tu progreso | Tendencias de peso, grasa, fuerza y volumen muscular siempre visibles |
| O5 | Que el sistema sea confiable | Cero pérdida de datos; servicio disponible ≥ 99% |

### Objetivos físicos (los que el sistema debe ayudarte a cumplir)

Las metas de composición corporal están en el Anexo A. Como hubo una pausa de junio a octubre, se recalcularon en la Fase 0 a partir de la medición de hoy (PRD, sección 5), y en la app se cargan como tu objetivo principal (OBJ-01).

## 4. Alcance, supuestos y restricciones

Es un producto personal para un solo usuario: tú. Todo lo que no ayude a ese objetivo queda fuera de la versión 1.0.

| Dentro de la v1.0 | Fuera de la v1.0 |
| --- | --- |
| Web responsive instalable (PWA), app Android y app para Galaxy Watch (Wear OS) | App iOS |
| Gym, salud, nutrición, suplementos, cardio/MTB, objetivos y metas, coach IA, dashboard; bienvenida de primer uso y perfil editable | Apertura al público y registro de otros usuarios (la arquitectura queda lista, sección 11) |
| Sync automático Renpho; MTB por captura | API de Strava y de Cronometer |
| Base de alimentos dominicanos sobre USDA | Escáner de código de barras (backlog) |
| Despliegue en tu servidor Oracle | Publicación en Google Play |
| Protocolo de entrenamiento y nutrición natural | Farmacología y protocolo capilar |

### Supuestos

- Tienes acceso al servidor Oracle y a una cuenta de GitHub.
- El desarrollo usa tu suscripción de Claude (Claude Code); el coach de la app usa la API de Anthropic (ver sección 18).
- La librería no oficial de Renpho sigue funcionando; si no, se usa importación CSV.
- Usas el sistema en español; el peso corporal y las cargas del gym en libras y lo demás en sistema métrico, cambiable en Ajustes → Unidades (SIS-07).

### Restricciones

- Infraestructura dentro de la capa gratuita de Oracle (ARM), dedicada a este sistema (el servidor de Minecraft se retiró por completo, D-20).
- Sin datos de Strava vía API, por sus términos.
- El coach no da diagnósticos médicos ni prescribe fármacos.

## 5. Módulos y requisitos funcionales

Ocho módulos sobre una sola base de datos; el coach lee todos.

| Módulo | Qué incluye |
| --- | --- |
| **Dashboard** | Resumen del día: entreno programado, macros vs objetivo, suplementos pendientes, peso y tendencia, volumen muscular semanal, alertas del coach |
| **Salud y composición** | Mediciones Renpho (todos los campos), medidas corporales completas (obligatorias, recomendadas y opcionales) y medidas calculadas, análisis de sangre con rangos, entrada manual de cualquier dato, gráficos de tendencia |
| **Entrenamiento (Gym)** | Biblioteca de ejercicios con implicación por músculo, rutinas personalizadas, calendario de sesiones pasadas y futuras con pesos por ejercicio, modo gym (tachar series, cambiar peso/reps, temporizador de descanso), series rampa automáticas, historial y récords, volumen por músculo individual |
| **Cardio / MTB** | Paseos registrados desde capturas de pantalla de Strava en el chat del coach (distancia, desnivel positivo, tiempo en movimiento, velocidad media, calorías, frecuencia cardiaca promedio y, de una segunda captura, el % de tiempo y el rango en ppm de cada zona de FC (Z1 a Z5)), con confirmación antes de guardar; carga cardiovascular, efecto sobre recuperación y calorías |
| **Nutrición** | Registro de comidas, base de alimentos dominicanos con nutrientes completos, recetas y platos, planes día/semana/mes, objetivos por tipo de día, micronutrientes, importación opcional de Cronometer |
| **Suplementación** | Catálogo, inventario y compras, dosis y horarios, registro de toma, aporte de nutrientes sumado al plan, alertas (ej. stock bajo, dosis olvidada) |
| **Objetivos** | Objetivo principal con meta medible y fecha, metas intermedias cada 4 semanas, metas por medida y por fuerza, hitos; tarjeta en Hoy y página propia |
| **Coach IA** | Chat con acceso a todos los datos vía herramientas, memoria de decisiones, revisiones semanales automáticas, generación de planes y rutinas, re-preguntas periódicas de lo que cambia |

### Cómo se mide el trabajo por músculo

Cada ejercicio tiene un peso de implicación por músculo (ej. press banca: pectoral mayor 1.0, deltoides anterior 0.5, tríceps 0.5). El sistema suma series efectivas ponderadas por músculo y semana y las compara con rangos objetivo. Así ves, por ejemplo, que el deltoides posterior recibe la mitad que el anterior.

### Base de alimentos y unidades de medida

Todo nutriente se guarda por 100 g; tú registras en la unidad que quieras y el sistema convierte a gramos antes de calcular.

| Unidad | Conversión a gramos |
| --- | --- |
| Gramo (g) | 1 g |
| Kilogramo (kg) | 1,000 g |
| Libra (lb) | 453.592 g |
| Onza (oz) | 28.3495 g |
| Mililitro (ml) | ml × densidad del alimento (g/ml) |
| Litro (L) | 1,000 ml × densidad del alimento |

- **Densidad por alimento:** los líquidos no pesan todos igual (agua 1.00, leche \~1.03, aceite \~0.92 g/ml). Cada alimento líquido guarda su densidad; si falta, se asume 1.00 y se marca como estimado.
- **Porciones caseras** como opción extra: taza, cucharada, unidad, cucharón, con su equivalencia en gramos por alimento.
- **Fuentes de la base inicial:** USDA FoodData Central (micros completos, dominio público), tabla INCAP como apoyo para alimentos locales, Open Food Facts para productos con código de barras, y registros manuales tuyos. Cada alimento guarda su fuente.
- **Crudo vs cocido** con factores de rendimiento, y recetas calculadas desde sus ingredientes.

### Unidades preferidas (SIS-07)

Cada usuario guarda en Ajustes → Unidades cómo quiere ver y escribir sus datos. La preferencia vive en su cuenta y se aplica en la web, el móvil, el reloj y las respuestas del coach. Cambiarla no modifica ningún dato: solo cambia cómo se muestra.

| Magnitud | Opciones | De fábrica |
| --- | --- | --- |
| Peso corporal | kg · lb | lb |
| Cargas del gym | kg · lb | lb |
| Estatura | m · cm · pies y pulgadas (5′ 9″) | cm |
| Perímetros (todos los de SAL-02) | cm · pulgadas | cm |
| Distancia (MTB y cardio) | km · millas | km |

- **Comida:** la unidad se elige en cada registro (NUT-02); los nutrientes siempre en g, mg o µg.
- **Por dentro:** todo se guarda en kg, cm y m, junto con la unidad en que se escribió; la conversión ocurre solo al mostrar (ADR 0023).
- **Gym en libras:** los incrementos, la rampa (GYM-05) y la sugerencia de progresión se redondean a pasos de disco en la unidad elegida (por ejemplo, 5 lb en vez de 2.5 kg).
- **Derivadas:** la velocidad y el desnivel siguen a la distancia (km/h y m, o mph y pies).
- **Fijas:** los pliegues cutáneos van siempre en mm, la presión arterial en mmHg y la frecuencia cardiaca en ppm.

### Objetivos (OBJ)

Módulo nuevo de la v1.0 (D-28). Ordena todo lo demás hacia una meta con fecha y le da al coach con qué juzgar el progreso.

| Pieza | Cómo funciona |
| --- | --- |
| Objetivo principal (OBJ-01) | Tipo (perder grasa, ganar músculo, recomposición, fuerza, salud general, rendimiento MTB), meta medible (peso, % de grasa, cintura u otra) y fecha. Uno activo a la vez; los anteriores quedan en el historial. Las metas de enero 2027 del PRD (sección 5) se cargan como el objetivo principal de Francis |
| Metas intermedias (OBJ-02) | La app propone una cada 4 semanas, repartiendo en línea recta el camino desde la media de 7 días hasta la meta principal. El usuario las edita, añade o borra. El coach juzga cada una como adelante, en ritmo o atrasado con la media de 7 días y la tendencia de 4 semanas |
| Metas por medida y por fuerza (OBJ-03) | Para cualquier medida de SAL-02 y para ejercicios (carga o repeticiones, en la unidad preferida de cargas). Se ven como línea punteada de referencia en su gráfico; esa línea no cuenta como serie |
| Hitos (OBJ-04) | Se registra un hito al cumplir una meta intermedia, por medida o de fuerza, junto con los récords personales de GYM-07. Aviso discreto y lista de hitos en la página de Objetivos. Las rachas siguen fuera de la v1.0 |
| Dónde se ve | Tarjeta en Hoy con el objetivo principal y la próxima meta intermedia; al tocarla abre la página de Objetivos. No es una sexta pestaña |

### Bienvenida y perfil (SIS-08, SIS-09)

La primera vez que entras, la app te pregunta lo que el coach necesita saber de ti en 7 pasos (unos 3 minutos). Cada paso lleva una ilustración vectorial (ADR 0024). Puedes salir y retomar donde ibas, también en otro dispositivo (móvil o web), y todo se edita después en su sección.

**Cálculo de tu plan (paso 7, D-32):** gasto en reposo con Katch-McArdle si ya se conoce el % de grasa (Renpho o Marina) y, si no, con Mifflin-St Jeor; multiplicado por el nivel de actividad del paso 3. Ajuste según el objetivo: −15 a −20 % para perder grasa, −10 % en recomposición, +5 a +10 % para ganar músculo y mantenimiento en fuerza, salud general y rendimiento MTB. Proteína de 1.8 a 2.2 g por kg. Para Francis no cambia nada: sigue el objetivo fijo de 2,350 kcal y 187 g de proteína hasta la revisión de las 6 semanas.

| Paso | Qué pregunta |
| --- | --- |
| 1. Tú | Nombre, fecha de nacimiento, sexo, estatura y unidades (SIS-07) |
| 2. Tu objetivo | Objetivo principal (OBJ-01) |
| 3. Tu actividad | Experiencia o etapa en el gym, días por semana, duración y horario de la sesión, actividad fuera del gym (nivel diario) y MTB (frecuencia) |
| 4. Tu salud | Lesiones o molestias, condiciones relevantes, alergias y restricciones alimentarias, con "ninguna" en un toque. El coach lo usa para tu seguridad y nunca diagnostica ni prescribe |
| 5. Conexiones | Renpho, Health Connect y reloj; todas se pueden saltar (D-32: van antes del punto de partida para no escribir dos veces lo que trae Renpho) |
| 6. Tu punto de partida | Peso y cintura obligatorios; el resto de medidas con "lo mido luego". Lo que trae Renpho (peso, % de grasa, masa muscular) llega lleno y se puede corregir |
| 7. Tu plan | Resumen con kcal, proteína y primeras metas intermedias: "esto es lo que el coach sabe de ti" |

El perfil (SIS-09) vive en Ajustes: todo lo de la bienvenida más lo que se llena después (preferencias de comida, presupuesto, si cocina, suplementos actuales, sueño y estrés habituales). Cada cambio guarda historial con fecha.

### Medidas corporales (SAL-02, SAL-07)

| Grupo | Medidas |
| --- | --- |
| Obligatorias | Estatura (una vez), peso, cintura (ombligo) |
| Recomendadas | Cuello, hombros, pecho, cadera, brazo relajado y contraído, muslo, pantorrilla |
| Opcionales | Antebrazo, muñeca, tobillo, abdomen bajo; lado izquierdo y derecho en las bilaterales (de fábrica solo el derecho, como en el Anexo A.3); pliegues cutáneos (7 sitios); FC en reposo y presión arterial |
| Automáticas | Los campos de Renpho (SAL-01) |
| Calculadas (SAL-07) | IMC, cintura/estatura, cintura/cadera, hombros/cintura y % de grasa por el método de la Marina de EE. UU. (cuello, cintura y estatura; cadera en mujeres), como segunda opinión frente a la bioimpedancia de la báscula |

Frecuencia sugerida: peso a diario y cinta cada 4 semanas; el coach lo recuerda (COA-05).

### Modo gym y series rampa (GYM-04, GYM-05)

Decidido en la revisión del flujo 1 (D-29).

- **Descanso:** cuenta regresiva con +15 s, −15 s y saltar. Al terminar, el teléfono vibra y empieza a contar el tiempo extra (GYM-09).
- **Ajustes al vuelo:** cambiar peso o reps de una serie solo afecta a esa sesión; la rutina no cambia.
- **Cerrar sesión:** resumen con tiempos (GYM-09), volumen, récords (GYM-07) e hitos (OBJ-04), y el botón "Guardar".

**Regla de la rampa.** La app calcula las series rampa desde el peso de trabajo y las **reps objetivo** de cada ejercicio, porque las reps indican la intensidad real; así funciona igual en un día de fuerza, de hipertrofia o mezclado, sin una etiqueta de ciclo.

| Reps objetivo | Rampa en el primer ejercicio de cada grupo muscular |
| --- | --- |
| 1-5 (fuerza) | 4 series: 40 % ×5, 60 % ×3, 75 % ×2, 85 % ×1. Potenciación opcional al 92 % ×1 |
| 6-12 (hipertrofia) | Hasta 95 lb: 50 % ×6. De 100 a 185 lb: 50 % ×5, 75 % ×3. Más de 185 lb: 45 % ×5, 65 % ×3, 85 % ×1 |
| 13 o más | 50 % ×8, o ninguna si es de aislamiento |

- Si el ejercicio trabaja músculos ya calientes por un ejercicio anterior de la sesión: una sola serie de tanteo (70 % ×3).
- Los ejercicios de aislamiento no llevan rampa.
- 60 s de descanso entre series rampa; pocas reps para no gastar energía.
- Redondeo a pasos de disco en la unidad elegida (5 lb de fábrica); si dos series quedan con el mismo peso se elimina una; nunca menos que la barra.
- La potenciación viene apagada y se activa por ejercicio en la rutina (GYM-02).
- Las series rampa no cuentan para el volumen (GYM-06) y se pueden saltar o editar en la sesión.

**Detalles aprobados con la guía del flujo 1 (D-30):**

- **Dónde se entrena:** teléfono (app Android o la web como PWA, con el mismo modo gym) y reloj; en la web de escritorio la sesión en curso es de solo lectura.
- **Pantalla:** el modo gym ocupa toda la pantalla y oculta la barra inferior; una flecha lo minimiza. La serie se tacha con la casilla o con el botón grande "Serie hecha" abajo. Finalizar está siempre en la cabecera, sin confirmación.
- **Ajuste al vuelo:** se abre tocando la cifra de la serie; aplica a "Las que faltan" del ejercicio de fábrica, o a "Solo esta serie".
- **Sesión sin programar:** parte de una rutina (de fábrica, la siguiente de la rotación) o vacía.
- **Redondeo de la rampa:** cuando cae justo en medio, hacia abajo.
- **Mancuernas:** la mínima es 5 lb de fábrica; el volumen en carga cuenta las dos mancuernas.
- **Series por tiempo:** ejercicios como la plancha se registran en segundos, con su cuenta regresiva.
- **Descanso:** cifra más grande que la cifra héroe, solo en el modo gym (token propio).

**Flujo 1 aprobado (D-31):**

- **Otra sesión el mismo día:** con la sesión de hoy hecha, Gym › Sesión ofrece "Empezar otra sesión"; la hecha sigue de solo lectura.
- **Volumen con mancuernas por pierna** (sentadilla búlgara): cuenta las dos mancuernas y las dos piernas (×4).
- **Serie por tiempo:** empieza con play, se tacha sola al llegar a cero y ofrece "Terminé antes" (guarda los segundos reales).
- **Sesión minimizada:** franja sobre la barra inferior con el tiempo total, el estado y "Volver".
- **Avisos:** nunca tapan la acción principal ni los atajos del modo gym.
- **Ajuste al vuelo:** la hoja dice a qué series se aplicará el cambio antes de tocar "Aplicar cambio".

### Centro de ayuda (guía de uso)

Una sección "Ayuda" dentro de la app web que se escribe a la par del desarrollo: cada funcionalidad nueva llega con su guía. Sirve para aprender a usar la plataforma completa: web, app Android y reloj.

| Elemento | Cómo funciona |
| --- | --- |
| Dónde | Sección "Ayuda" en la web, con buscador e índice por módulo. Desde la app y el reloj, "Ayuda" abre la guía correspondiente |
| Contenido | Guías paso a paso con capturas: qué es, para qué sirve, cómo se hace, preguntas frecuentes. Separadas por plataforma (web, Android, reloj) cuando cambian |
| Ayuda en contexto | Un ícono "?" en cada pantalla lleva directo a su guía |
| Capturas siempre al día | Se generan solas con las pruebas automáticas (Playwright en web, Maestro en Android, capturas del emulador en el reloj); si la pantalla cambia, la captura se actualiza en el CI |
| Novedades | Página "Qué hay de nuevo" con cada versión publicada, en lenguaje de usuario |
| Primeros pasos | Guía que sigue a la bienvenida (SIS-08): perfil, primera sesión de gym, primera comida, conectar reloj y Samsung Health |
| Formato | Archivos MDX en el repo (`apps/web/src/ayuda/`), versionados junto al código |

Regla: una funcionalidad no se da por terminada sin su guía (Definition of Done).

### Requisitos funcionales

Cada requisito tiene un identificador que se usa en tareas, tests y pull requests. Prioridad: **M** = imprescindible en v1.0, **S** = debería entrar, **C** = si da tiempo, **W** = espera para después de la v1.0.

| ID | Requisito | Prioridad |
| --- | --- | --- |
| GYM-01 | Biblioteca de ejercicios con implicación ponderada por músculo, equipo, instrucciones y sustitutos | M |
| GYM-02 | Crear y editar rutinas (ejercicios, series, reps, descanso, si aplica rampa) | M |
| GYM-03 | Calendario de entrenamientos con días pasados (sesión hecha o no hecha, con su resumen), hoy y futuros (programar, mover y copiar sesiones con rutina, series, repeticiones y peso por ejercicio); muestra también paseos MTB y citas de análisis de sangre | M |
| GYM-04 | Modo gym: tachar series, editar peso y reps al vuelo, temporizador de descanso con vibración y aviso | M |
| GYM-05 | Series rampa y de potenciación calculadas automáticamente desde el peso de trabajo | M |
| GYM-06 | Volumen semanal por músculo individual vs rango objetivo | M |
| GYM-07 | Historial, récords personales, 1RM estimado y RM múltiples (3RM, 5RM, 8RM, 10RM) por ejercicio | M |
| GYM-08 | RPE/RIR por serie y sugerencia de progresión | W |
| GYM-09 | Cronometría de la sesión: tiempo total, tiempo en series, descanso programado y tiempo extra de descanso, por serie, por ejercicio y por sesión (en teléfono, reloj y estadísticas) | M |
| WAT-01 | Iniciar desde el reloj la sesión programada del día | M |
| WAT-02 | Ciclo de serie en el reloj: ver ejercicio, serie, peso y reps; check al terminar; descanso automático; vibración al acabar; espera en pausa hasta play manual | M |
| WAT-03 | Ajuste rápido de peso y reps desde el reloj (+/− con la bisel o botones) | S |
| WAT-04 | Frecuencia cardíaca durante la sesión (Health Services) guardada con el entreno | S |
| WAT-05 | El reloj sigue funcionando si el teléfono se aleja o pierde señal; sincroniza al reconectar | M |
| WAT-06 | Sincronización en tiempo real reloj ↔ teléfono por Bluetooth: cada acción llega al teléfono al instante, con confirmación y reintento | M |
| GYM-10 | Autoguardado continuo de la sesión y recuperación tras cierre, apagado o falta de batería; cierre automático tras 2 h sin actividad, sin perder datos | M |
| SAL-01 | Sync diario de Renpho con todos los campos y fecha real de medición | M |
| SAL-02 | Medidas corporales completas: obligatorias (estatura una vez, peso, cintura en el ombligo), recomendadas (cuello, hombros, pecho, cadera, brazo relajado y contraído, muslo, pantorrilla), opcionales (antebrazo, muñeca, tobillo, abdomen bajo, lado izquierdo y derecho en las bilaterales con solo el derecho de fábrica, pliegues cutáneos en 7 sitios, FC en reposo y presión arterial) y automáticas (campos de Renpho, SAL-01); registro manual de cualquier otra métrica. Frecuencia sugerida: peso diario, cinta cada 4 semanas | M |
| SAL-03 | Fotos de progreso con comparador lado a lado | W |
| SAL-04 | Análisis de sangre con rangos de referencia y tendencias, más calendario de análisis con recordatorios y preparación | M |
| SAL-05 | Check-in diario: sueño, energía, dolor, estrés | W |
| SAL-06 | Lectura de Samsung Health vía Health Connect en la app Android: pasos, frecuencia cardíaca diaria y en reposo, sueño | M |
| SAL-07 | Medidas calculadas: IMC, cintura/estatura, cintura/cadera, hombros/cintura y % de grasa por el método de la Marina de EE. UU. (cuello, cintura y estatura; cadera en mujeres) como segunda opinión frente a la báscula de bioimpedancia | M |
| NUT-01 | Base de alimentos con nutrientes completos por 100 g y fuente | M |
| NUT-02 | Registro de comidas en g, kg, lb, oz, ml, L o porción casera | M |
| NUT-03 | Totales diarios de macros y micros vs objetivos por tipo de día | M |
| NUT-04 | Recetas calculadas desde ingredientes con factor crudo/cocido | M |
| NUT-05 | Planes de comida de día, semana y mes generados por el coach | M |
| NUT-06 | Lista de compras desde el plan semanal | W |
| NUT-07 | Registro de comida por foto o texto libre | W |
| NUT-08 | Importación CSV de Cronometer | W |
| NUT-09 | Alimentos frecuentes y recientes con su porción habitual; total del plato (kcal y macros) mientras se arma | M |
| SUP-01 | Catálogo de suplementos con nutrientes, dosis y horario | M |
| SUP-02 | Registro de toma; aporte sumado a los totales del día | M |
| SUP-03 | Inventario y alerta de stock bajo | S |
| CAR-01 | Registro de paseo MTB desde dos capturas de Strava (actividad y zonas de FC), con tarjeta de confirmación: distancia, desnivel positivo, tiempo en movimiento, velocidad media, calorías, frecuencia cardiaca promedio y el % de tiempo y el rango en ppm de cada zona de FC (Z1 a Z5) | M |
| CAR-02 | Carga combinada gym + MTB: efecto en calorías (el objetivo del día del paseo sube con una parte de sus kcal, D-27), recuperación y programación de sesiones; el coach usa FC y zonas para medir el esfuerzo de cada paseo | M |
| COA-01 | Chat con el coach con acceso a todos los módulos vía herramientas | M |
| COA-02 | Memoria de decisiones y preferencias | M |
| COA-03 | Consejos y alertas del coach en el inicio del día y el panel web (diarios), más revisión semanal automática | M |
| COA-04 | Propuestas de plan o rutina que tú apruebas antes de guardar | M |
| COA-05 | Re-preguntas periódicas de lo que cambia: cinta y actividad cada 4 semanas; salud y lesiones cada 3 meses o cuando lo menciones. Las respuestas actualizan su sección (SIS-09, SAL-02) con historial. No es el check-in diario (SAL-05, W) | M |
| DSH-01 | Dashboard del día: entreno, comidas, suplementos, peso, alertas | M |
| DSH-02 | Informe mensual en PDF: composición, fuerza, nutrición, cardio y cumplimiento del mes | M |
| OBJ-01 | Objetivo principal: tipo (perder grasa, ganar músculo, recomposición, fuerza, salud general, rendimiento MTB), meta medible (peso, % de grasa, cintura u otra) y fecha; uno activo a la vez, con historial de los anteriores. Tarjeta en Hoy con el objetivo y la próxima meta intermedia, que abre la página de Objetivos | M |
| OBJ-02 | Metas intermedias: la app propone una cada 4 semanas (lineal sobre la media de 7 días); el usuario las edita, añade o borra; el coach juzga el progreso (adelante, en ritmo, atrasado) con la media de 7 días y la tendencia de 4 semanas | M |
| OBJ-03 | Metas por medida (cualquiera de SAL-02) y por fuerza (carga o repeticiones de un ejercicio, en la unidad preferida de cargas), como línea punteada de referencia en sus gráficos | M |
| OBJ-04 | Hitos al cumplir una meta intermedia, por medida o de fuerza, junto con los récords de GYM-07; aviso discreto y lista en la página de Objetivos | M |
| SIS-01 | Inicio de sesión seguro y sesión persistente en web y app | M |
| SIS-02 | Exportar todos tus datos (CSV/JSON) | S |
| SIS-03 | Modo claro, oscuro o según el sistema, en web y móvil | M |
| SIS-04 | Ajustes de apariencia: acentos predefinidos, plantillas sugeridas, color propio con selector y campo HEX, escala generada y verificación de contraste; guardar plantillas propias | M |
| SIS-05 | Marca configurable: nombre, logo e ícono de la app definidos en un solo lugar (archivo de marca) y cambiables sin tocar código de pantallas | M |
| SIS-06 | Centro de ayuda en la web con guías de uso de web, Android y reloj, capturas automáticas, ayuda en contexto y página de novedades | M |
| SIS-07 | Unidades preferidas en Ajustes: peso corporal y cargas del gym (kg o lb), estatura (m, cm o pies y pulgadas), perímetros (cm o pulgadas) y distancia (km o millas); guardadas en la cuenta y aplicadas en web, móvil, reloj y coach | M |
| SIS-08 | Bienvenida de primer uso en 7 pasos (~3 min), con ilustración vectorial por paso: tú, tu objetivo, tu actividad, tu salud, tu punto de partida, conexiones y tu plan; se puede salir y retomar, y todo se edita después en su sección | M |
| SIS-09 | Perfil editable en Ajustes: lo de la bienvenida más preferencias de comida, presupuesto, si cocina, suplementos actuales, sueño y estrés; cada cambio guarda historial con fecha | M |

## 6. Requisitos no funcionales

Definen cómo debe comportarse el sistema, no qué hace. Cada uno tiene una forma de verificarse.

| ID | Atributo | Requisito | Cómo se verifica |
| --- | --- | --- | --- |
| RNF-01 | Rendimiento | Pantallas principales cargan en < 2 s en 4G; acciones del modo gym responden en < 200 ms | Lighthouse y pruebas E2E con tiempos |
| RNF-02 | Disponibilidad | ≥ 99% mensual | Uptime Kuma |
| RNF-03 | Offline | El modo gym funciona sin señal y sincroniza sin duplicar ni perder series | Prueba E2E en modo avión |
| RNF-04 | Integridad | Cero pérdida de datos; cada registro guarda su fecha real | Tests de sincronización y restricciones de BD |
| RNF-05 | Respaldos | Backup diario; se puede perder como máximo 24 h (RPO) y restaurar en < 2 h (RTO) | Restauración de prueba mensual |
| RNF-06 | Seguridad | Ver sección 11 | Auditoría del revisor de seguridad |
| RNF-07 | Usabilidad | Uso con una mano en el gym; objetivos táctiles ≥ 44 px | UX Heuristics sin hallazgos de severidad 3-4 |
| RNF-08 | Accesibilidad | Contraste AA, textos escalables, modo oscuro | Auditoría de Impeccable y Lighthouse |
| RNF-09 | Mantenibilidad | Código tipado, documentado, cobertura de tests ≥ 80% en backend | CI |
| RNF-10 | Idioma y unidades | Interfaz en español; unidades preferidas por usuario (SIS-07), con peso corporal y cargas en lb y el resto en métrico de fábrica; datos guardados en kg, cm y m | Revisión de diseño y pruebas unitarias de conversión |
| RNF-11 | Costo | Infraestructura gratuita; gasto de IA con tope mensual configurable | Panel de costos |

## 7. Integraciones

Solo Renpho tiene una vía automática viable; Strava prohíbe usar sus datos con IA y Cronometer no ofrece API pública.

| Fuente | Situación verificada | Cómo la integramos |
| --- | --- | --- |
| Renpho | Sin API oficial. Hay librería Python no oficial mantenida (`renpho-py`, v1.2.0 julio 2026) que usa tu email y contraseña ([PyPI](https://pypi.org/project/renpho-py/)) | Sync automático diario en el backend + respaldo por importación CSV si se rompe |
| Strava | Desde nov-2024 sus términos prohíben usar datos de su API en IA; en junio 2026 endurecieron más el acceso ([TechRepublic](https://www.techrepublic.com/article/news-strava-api-scraping-crackdown), [DC Rainmaker](https://dcrainmaker.com/2024/11/stravas-changes-to-kill-off-apps.html)) | Sin API. Subes la captura de la actividad al chat; el coach lee los datos, te muestra una tarjeta para confirmar o corregir y los guarda en Cardio/MTB. La imagen queda adjunta a la actividad. Opcional: archivo GPX si quieres la ruta en mapa |
| Cronometer | No hay API para usuarios individuales; solo socios seleccionados y exportación CSV ([foro Cronometer](https://forums.cronometer.com/discussion/3365/any-chance-a-public-api-for-cronometer-will-be-available)) | Registro nativo en el sistema; importación CSV opcional |
| Android Health Connect | Samsung Health escribe en Health Connect y la app Android lo lee en el teléfono | v1.0 (Fase 7): pasos, frecuencia cardíaca diaria y en reposo, sueño. Strava sigue entrando por captura |

**Lo de Strava importa:** el coach analizando tus paseos es justo lo que los términos de su API prohíben a las apps conectadas; compartir tú mismo tus datos no pasa por esa API. Decidido: los paseos entran por captura de pantalla que tú subes al chat, sin conectar la API de Strava.

## 8. Coach IA, memoria y Obsidian

El coach no lee archivos sueltos: consulta la base de datos con herramientas, como lo haría un analista. Eso le da el panorama completo sin llenar su contexto.

### Cómo funciona el coach

- **Modelo:** Claude vía API de Anthropic, desde el backend.
- **Herramientas que le damos:** consultar mediciones, sesiones, volumen por músculo, nutrición por rango de fechas, suplementos, análisis; crear borradores de plan, rutina o sesión (tú apruebas antes de guardar).
- **Contexto fijo:** perfil (SIS-09), etapa actual, objetivo principal (OBJ-01), metas intermedias vigentes y su estado (OBJ-02), y reglas del coach (sin suavizar, no inventar datos).
- **Memoria:** tabla de decisiones y preferencias ("mantener face pull", "prefiere curl femoral a prensa") + resúmenes semanales automáticos. Búsqueda semántica con pgvector para recordar conversaciones viejas.
- **Proactivo:** un job semanal revisa tendencias y deja alertas en el dashboard.

### Obsidian: qué es y si nos conviene

Obsidian es una app de notas en Markdown, local, donde las notas se enlazan entre sí como un grafo ("segundo cerebro"). Se volvió popular para IA porque un agente puede leer y escribir esas notas como memoria de largo plazo.

| Uso | ¿Conviene? | Por qué |
| --- | --- | --- |
| Base de datos del coach | No | Tus datos son números con fechas; PostgreSQL los consulta, suma y grafica. Markdown no. |
| Memoria del coach | No | La tabla de memoria + pgvector hace lo mismo, accesible desde web y móvil |
| Documentación del proyecto (decisiones, arquitectura, specs) | Sí, opcional | La carpeta `docs/` del repo en Markdown se abre como bóveda de Obsidian; tú navegas el grafo y Claude Code la lee igual |
| Tu conocimiento personal (artículos, protocolos) | Opcional, más adelante | Podríamos importar notas a la memoria del coach |

Veredicto: escribimos la documentación compatible con Obsidian (enlaces `[[...]]`), y lo usas si te gusta. No es pieza crítica.

### Reglas y límites del coach

| El coach sí | El coach no |
| --- | --- |
| Responde directo, técnico y sin suavizar | Valida por comodidad |
| Basa cada respuesta en tus datos y dice qué datos usó | Inventa números o asume datos que no tiene |
| Propone planes, rutinas y ajustes como borrador | Guarda cambios sin tu aprobación |
| Señala patrones preocupantes sin que preguntes | Da diagnósticos médicos ni interpreta síntomas graves (te refiere a un médico) |
| Recomienda análisis de sangre y explica resultados en lenguaje claro | Prescribe medicamentos ni fármacos para rendimiento |
| Ajusta al ritmo real de progreso | Recomienda déficits extremos o volumen excesivo |

- **Pruebas del coach:** un conjunto fijo de preguntas con respuestas esperadas (evals) se corre en el CI cada vez que cambia el prompt o las herramientas.
- **Control de costo:** tope mensual de gasto en la API y registro de tokens por conversación.

## 9. Stack tecnológico

Python en el backend (por los datos y la librería de Renpho) y TypeScript en web y móvil para compartir tipos y cliente de API.

| Capa | Tecnología | Por qué |
| --- | --- | --- |
| Backend | Python 3.12 + FastAPI + Pydantic v2 | Rápido, tipado, genera OpenAPI automáticamente |
| ORM y migraciones | SQLAlchemy 2 + Alembic | Estándar maduro |
| Base de datos | PostgreSQL 16 + pgvector | Datos relacionales, series temporales y memoria semántica del coach en un solo motor |
| Tareas en segundo plano | Redis + ARQ | Sync Renpho, revisiones semanales del coach, recordatorios |
| IA | API de Anthropic (Claude) con tool use | Coach con acceso a herramientas sobre tus datos |
| Web | React + TypeScript + Vite, TanStack Router y Query | SPA rápida; no necesita SEO |
| Estilos y UI | Tailwind CSS + Radix UI (sin estilos) + design system propio | Control total del look, sin plantillas reconocibles |
| Gráficos y animación | Apache ECharts + Motion | Gráficos animados y transiciones fluidas |
| Móvil (Android) | Expo (React Native) + TypeScript, NativeWind, Reanimated | Reusa lógica y cliente de la web; acceso a Health Connect |
| Modo gym offline | SQLite local en la app + sincronización | El gym puede no tener señal; no pierdes series |
| Reloj (Galaxy Watch) | Kotlin + Jetpack Compose for Wear OS, Horologist, Health Services; Data Layer API con un módulo nativo en la app Expo | Wear OS no ejecuta React Native ni WebView; la app del reloj tiene que ser nativa |
| Cliente de API | Generado desde OpenAPI (paquete compartido) | Web y móvil siempre alineados con el backend |
| Monorepo | pnpm + Turborepo | `backend/`, `apps/web`, `apps/mobile`, `apps/watch`, `packages/*` en un repo |
| Pruebas | pytest, Vitest, Playwright (web E2E), Maestro (móvil E2E) | Cobertura por capa |
| Calidad | Ruff, mypy, ESLint, Prettier, pre-commit, detector de Impeccable | Errores atrapados antes del commit |
| CI/CD | GitHub + GitHub Actions | Tests en cada push, deploy al servidor al fusionar |
| Infraestructura | Docker Compose + Caddy (HTTPS automático) en Oracle Cloud | Un comando para levantar todo |
| Observabilidad y respaldos | Logs estructurados, Uptime Kuma, backup diario de Postgres a Object Storage | Tus datos no se pierden |

## 10. Arquitectura y datos

Web y app hablan con una sola API; tus datos viven en tu servidor y solo salen hacia Claude cuando hablas con el coach.

&#91;embedded content: arquitectura · 2 clientes, 4 servicios, 2 externos\]

Las capturas de los paseos MTB y los CSV opcionales se suben desde la web o la app hacia la misma API.

### Diseño de la base de datos

La base de datos se diseña en tres niveles, como en una empresa de desarrollo, y siempre la puedes ver como diagrama visual de tablas y relaciones.

1. **Modelo conceptual:** entidades y cómo se relacionan (Ejercicio ↔ Músculo, Sesión → Serie, Comida → Alimento → Nutriente). Lo apruebas en la Fase 0.5 junto con los flujos.
2. **Modelo lógico:** tablas, columnas, tipos, claves primarias y foráneas, cardinalidades (1-1, 1-N, N-N) y normalización.
3. **Modelo físico:** índices, restricciones, particiones por fecha para las series de tiempo, convenciones de nombres. Se implementa con migraciones de Alembic.

| Herramienta | Para qué | Cómo la usas |
| --- | --- | --- |
| DBML + [dbdiagram.io](https://dbdiagram.io) | Diagrama oficial del esquema, fuente de verdad del diseño | Archivo `docs/database/schema.dbml` en el repo; lo pegas o importas en dbdiagram.io y ves tablas y relaciones |
| DBeaver (gratis) | Explorar la base real: datos, consultas y diagrama ER generado desde la base viva | Te conectas a Postgres (local o servidor, por túnel SSH) |
| Mermaid en `docs/` | Diagramas ER por módulo dentro de la documentación | Se ven directo en GitHub, VS Code y Obsidian |

- **Siempre sincronizado:** en cada cambio de esquema, el CI regenera el DBML desde la base real y falla si el diagrama y la base no coinciden.
- **Diccionario de datos:** cada tabla y columna documentada (qué guarda, unidad, ejemplo), en `docs/database/`.
- **Revisión:** el Arquitecto diseña, el Revisor valida y tú apruebas el diagrama antes de cada migración importante.

### App móvil sin conexión (offline-first)

La app funciona igual con o sin internet: todo se guarda primero en el teléfono y se sincroniza con el servidor cuando vuelve la señal, sin que tengas que hacer nada.

**Qué funciona sin internet:**

- Ver sesiones programadas, rutinas, pesos asignados e historial reciente.
- Iniciar sesión de gym, tachar series, cambiar peso y reps, temporizador de descanso, cerrar sesión.
- Crear una sesión libre no programada.
- Registrar comidas y suplementos con los alimentos ya guardados en el teléfono.

**Qué necesita internet:** chat con el coach, subir capturas de MTB, sync de Renpho y buscar alimentos nuevos en la base completa. Si los intentas sin señal, quedan en cola y se envían al reconectar.

**Cómo funciona:**

1. **Descarga previa:** con señal (en casa), la app baja las sesiones de los próximos 14 días, rutinas, ejercicios, tus alimentos frecuentes y el historial reciente a una base SQLite en el teléfono.
2. **Todo se guarda local primero:** cada serie que tachas se escribe al instante en el teléfono, con un identificador único (UUID) y la hora real en que la hiciste.
3. **Cola de cambios:** cada registro pendiente entra en una cola de salida.
4. **Sincronización automática:** al detectar conexión (y en segundo plano cada cierto tiempo), la app envía la cola al servidor y baja cualquier cambio hecho desde la web.
5. **Sin duplicados:** el servidor reconoce el UUID; si un envío se repite porque se cortó la señal a mitad, no se duplica la serie.
6. **Conflictos:** si editaste lo mismo en web y móvil, se conserva el cambio más reciente por campo y queda registro del anterior; en series del gym, el registro del teléfono siempre gana.

**Indicador visible:** un ícono discreto muestra el estado (sin conexión · pendientes por subir · sincronizado) y cuántos registros faltan por enviar. Nunca se borra nada local hasta que el servidor confirma que lo recibió.

**Pruebas obligatorias (Fase 7):** sesión completa en modo avión; corte de señal a mitad de la sincronización; app cerrada a la fuerza con datos pendientes; edición simultánea en web y móvil. Criterio: cero series perdidas y cero duplicadas.

### App para Galaxy Watch

Para entrenar sin sacar el teléfono. El reloj hace lo esencial de la sesión; lo complejo (cambiar rutina, buscar ejercicios, registrar comida) sigue en el teléfono.

**Compatibilidad:** se apunta a Wear OS 3 o superior, así funciona en tu Galaxy Watch4 Classic (que ya recibe One UI 8 Watch / Wear OS 6, salvo modelos LTE que siguen en One UI 7) y en todos los Galaxy Watch posteriores.

**Cómo se comunica:** reloj y teléfono conectados por Bluetooth mediante el Data Layer de Wear OS (usa Bluetooth cuando están emparejados y cerca; Wi-Fi solo como respaldo). El teléfono sube los datos al servidor.

**Tiempo real y autoguardado (nada se pierde):**

1. Cada acción en el reloj (iniciar, check, play, ajuste de peso) se guarda primero en el propio reloj y se envía al instante al teléfono por Bluetooth.
2. El teléfono la escribe de inmediato en su base local (una transacción por evento) y le confirma al reloj. El reloj conserva el evento hasta recibir esa confirmación; si no llega, lo reintenta.
3. Lo mismo en la app del teléfono: cada serie, check o cambio se autoguarda en el momento, sin botón de guardar.
4. La sesión es un registro de eventos con hora real: si la app se cierra, el teléfono se apaga o se queda sin batería, al volver a abrir la sesión reaparece exactamente donde iba, con el cronómetro recalculado.
5. Si el teléfono se apaga a mitad del entreno, el reloj sigue funcionando solo y entrega todo cuando el teléfono vuelve.
6. Si no presionas "Finalizar": tras 2 horas sin actividad la sesión se cierra sola con hora de fin = último evento, y te queda un aviso para revisarla o ajustarla. No se descarta nada.

**Ciclo de una serie:**

| Estado | Qué ves en el reloj | Qué pasa al tocar |
| --- | --- | --- |
| Serie en curso | Ejercicio, serie 2 de 3, peso y reps objetivo, cronómetro de la serie | Check → serie hecha, empieza el descanso |
| Descanso | Cuenta regresiva grande (ej. 1:30) | +15 s / −15 s / saltar |
| Descanso terminado | Vibración; pantalla "Listo cuando quieras" y el tiempo extra contando | Play → empieza la siguiente serie o ejercicio |
| Fin de sesión | Resumen de tiempos | Guardar |

**Tiempos que se registran (GYM-09):**

| Métrica | Definición |
| --- | --- |
| Tiempo total | Desde iniciar hasta guardar la sesión |
| Tiempo en series | Suma desde cada play hasta su check |
| Descanso programado | Suma de los descansos definidos en la rutina |
| Tiempo extra | Tiempo entre el fin del descanso y el siguiente play |
| Por ejercicio | Los mismos tiempos desglosados por ejercicio y serie |

El mismo ciclo funciona en la app del teléfono; reloj y teléfono comparten el estado de la sesión en vivo. El coach usa estos tiempos (por ejemplo, si el tiempo extra crece semana a semana, puede ser fatiga).

**En una fase posterior:** frecuencia cardíaca en vivo y una complicación en la esfera con el entreno del día.

## 11. Seguridad y privacidad

Tus datos de salud son sensibles: viven en tu servidor, viajan cifrados y solo salen hacia la API de Anthropic cuando hablas con el coach. Dos capas de protección: red privada con Tailscale (nadie fuera de tu red puede ni ver que el sistema existe) y login dentro de la app.

| Área | Medida |
| --- | --- |
| Acceso | Login con contraseña fuerte + segundo factor (TOTP); sesiones con expiración; passkeys más adelante |
| Transporte | HTTPS obligatorio (Caddy); app y web solo hablan con la API |
| Secretos | Claves de Anthropic y Renpho en variables de entorno del servidor, nunca en el repo; escaneo de secretos en el CI |
| Servidor | Ningún puerto abierto a internet: web, API y SSH solo por Tailscale; firewall de Oracle cerrado; actualizaciones automáticas de seguridad |
| Base de datos | No expuesta a internet; usuario con permisos mínimos; acceso solo por túnel SSH |
| Respaldos | Cifrados antes de subir a Object Storage; restauración probada cada mes |
| Archivos | Fotos y capturas en almacenamiento privado, servidas solo a usuario autenticado |
| Datos hacia la IA | Solo se envía lo necesario para cada consulta; Anthropic no entrena con datos de la API comercial |
| Dependencias | Revisión automática de vulnerabilidades (Dependabot) |
| Exportar y borrar | Puedes exportar o eliminar tus datos cuando quieras |

### Acceso privado con Tailscale (v1.0)

Tailscale crea una red privada cifrada entre tus dispositivos y el servidor. El sistema no tiene dirección pública: solo responde a equipos de tu red.

| Pieza | Cómo queda |
| --- | --- |
| Servidor Oracle | Tailscale instalado; Caddy escucha solo en la IP de Tailscale |
| Dirección | Nombre privado con MagicDNS (`coach.tail72ec86.ts.net`, ADR 0020) con certificado HTTPS de Tailscale |
| Tu PC y laptop | Tailscale instalado → abres la web en el navegador |
| Tu Android | App de Tailscale activa → la app móvil apunta a la dirección privada |
| Salidas del servidor | Sigue saliendo a internet para Renpho y la API de Anthropic; nada entra desde fuera |
| Control de acceso | ACL de Tailscale: solo tus dispositivos llegan al puerto de la app |

- **Login igual:** aunque estés dentro de Tailscale, la app pide usuario, contraseña y segundo factor (TOTP). Si alguien toma tu teléfono desbloqueado, la sesión expira y la app puede pedir huella para abrir.
- **Offline-first sigue funcionando:** sin señal o sin Tailscale conectado, la app guarda local y sincroniza cuando el túnel vuelve.
- **Staging** también va por Tailscale, en otro nombre privado.

### Preparada para abrirse al público

Desde el primer día se construye como sistema multiusuario, aunque solo exista tu cuenta. Así abrirla después es configuración y trabajo acotado, no reescribir.

| Ya desde la v1.0 | Al abrir al público (fase futura) |
| --- | --- |
| Cada tabla con `user_id`; ninguna consulta sin filtrar por usuario | Página pública de registro con verificación de correo |
| Seguridad a nivel de fila en Postgres (RLS) como segunda barrera | Dominio público + Caddy en 443 con Let's Encrypt; Tailscale queda solo para SSH y administración |
| Roles: admin (tú) y usuario | Límites de uso (rate limiting) y protección anti-abuso |
| Autenticación estándar (OAuth2/OIDC con tokens) | Cuotas de IA por usuario y modelo de cobro si aplica |
| Configuración por usuario (unidades, objetivos, zona horaria) | Términos de uso y política de privacidad; consentimiento para datos de salud |
| Tests que prueban que un usuario no ve datos de otro | Auditoría de licencias y términos de todo lo que use el sistema (ver lista abajo) |

Mientras el uso sea solo personal, las licencias no requieren acción. Cuando decidas abrirla, el PM la planifica como una fase propia con auditoría de seguridad y de licencias. El PM mantiene desde ahora un inventario de licencias en `docs/licencias.md`, actualizado cada vez que se agrega una librería, fuente de datos o recurso, para que esa revisión sea rápida.

**Pendientes de revisar al abrir al público:**

- **Open Food Facts (ODbL):** atribución y compartir los datos derivados.
- **USDA FoodData Central:** dominio público; solo citar la fuente.
- **Tabla INCAP:** confirmar permiso de uso y redistribución.
- **Renpho:** la librería no oficial no sirve para un producto público; buscar acuerdo, otra vía o importación por archivo.
- **Strava:** confirmar que el registro por captura que hace cada usuario cumple sus términos.
- **API de Anthropic:** términos comerciales, costos por usuario y políticas para datos de salud.
- **Fuentes tipográficas, íconos e imágenes:** licencia para uso comercial.
- **Librerías de código y skills:** confirmar licencias compatibles (la mayoría MIT/Apache).

## 12. Entorno de desarrollo, agentes y metodología

VS Code con Claude Code (terminal integrada + extensión oficial). Cursor sobra: ya trae su propia IA y pagarías dos agentes para hacer lo mismo. JetBrains también funciona, pero VS Code es más ligero y es donde Claude Code tiene mejor integración.

### Herramientas

- **Herramienta única: VS Code** conectado a WSL, con la extensión de Claude Code (panel gráfico y diffs) y la terminal integrada. Todo el trabajo diario se hace ahí.
- **Dentro de VS Code:** varias conversaciones de Claude en pestañas o ventanas; vista previa de la web en el Simple Browser junto al código; Claude prueba la web con Playwright (Chromium sin ventana) dentro de WSL y revisa la consola; la integración Claude in Chrome no funciona en WSL. La app de escritorio de Claude no hace falta.
- **Android:** Expo. Pruebas en tu teléfono con una build de desarrollo; Android Studio solo para el SDK y el emulador.
- **Git + GitHub:** cada funcionalidad en su rama, con pull request revisado antes de fusionar.
- **Windows + WSL2 (Ubuntu):** el código vive y corre dentro de WSL2, con Docker Desktop para Postgres y Redis igual que en el servidor; VS Code se conecta a WSL. Detalle en "Preparación del entorno".

### Preparación del entorno (Fase S — Setup)

Antes de escribir una línea del producto se prepara todo lo necesario: cuentas, tu PC Windows, el servidor Oracle, el teléfono y el repositorio. Cada paso te lo guío en una guía en la conversación, y lo que se pueda automatizar lo hace Claude Code una vez instalado.

**1. Cuentas**

| Cuenta | Para qué | Costo | Estado |
| --- | --- | --- | --- |
| GitHub | Repositorio, backlog, CI | Gratis | Tienes |
| Claude (Pro o Max) | Claude Code para desarrollar | Tu suscripción actual | Tienes |
| Claude Console | Clave de API para el coach de la app | Créditos de API del plan Max | Por crear |
| Tailscale | Red privada entre PC, teléfono y servidor | Gratis (plan personal) | Por crear |
| Expo | Builds de la app Android | Gratis | Por crear |
| Oracle Cloud | Servidor | Gratis (capa gratuita) | Tienes |

**2. Tu PC Windows**

| Herramienta | Dónde | Para qué |
| --- | --- | --- |
| WSL2 + Ubuntu 24.04 | Windows | Entorno Linux igual al del servidor; todo el código vive aquí |
| Windows Terminal | Windows | Terminal para WSL |
| Docker Desktop (backend WSL2) | Windows | Postgres, Redis y la app en contenedores |
| VS Code + extensión WSL | Windows | Editor; abre el proyecto dentro de WSL |
| Extensiones VS Code | VS Code | Claude Code, Python, Pylance, Ruff, ESLint, Prettier, Tailwind CSS, Docker, GitLens, Mermaid, DBML |
| Claude Code (CLI) | WSL | El equipo de agentes |
| Git + GitHub CLI (`gh`) | WSL | Control de versiones y pull requests |
| Python 3.12 + uv | WSL | Backend |
| Node.js LTS + pnpm | WSL | Web, móvil y monorepo |
| Expo CLI + EAS CLI | WSL | App Android |
| DBeaver | Windows | Ver la base de datos y su diagrama |
| Tailscale | Windows | Entrar al sistema privado |
| Playwright + Chromium | WSL | Claude abre la app web, la recorre y revisa la consola por su cuenta (Claude in Chrome no funciona en WSL; Brave queda para tu uso) |
| Android Studio (opcional) | Windows | Emulador Android; no es obligatorio si pruebas en tu teléfono |

**3. Tu teléfono Samsung**

- Tailscale (app de Android) conectado a tu red.
- Samsung Health con sincronización hacia Health Connect activada.
- Build de desarrollo de la app (se instala por enlace de Expo, sin Play Store).

**4. Servidor Oracle** (lo hace Claude Code por SSH, con tu aprobación)

- Retirar el servidor de Minecraft (hecho: retirado por completo, D-20).
- Actualizar Ubuntu, crear usuario de despliegue, SSH solo con llave.
- Instalar Docker + Docker Compose y Tailscale.
- Cerrar en el firewall de Oracle todos los puertos públicos; acceso solo por Tailscale.
- Crear el bucket de Object Storage para respaldos.

**5. Repositorio y equipo de agentes**

- Monorepo (`backend/`, `apps/web`, `apps/mobile`, `apps/watch`, `packages/`, `docs/`).
- `CLAUDE.md` con las reglas del proyecto y definición de los agentes en `.claude/agents/` (PM, Arquitecto, Backend, Frontend, Móvil, Reloj, Diseñador, QA, Revisor, Documentador).
- Skills instaladas: Impeccable y UX Heuristics; hooks de lint, tests y detector de diseño.
- GitHub Actions con el CI; `main` protegida (solo por pull request con CI en verde).
- `docs/licencias.md`, plantillas de issues y de pull request.

**Criterio de salida de la Fase S:** desde tu teléfono, conectado a Tailscale, abres una página "hola" servida por el servidor Oracle con HTTPS; el CI corre en verde en GitHub; y Claude Code abre el proyecto en VS Code dentro de WSL.

### Skills de programación

Tres grupos: las que trae Claude Code, plugins oficiales de Anthropic y skills propias del proyecto que creamos según aparezcan tareas repetidas.

| Skill o plugin | Origen | Uso en el proyecto |
| --- | --- | --- |
| `/code-review` | Incluida en Claude Code | Revisión de cada pull request (agente Revisor) |
| `/debug`, `/simplify` | Incluidas | Depurar fallos; limpiar código antes de cerrar una tarea |
| `/run`, `/verify` | Incluidas | Levantar la app y comprobar el cambio contra la app corriendo |
| `/claude-api` | Incluida | Referencia actualizada de la API para construir el coach |
| `/doctor`, `/skill-doctor` | Incluidas | Revisar la configuración y el costo de contexto de las skills |
| `feature-dev` | Plugin oficial | Flujo guiado de funcionalidad: explorar, diseñar, implementar, revisar |
| `commit-commands` | Plugin oficial | Commits y pull requests consistentes |
| `security-guidance` | Plugin oficial | Avisos de seguridad mientras se escribe código |
| Language servers (Python, TypeScript) | Plugins oficiales | Navegación y errores de tipos precisos |
| Impeccable, UX Heuristics | Terceros (MIT) | Diseño y usabilidad (sección 14) |

**Skills propias** (se crean con `skill-creator` cuando una tarea se repite): `/nuevo-endpoint`, `/nueva-migracion` (incluye actualizar el diagrama DBML), `/cierre-de-tarea` (checklist de Definition of Done), `/cierre-de-sesion`, `/deploy-staging` y `/release` (solo las ejecutas tú).

### Memoria del proyecto

Cada sesión de Claude empieza en blanco; el conocimiento se guarda en cinco capas, casi todas dentro del repositorio para que no dependa de una sola máquina. No hace falta una skill especial: es funcionalidad nativa de Claude Code más disciplina del PM.

| Capa | Dónde | Quién escribe | Qué guarda |
| --- | --- | --- | --- |
| `CLAUDE.md` | Raíz del repo + uno por app (`backend/`, `apps/web/`, `apps/mobile/`) | Tú y el PM | Reglas, comandos, convenciones; menos de 200 líneas cada uno |
| `.claude/rules/` | Repo | PM y Arquitecto | Reglas por tipo de archivo (ej. Python solo al tocar `backend/**`) |
| Memoria de cada agente | `.claude/agent-memory/<agente>/` (en git) | Cada agente | Aprendizajes: patrones, errores ya resueltos, decisiones de su área |
| Auto memory | Tu PC (`~/.claude/projects/…/memory/`) | Claude, solo | Tus preferencias y correcciones; local, no va a git |
| Documentación | `docs/` (plan maestro, ADRs, specs, `estado.md`) + GitHub Issues + historial de git | PM y agentes | Fuente de verdad: qué se decidió, qué está hecho, qué falta |

- **Al cerrar cada sesión** el PM ejecuta `/cierre-de-sesion`: actualiza `docs/estado.md` (qué se hizo, qué sigue, bloqueos), registra ADRs nuevos y mueve issues en el tablero. La siguiente sesión arranca leyendo eso.
- **Este Plan Maestro** se exporta al repo como `docs/plan-maestro.md` en la Fase S y desde ahí se mantiene versionado.
- **Higiene:** cada fase cierra con `/doctor prompt-audit` para eliminar instrucciones viejas o contradictorias.
- Todo en Markdown con enlaces `[[...]]`: la carpeta `docs/` se abre como bóveda de Obsidian si quieres navegarla.

### ¿Múltiples agentes? Sí, pero con disciplina

Un solo agente para todo pierde foco en un proyecto de este tamaño. Muchos agentes en paralelo sin control generan código que choca. La fórmula: un Project Manager que orquesta y agentes especializados que trabajan casi siempre en secuencia; en paralelo solo cuando las tareas no se tocan (cada uno en su propio worktree de git).

| Agente | Responsabilidad |
| --- | --- |
| **Project Manager** | Mantiene el plan y el backlog, divide cada funcionalidad en tareas, asigna, verifica criterios de aceptación, bloquea lo que no pase pruebas, reporta avance |
| Arquitecto | Modelo de datos (conceptual, lógico y físico) con diagramas ER, diccionario de datos, contratos de API, decisiones técnicas (registradas como ADR) |
| Backend | Endpoints, lógica, jobs, integraciones, con tests |
| Frontend web | Pantallas, componentes del design system, gráficos |
| Móvil | App Expo, modo gym offline, Health Connect |
| Reloj | App Wear OS en Kotlin, ciclo de serie y descanso, vibración, sincronización con el teléfono y FC |
| Diseñador UI | Design system, tokens, revisión visual contra las reglas de diseño |
| QA / Tester | Escribe y corre pruebas unitarias, de integración y E2E; reporta fallos |
| Revisor de código y seguridad | Revisa cada PR con ojos frescos: bugs, seguridad, credenciales, rendimiento |
| Documentador | Escribe y mantiene el Centro de ayuda: guías paso a paso, capturas automáticas, novedades por versión |

### Flujo de cada funcionalidad

1. Tú apruebas la spec (qué hace, criterios de aceptación).
2. El PM la divide en tareas y crea la rama.
3. El agente especialista implementa con sus tests.
4. QA corre la batería completa y recorre el flujo con Playwright y revisa la consola; el revisor revisa el diff.
5. El PM verifica cada criterio de aceptación; si algo falla, vuelve al paso 3.
6. CI en GitHub pasa en verde y tú haces la demo final antes de fusionar.

**Candados automáticos:** reglas del proyecto en `CLAUDE.md`, hooks que corren lint y tests antes de dar una tarea por terminada, y CI que no deja fusionar código rojo. El PM es un agente: revisa mucho, pero el dueño del producto eres tú, y las pruebas automáticas son el juez final.

### Metodología de trabajo

Iteraciones cortas por fase, backlog visible y reglas claras de cuándo algo empieza y cuándo está terminado.

- **Backlog:** GitHub Issues + GitHub Projects (tablero Por hacer / En curso / En revisión / Hecho). Cada issue referencia su requisito (ej. GYM-04).
- **Ramas:** `main` siempre desplegable; una rama por tarea (`feat/gym-04-modo-gym`, `fix/…`); fusión solo por pull request.
- **Commits:** Conventional Commits (`feat:`, `fix:`, `docs:`…), que generan el changelog automáticamente.
- **Versionado:** SemVer (0.x durante el desarrollo, 1.0.0 al cerrar la Fase 8), con etiqueta por release.
- **Documentación:** `docs/` con PRD, ADRs (decisiones), specs por funcionalidad, esquema de BD y runbooks de operación.

**Definition of Ready** (una tarea puede empezar si):

- [ ] Tiene requisito y criterios de aceptación escritos
- [ ] Tiene mockup aprobado si toca interfaz
- [ ] Tiene impacto en BD definido si cambia el esquema

**Definition of Done** (una tarea está terminada si):

- [ ] Cumple todos los criterios de aceptación, verificados por el PM
- [ ] Tests escritos y en verde; cobertura no baja
- [ ] Lint, tipos y detector de diseño sin errores
- [ ] Revisión de código y seguridad aprobada
- [ ] Documentación y diagrama de BD actualizados
- [ ] Guía de uso en el Centro de ayuda escrita o actualizada, con capturas
- [ ] Si toca la web: Claude la recorrió en el navegador y la consola no muestra errores ni advertencias nuevas
- [ ] Desplegado en staging y probado

**Ceremonias por fase:** planificación al inicio (PM divide en tareas y estima), demo al final (tú pruebas), retrospectiva corta (qué mejorar en la siguiente).

## 13. Calidad y pruebas

Pirámide de pruebas: muchas unitarias rápidas, menos de integración y pocas end-to-end sobre los flujos críticos. Nada llega a `main` con el CI en rojo.

| Nivel | Qué prueba | Herramienta | Objetivo |
| --- | --- | --- | --- |
| Unitarias | Cálculos: conversiones de unidades, rampa, volumen por músculo, nutrientes de recetas | pytest, Vitest | ≥ 80% backend, ≥ 70% frontend |
| Integración | API + base de datos real, jobs, importación de Renpho | pytest + Postgres en contenedor | Todos los endpoints |
| Contrato | Web y app usan la misma API que el backend expone | Cliente generado desde OpenAPI | Sin cambios rompientes |
| End-to-end web | Flujos de la Fase 0.5 en el navegador | Playwright | Los 9 flujos clave de la web |
| End-to-end móvil | Modo gym offline y sincronización | Maestro | Flujos del gym |
| Reloj | Ciclo de serie, vibración, tiempos y sincronización con el teléfono | Pruebas de Compose for Wear OS + prueba real en el Watch4 Classic | Sesión completa sin teléfono cerca; matar la app, apagar el teléfono y cortar Bluetooth a mitad de sesión: cero series perdidas y sesión recuperada |
| Visual y UX | Diseño genérico de IA, usabilidad, accesibilidad | Impeccable, UX Heuristics, Lighthouse | Sin hallazgos críticos |
| Coach IA | Respuestas correctas, sin inventar datos | Evals propias | 100% de casos críticos |
| Seguridad | Dependencias, secretos, configuraciones | Dependabot, escaneo de secretos | Sin vulnerabilidades altas |

**Candados del CI en cada pull request:** lint y tipos → tests → cobertura → detector de diseño → build → escaneo de seguridad. Si uno falla, no se fusiona.

## 14. Diseño visual y UX

El look "hecho con IA" sale de usar plantillas por defecto (shadcn sin tocar, gradientes violeta, tarjetas iguales, emojis, fuente Inter en todo). Lo evitamos definiendo una identidad propia antes de escribir la primera pantalla.

### Dirección aprobada: B2 "Caucho y acento" (17-oct-2026)

| Elemento | Definición |
| --- | --- |
| Base | Neutra: caucho #1B1E23 en oscuro, tiza #F3F4F1 en claro; superficies, bordes y textos neutros |
| Acento | Uno solo, en 5 pasos (A1–A5). Seis de fábrica: Caribe, Mar, Palma, Mango, Flamboyán, Uva de playa; más color propio |
| Uso del acento | Solo acción y progreso: botón principal, anillos, selección, tarjeta destacada, línea del coach |
| Datos | Dos tonos del acento + un gris neutro; máximo tres series por gráfico |
| Error | Rojo fijo (#FF6B6B oscuro, #C9333A claro), siempre con ícono y texto |
| Modos | Claro, oscuro y según el sistema, en web y móvil |
| Personalización | Ajustes de apariencia con plantillas sugeridas, selector de color y campo HEX; contraste verificado |
| Tipografía | Archivo (variable), cifras condensadas |
| Marca | Nombre y logo provisionales, configurables desde un archivo de marca |

Referencia visual: Propuesta\_Identidad\_Visual\_B2\_Caucho\_y\_acento.pdf. De fábrica: acento Caribe y modo según el sistema. Nombre provisional: Coach Fitness AI ("Coach" en espacios cortos).

- **Design system propio:** tokens de color, tipografía, espaciado, radios y movimiento en un paquete compartido entre web y móvil.
- **Dirección visual:** flat, minimalista, modo según el sistema, con claro y oscuro igual de cuidados (D-17), un color de acento fuerte para acción y datos, mucho aire.
- **Tipografía con carácter:** Archivo como única fuente (D-17); los números grandes (peso, kg levantados) usan sus pesos y anchos display y cifras tabulares (`tnum`); nada de defaults.
- **Datos como protagonistas:** gráficos limpios y anillos de progreso. El mapa corporal de músculos coloreado por volumen semanal queda fuera de la v1.0 (backlog, sección 19); en la v1.0 el volumen por músculo (GYM-06) se muestra en tablas y gráficos.
- **Movimiento con propósito:** transiciones cortas, contadores animados, feedback háptico al tachar series en el móvil.
- **Proceso:** primero moodboard y 3 direcciones visuales para que elijas; luego la Fase 0.5 de Diseño UX (flujos, mockups, guías paso a paso y prototipo); después código. Ninguna pantalla se programa sin su mockup aprobado.
- **Skill de diseño:** Impeccable y UX Heuristics (detalle abajo). La dirección visual la defines tú como diseñador; las skills la convierten en reglas que los agentes no pueden romper.

### Skills de diseño

| Skill | Rol | Cuándo se usa |
| --- | --- | --- |
| [Impeccable](https://impeccable.style/) | Principal: `PRODUCT.md` y `DESIGN.md`, comandos (typeset, layout, colorize, animate, distill, critique, audit, polish), Live Mode, detector de diseño genérico de IA | En cada pantalla; el detector corre como hook y en el CI |
| [UX Heuristics](https://skills.wondel.ai/skills/ux-heuristics/) | Auditoría de usabilidad (Nielsen + Krug) con severidad 0-4 y corrección propuesta | Al cerrar cada módulo; prioridad en modo gym, registro de comida y confirmación de capturas |
| Taste Skill | Descartada: se solapa con Impeccable y sus reglas chocarían | No se usa (D-08) |

- **Instalación:** `npx impeccable install` + `/impeccable init` + `/impeccable hooks on`; `npx skills add wondelai/skills/ux-heuristics`.
- **Candado de diseño:** el PM no da por terminada una pantalla con hallazgos del detector ni con problemas de severidad 3-4.
- **Límites:** Impeccable rinde más en web que en la app Android; UX Heuristics no sustituye una auditoría de accesibilidad WCAG.

### Fase 0.5: Diseño UX antes de programar

Cada flujo clave se entrega en cuatro piezas: diagrama del flujo, guía paso a paso en imágenes (pantalla 1 → 2 → 3 con anotaciones de qué tocas y qué pasa), mockups de alta fidelidad en web y móvil, y un prototipo navegable donde lo pruebas con clics.

| Flujo | Qué se ve paso a paso |
| --- | --- |
| Entrenar en el gym | Abrir sesión programada → rampa → tachar series → ajustar peso → descanso → cerrar sesión |
| Programar entrenamientos | Calendario en Gym (mes y semana) → ver día pasado con su resumen → elegir hoy o un día futuro → elegir rutina → confirmar o editar series y repeticiones → confirmar o editar pesos → guardar; editar una sesión programada; mover o copiar una sesión, copiar la semana anterior |
| Registrar una comida | Buscar alimento → elegir unidad (g, lb, oz, ml…) → confirmar → ver macros y micros del día |
| Crear receta o plan | Ingredientes → porciones → plan día/semana/mes con suplementos |
| Registrar paseo MTB | Subir las capturas de Strava al chat (actividad y zonas de FC) → tarjeta de confirmación → guardar |
| Registrar medición | Renpho automático o manual → medidas con cinta (lista completa de SAL-02: obligatorias, recomendadas y opcionales) → medidas calculadas (SAL-07) |
| Hablar con el coach | Pregunta → respuesta con tus datos → aprobar plan propuesto |
| Empezar el día | Dashboard: entreno, comidas, suplementos pendientes, alertas, tarjeta de objetivos → página de Objetivos (metas intermedias, metas por medida y por fuerza, hitos) |
| Entrenar desde el reloj | Iniciar sesión del día → serie → check → descanso → vibración → espera → play → siguiente → resumen de tiempos |
| Bienvenida (primer uso) | Tú → tu objetivo → tu actividad → tu salud → conexiones → tu punto de partida → tu plan; salir y retomar |

Orden de trabajo: primero programar entrenamientos (flujo 2), después entrenar en el gym (flujo 1) y luego la bienvenida (flujo 10) (D-25, D-28).

Los mockups y diagramas los produzco aquí como diseños que puedes revisar, comentar y editar; si prefieres, los refinas en Figma. Cuando apruebas un flujo, Impeccable lo usa como referencia al programar.

## 15. Despliegue y operaciones

Tres entornos y despliegues automáticos: lo que pasa el CI llega a staging; a producción solo con tu aprobación.

| Entorno | Dónde | Para qué | Se actualiza |
| --- | --- | --- | --- |
| Desarrollo | Tu PC con Docker | Programar y probar | En cada cambio |
| Staging | Oracle, otro nombre privado de Tailscale, datos de prueba | Demo y validación antes de producción | Automático al fusionar en `main` |
| Producción | Oracle, `coach.tail72ec86.ts.net`, tus datos reales | Uso diario | Al publicar un release, con tu aprobación |

- **Releases:** etiqueta SemVer → GitHub Actions construye imágenes Docker → despliega → corre migraciones → verifica salud.
- **Rollback:** volver a la imagen anterior con un comando; las migraciones se escriben reversibles.
- **Monitoreo:** Uptime Kuma (disponibilidad), logs estructurados, alertas por correo o Telegram si algo cae o falla el backup.
- **Respaldos:** dump diario de Postgres + archivos, cifrado, retención 30 días diarios y 12 mensuales.
- **Runbooks** en `docs/ops/`: restaurar backup, rotar claves, renovar dominio, qué hacer si Renpho deja de sincronizar.
- **App Android:** builds con EAS; instalación directa (APK) y actualizaciones por OTA para cambios que no tocan código nativo.

## 16. Plan de desarrollo por fases

El Gym va primero porque es lo que necesitas ya para volver a entrenar; el coach IA llega cuando ya hay datos que analizar. La web se hace responsive e instalable en el teléfono (PWA) para usar el modo gym desde la Fase 2, antes de la app nativa.

| Fase | Entrega | Criterio de salida |
| --- | --- | --- |
| S. Setup | Cuentas, PC Windows con WSL2, VS Code y Claude Code, servidor Oracle con Docker y Tailscale, teléfono, repositorio, agentes y CI (sección 12) | Página "hola" abierta desde tu teléfono por Tailscale con HTTPS; CI en verde |
| 0. Fundaciones | Documento de producto (PRD), dirección visual definida por ti, PRODUCT.md y DESIGN.md con Impeccable, skills de diseño instaladas, monorepo, `CLAUDE.md`, agentes, CI, entorno Docker local | Repo compila, CI en verde, tú apruebas PRD y diseño |
| 0.5 Diseño UX | Modelo conceptual de la base de datos (diagrama ER), diagramas de flujo de las tareas clave, wireframes, mockups de alta fidelidad (web y móvil), guías paso a paso en imágenes y prototipo navegable | Recorres cada flujo en el prototipo y lo apruebas antes de escribir código |
| 1. Núcleo | Autenticación, modelo lógico y físico de la base de datos con diagrama DBML y diccionario de datos, perfil, API base, despliegue en Oracle con HTTPS y respaldos | API en producción con tests pasando y backup verificado |
| 2. Gym | Biblioteca de ejercicios con músculos, rutinas A/B/C, calendario, modo gym, series rampa, historial, volumen por músculo | Entrenas una semana real registrando todo en el sistema |
| 3. Salud | Sync Renpho, medidas corporales completas y calculadas, análisis de sangre, gráficos de tendencia, objetivos y metas, bienvenida y perfil (fotos de progreso, SAL-03, fuera de la v1.0) | Tus datos de abril y de hoy cargados y graficados; tu objetivo principal cargado con sus metas intermedias |
| 4. Nutrición y suplementos | Base de alimentos dominicanos, registro, recetas, planes día/semana/mes, módulo de suplementación | Una semana de comidas registrada y comparada contra el plan |
| 5. Coach IA | Chat con herramientas, memoria, revisiones semanales, generación de planes y rutinas, re-preguntas periódicas | El coach responde con tus datos reales sin inventar |
| 6. Dashboard y cardio | Panel del día con la tarjeta de objetivos, importación de paseos MTB, carga total | Dashboard útil como pantalla de inicio diaria |
| 7. App Android | Expo offline-first (gym, comidas y suplementos sin internet, sincronización automática), notificaciones, Health Connect | App instalada en tu teléfono, sin pérdida de datos sin señal |
| 7b. Galaxy Watch | App Wear OS: sesión del día, ciclo de serie y descanso con vibración, tiempos de sesión, sincronización con el teléfono | Una sesión completa entrenando solo con el reloj, con los tiempos correctos en el sistema |
| 8. Versión 1.0 | Rendimiento, seguridad, monitoreo, pulido visual | Auditoría del revisor sin hallazgos críticos |

Cada fase cierra con demo, tests verdes, documentación técnica al día y las guías del Centro de ayuda de lo que se construyó. La estimación de tiempos por fase está en el PRD (`docs/prd.md`, sección 7).

## 17. Riesgos

Los dos riesgos mayores no son técnicos: que el proyecto se alargue tanto que no vuelvas al gym, y que el alcance crezca sin control.

| Riesgo | Prob. | Impacto | Mitigación |
| --- | --- | --- | --- |
| El desarrollo se alarga y retrasa tu regreso al gym | Alta | Alto | Vuelves a entrenar ya con la rutina A/B/C en papel; el módulo Gym va primero |
| Crecimiento del alcance con ideas nuevas | Alta | Alto | Toda idea nueva entra al backlog (sección 19) y se prioriza; no entra a la fase en curso salvo que sea crítica |
| Renpho cambia su API interna | Media | Medio | Importación CSV de respaldo; aviso si el sync falla 2 días |
| Oracle reclama o limita la instancia gratuita | Media | Alto | Backups fuera del servidor; despliegue reproducible con Docker en cualquier otro servidor (incluido tu PC i7) |
| Lectura errónea de capturas de Strava | Media | Bajo | Tarjeta de confirmación obligatoria |
| El Galaxy Watch4 es un modelo antiguo (batería, versión de Wear OS) | Media | Bajo | Apuntar a Wear OS 3+, pantalla siempre activa solo durante la sesión, pruebas en el reloj real |
| El coach da una respuesta incorrecta | Media | Medio | Evals en CI, respuestas citan datos, cambios siempre como borrador |
| Costo de la API de IA mayor al esperado | Baja | Medio | Tope mensual, modelos más ligeros para tareas simples |
| Pérdida de datos | Baja | Alto | Backups cifrados diarios con restauración probada |

## 18. Costos de operación

Casi todo es gratuito; el único costo variable relevante es la API de Anthropic. El PM la estima en la Fase 0 con el uso esperado del coach.

| Concepto | Costo | Nota |
| --- | --- | --- |
| Servidor Oracle (ARM) | Gratis | Capa gratuita |
| Dominio | $0 al inicio | No en v1.0: se usa la dirección gratuita de Tailscale (\*.ts.net) con HTTPS; se compra solo si se abre al público |
| API de Anthropic (coach) | $0 extra: plan Max incluye créditos mensuales de API ($100 en Max 5x, $200 en Max 20x). Se vinculan a una organización de Claude Console; no se acumulan y, si se agotan, la API se detiene sin cobros extra | Tope mensual configurable; resúmenes y caché para reducirlo |
| Claude Code (desarrollo) | Según tu plan de Claude | Herramienta de desarrollo, no del sistema |
| GitHub, Expo, Uptime Kuma, DBeaver | Gratis | Planes gratuitos o software libre |
| Object Storage para backups | Gratis | Dentro de la capa gratuita de Oracle |

## 19. Backlog de mejoras

Decidido el 17-oct-2026: entran en la v1.0 el modo gym con temporizador y vibración, 1RM y RM múltiples con récords, carga combinada gym + MTB, informe mensual en PDF y calendario de análisis de sangre. El resto espera (prioridad W en la sección 5). El backlog de la v1.0 está cerrado (D-16): cada idea nueva va a esta lista para después de la v1.0, salvo que sea crítica, y eso lo decides tú. Excepciones que decidiste: unidades preferidas (D-24) y objetivos, bienvenida y medidas corporales completas (D-28).

| Mejora | Qué aporta | Prioridad |
| --- | --- | --- |
| Check-in diario de 20 segundos | Sueño, energía, dolor muscular, estrés, ánimo; el coach ajusta carga con eso | Alta |
| Autorregulación (RPE/RIR por serie) | Progresión según cómo se sintió la serie, no solo el número | Alta |
| Registro de comida por foto o texto libre | "Arroz, habichuelas y pollo" → el coach estima gramos y macros, tú confirmas | Alta |
| Lista de compras automática | Desde el plan semanal de comidas + suplementos por agotarse | Alta |
| Modo gym con temporizador y vibración | Descanso exacto entre series, aviso cuando toca la siguiente | Alta |
| Estimación de 1RM y récords personales | Ver progreso de fuerza aunque cambies reps | Media |
| Mapa corporal de músculos | Visual de volumen semanal por músculo, detecta desbalances | Media |
| Sustitución de ejercicios | Si la máquina está ocupada, el sistema propone el equivalente que trabaja los mismos músculos | Media |
| Carga combinada gym + MTB | Evita llegar al día de piernas fundido por un paseo largo | Media |
| Comparador de fotos lado a lado | Progreso visual con la misma pose y fecha | Media |
| Hábitos y rachas | Sueño antes de 11 PM, sin pantallas en cama, pasos, agua | Media |
| Informe mensual en PDF | Resumen de progreso para ti o para un médico | Baja |
| Calendario de análisis de sangre | Recordatorios y preparación (ayuno, qué suspender antes), automáticos | Baja |
| Ciclos de entrenamiento (D-29) | Bloques de fuerza o hipertrofia que ajustan series, reps y descansos de toda la rutina; mientras tanto el coach los propone | Media |

## 20. Registro de decisiones

Decisiones ya tomadas; al arrancar el repo cada una se convierte en un ADR en `docs/adr/`.

| # | Fecha | Decisión | Motivo |
| --- | --- | --- | --- |
| D-01 | 17-oct-2026 | Plataforma propia (backend + web + Android) en Oracle; se abandona GymTracker en Sheets y el enfoque Cursor + archivos | Control total y un solo sistema |
| D-02 | 17-oct-2026 | Python/FastAPI + PostgreSQL; React + Vite; Expo para Android | Datos y Renpho en Python; TypeScript compartido entre web y móvil |
| D-03 | 17-oct-2026 | Registro nutricional propio; Cronometer opcional | Cronometer no tiene API pública |
| D-04 | 17-oct-2026 | Base de alimentos sobre USDA + INCAP + Open Food Facts + manual; nutrientes por 100 g con unidades g, kg, lb, oz, ml, L | Micros completos y flexibilidad de registro |
| D-05 | 17-oct-2026 | MTB por captura de pantalla al chat del coach, con confirmación | Términos de la API de Strava |
| D-06 | 17-oct-2026 | Coach con herramientas sobre la BD + memoria pgvector; Obsidian solo para documentación | Datos numéricos requieren BD |
| D-07 | 17-oct-2026 | VS Code + Claude Code con equipo de agentes dirigido por un Project Manager | Foco por especialidad con control central |
| D-08 | 17-oct-2026 | Impeccable + UX Heuristics; Taste Skill descartada | Evitar reglas de estilo en conflicto |
| D-09 | 17-oct-2026 | Fase 0.5 de Diseño UX: ninguna pantalla se programa sin mockup aprobado | Diseño primero |
| D-10 | 17-oct-2026 | Diseño de BD en 3 niveles con DBML, DBeaver y Mermaid sincronizados por CI | Esquema visible y confiable |
| D-11 | 17-oct-2026 | Reinicio con Full Body A/B/C; protocolo capilar fuera del proyecto | Decisión del dueño del producto |
| D-12 | 17-oct-2026 | Acceso privado por Tailscale + login con 2FA; arquitectura multiusuario lista para abrir al público en el futuro. Oracle dedicado al sistema | Máxima privacidad ahora sin cerrar la puerta a crecer |
| D-13 | 17-oct-2026 | Samsung Health vía Health Connect en la app Android; Strava se mantiene por captura | Pasos, FC y sueño automáticos sin depender de APIs restringidas |
| D-14 | 17-oct-2026 | Sin dominio en v1.0: dirección gratuita de Tailscale con HTTPS | Costo cero; dominio solo al abrir al público |
| D-15 | 17-oct-2026 | Desarrollo con Claude Code y tu suscripción; coach de la app con API de Anthropic (créditos de API del plan Max; si se agotan, el coach se detiene hasta el mes siguiente; pago por uso solo como opción futura) | Los créditos de API del plan Max ya cubren el coach sin costo extra y sin gastar los límites de Claude Code del desarrollo; la API es la vía estable para un backend y la única válida si la app se abre al público |
| D-16 | 17-oct-2026 | Desarrollo en Windows con WSL2; Fase S de setup antes de la Fase 0; backlog v1.0 cerrado | Entorno idéntico al servidor y alcance controlado |
| D-17 | 17-oct-2026 | Dirección visual B2 "Caucho y acento": base neutra caucho/tiza, un acento elegible (6 de fábrica + propio), 8 plantillas, modo claro y oscuro. Nombre y logo provisionales y configurables | Preferencia del dueño del producto; personalización como función |
| D-18 | 17-oct-2026 | App para Galaxy Watch nativa (Kotlin + Compose for Wear OS), Wear OS 3+, conectada a la app Android por Data Layer; fase 7b. Cronometría de sesión (tiempo extra de descanso) en todo el sistema | Entrenar sin sacar el teléfono; Wear OS no admite React Native |
| D-19 | 17-oct-2026 | Gestión automática del contexto: hook SessionStart que inyecta docs/estado.md (inicio, /clear, compactación, reanudar), estado.md actualizado en cada tarea y delegación a agentes (ADR 0019) | Que ninguna conversación ni compactación pierda el estado del proyecto |
| D-20 | 18-oct-2026 | Servidor Oracle `coach`: Minecraft retirado, SSH solo con llave y solo por Tailscale, usuarios `ubuntu` (admin) y `deploy` (Docker), ningún puerto público (firewall del sistema + lista de seguridad de la VCN), Caddy en Docker escuchando solo en la IP de Tailscale con certificado de Tailscale (ADR 0020) | Servidor dedicado y sin exposición a internet, como pide D-12 |
| D-21 | 18-oct-2026 | Embeddings de la memoria del coach con un modelo local en el servidor Oracle; el modelo concreto se elige en la Fase 1 con benchmark (ADR 0021) | Anthropic no ofrece embeddings; un servicio externo vería datos de salud y costaría dinero |
| D-22 | 18-oct-2026 | Íconos de trazo Tabler Icons en web, Android y reloj; trazo 1.75, tamaños 16/20/24/32 (ADR 0022) | Única candidata con paquetes oficiales para React y React Native y con báscula de baño; MIT |
| D-23 | 18-oct-2026 | Navegación inferior: Hoy, Gym, Comida, Salud, Coach; Ajustes en el botón de cuenta de Hoy; logo provisional = mancuerna de Tabler en casilla, desde `packages/brand` | Preferencia del dueño del producto; las cinco secciones de uso diario a un toque |
| D-24 | 18-oct-2026 | Unidades preferidas por usuario (SIS-07, M, entra en la v1.0 por decisión del dueño): peso corporal y cargas del gym por separado en kg o lb (lb de fábrica), estatura en m, cm o pies y pulgadas, perímetros en cm o pulgadas, distancia en km o millas (métrico de fábrica). Todo se guarda en kg, cm y m con la unidad escrita (ADR 0023) | El dueño entrena con discos en libras; diseñarlo desde la Fase 1 es barato y añadirlo después obliga a migrar datos y pantallas |
| D-25 | 18-oct-2026 | Calendario de entrenamientos (GYM-03): muestra días pasados (hecha o no hecha, con resumen), hoy y futuros (programar, mover, copiar); incluye paseos MTB y citas de análisis de sangre (de solo lectura, llevan a Salud); vive en Gym, no en Hoy. Marcas: punto lleno de acento = hecha, contorno = programada, gris con ✕ = no hecha, `bike` = MTB, ícono propio = análisis. Una sesión no hecha ofrece "Mover a otro día"; existe "Copiar la semana anterior". En la Fase 0.5 se diseña primero el flujo 2 y después el flujo 1 | Decisión del dueño del producto; el calendario es parte de entrenar, y ver lo hecho junto a lo programado da contexto para planear |
| D-26 | 18-oct-2026 | Revisión del flujo 2: programar va en tres pasos (elegir rutina → confirmar o editar series y repeticiones, que vienen de la rutina → confirmar o editar pesos); una sesión programada sin hacer se edita igual; un día pasado hecho es de solo lectura. La semana 1 de cada usuario es la de su primera actividad registrada en la app; el historial previo del Anexo A no se carga. Gym tiene pestañas internas en móvil (sesión, calendario, rutinas, historial, cardio y MTB). Salud suma la subsección Análisis (SAL-04) | Decisión del dueño del producto; arranca desde cero con la app y su gym |
| D-27 | 18-oct-2026 | Cada paseo MTB guarda distancia, desnivel positivo, tiempo en movimiento, velocidad media, calorías, FC promedio y, por zona de FC (Z1 a Z5), el % de tiempo y el rango en ppm, leídos de dos capturas de Strava. El día del paseo, el objetivo calórico sube con el 50 % de sus kcal (de fábrica; Strava suele sobrestimar); el coach usa FC y zonas para medir el esfuerzo y su variación | El coach necesita el esfuerzo real de cada paseo, y las calorías del MTB deben llegar a Comida |
| D-28 | 18-oct-2026 | Objetivos, bienvenida y medidas corporales completas entran en la v1.0 (M), como excepción al backlog cerrado (D-16): módulo Objetivos (OBJ-01 a OBJ-04: objetivo principal con meta y fecha, metas intermedias cada 4 semanas, metas por medida y por fuerza con línea punteada en los gráficos, hitos; tarjeta en Hoy y página propia, sin sexta pestaña), bienvenida de primer uso en 7 pasos con ilustraciones (SIS-08, ADR 0024), perfil editable con historial (SIS-09), SAL-02 con la lista completa de medidas, medidas calculadas con el método de la Marina (SAL-07) y re-preguntas del coach (COA-05). Las rachas siguen en el backlog. Suma ~1 semana a la estimación; el modo gym no se mueve | Decisión del dueño del producto; sin objetivo con fecha ni perfil completo, el coach no puede juzgar el progreso ni cuidar la seguridad, y añadirlo después obliga a rehacer el modelo de datos |
| D-29 | 18-oct-2026 | Revisión del flujo 1: la rampa (GYM-05) depende de las reps objetivo y el peso de trabajo de cada ejercicio (1-5 reps: 4 series y potenciación opcional; 6-12: 1 a 3 series según el peso; 13 o más: 1 o ninguna), con una sola serie de tanteo si el músculo ya está caliente y sin rampa en aislamiento. Descanso con +15 s, −15 s y saltar, vibración y tiempo extra; ajustar peso o reps al vuelo solo cambia esa sesión; resumen al cerrar con tiempos, volumen, récords e hitos. Los ciclos de entrenamiento (bloques de fuerza o hipertrofia) quedan fuera de la v1.0 | Criterio de coach: para recomposición la rampa solo prepara, y una rampa fija suma fatiga y tiempo; las reps reflejan la intensidad real en cualquier ciclo. La nutrición depende del objetivo de composición (OBJ-01), no del ciclo. La rutina A/B/C ya trae su progresión y el coach puede proponer un bloque de fuerza (COA-04) |
| D-30 | 18-oct-2026 | Guía del flujo 1 aprobada: el modo gym existe en la app Android y en la web como PWA en el teléfono (escritorio: solo lectura); pantalla completa con flecha para minimizar; tachar con casilla o botón "Serie hecha"; Finalizar sin confirmación; ajuste al vuelo de fábrica en "Las que faltan"; sesión sin programar desde una rutina (la siguiente de la rotación) o vacía; redondeo de la rampa hacia abajo; mancuerna mínima 5 lb y volumen con las dos mancuernas; series por tiempo (plancha); cifra del descanso con token propio del modo gym | La Fase 2 entrega el modo gym como PWA antes que la app Android; calentar de menos es más seguro que pasarse; contar las dos mancuernas da la carga real y se compara con la barra; la plancha está en la rutina A/B/C; en el gym el teléfono se mira desde el banco |
| D-31 | 18-oct-2026 | Flujo 1 aprobado con sus 4 piezas: "Empezar otra sesión" con la sesión del día hecha; volumen ×4 en ejercicios por pierna con mancuernas; serie por tiempo que se tacha sola con "Terminé antes"; franja de sesión minimizada; los avisos nunca tapan acciones del modo gym; la hoja de ajuste dice a qué series se aplica; esqueleto solo tras 300 ms; el subitem activo de la barra lateral web usa A5 en claro (antes 4.49:1, ahora cumple AA) | Revisión de Francis con el prototipo; criterio de coach: la carga real cuenta todo lo que mueves; el contraste por debajo de 4.5:1 se repetiría en cada pantalla web |
| D-32 | 18-oct-2026 | Revisión del flujo 10 (bienvenida): conexiones pasan al paso 5 y el punto de partida al 6, con lo de Renpho ya lleno; kcal con Katch-McArdle si hay % de grasa y si no Mifflin-St Jeor, por nivel de actividad, ajustadas al objetivo (−15 a −20 % perder grasa, −10 % recomposición, +5 a +10 % ganar músculo, mantenimiento en el resto); proteína 1.8 a 2.2 g/kg; los objetivos de Francis no cambian (2,350 kcal, 187 g); bienvenida en móvil y web, y se retoma en cualquiera de los dos; en el flujo 2, "Sentadilla búlgara mancuernas" y "por mancuerna" en el paso de pesos | Revisión de Francis; criterio de coach: Katch-McArdle es más precisa cuando se conoce la masa magra, y no escribir dos veces lo que mide la báscula |

## 21. Pendientes: lo que necesito de ti

Con esto cierro la Fase 0 y arrancamos a programar.

- [x] Báscula de hoy → cargada en el Anexo A.2b.
- [x] Rutina A/B/C → confirmada (Anexo A.6); series y reps más adelante.
- [x] MTB → Strava por captura; Samsung Health vía Health Connect (SAL-06).
- [x] Nutrición → registro y contador nativo, desde cero.
- [x] Dominio → no por ahora; dirección gratuita de Tailscale.
- [x] GitHub → tienes cuenta; desarrollo con tu suscripción de Claude.
- [x] PC → Windows (con WSL2).
- [x] Estilo visual → propuesta en PDF preparada por Claude.
- [x] Backlog → decidido (sección 19).
- [x] Plan de Claude → Max: el coach usa los créditos mensuales de API incluidos (activar en la Fase 5).
- [x] Dirección B2 → acento de fábrica Caribe, modo según el sistema, nombre provisional "Coach Fitness AI".
- [x] Fase S (Setup) → cerrada el 18-oct-2026.
- [x] PRD → aprobado el 18-oct-2026 (`docs/prd.md`).
- [ ] Medidas con cinta de octubre: cintura (obligatoria) y las recomendadas de SAL-02 (cuello, hombros, pecho, cadera, brazo relajado y contraído, muslo, pantorrilla).

## Anexo A — Ficha del atleta

Datos iniciales que el sistema carga en la Fase 0 y que el coach usa como contexto. Baseline del 17-abr-2026; la medición del 17-oct-2026 ya está cargada (A.2b) y es el nuevo punto de partida; las metas de 3 meses ahora apuntan a mediados de enero 2027.

### A.1 Datos fijos

| Dato | Valor |
| --- | --- |
| Nombre | Francis Guzman |
| Edad / sexo / altura | 29 · masculino · 172 cm |
| Morfotipo | Ecto-mesomorfo con grasa subcutánea por sedentarismo |
| Estructura ósea | Mediana (3.2 kg) |
| Ubicación | República Dominicana (UTC-4) |
| Ocupación | Trader algorítmico (trading 8-9 PM) |
| Gym | Completo; hora de entrenamiento 8:00 AM |
| Lesiones / restricciones alimentarias | Ninguna / ninguna |
| Experiencia | Conoce series rampa, periodización y progresión de carga |
| Estado actual | Gym pausado desde 2-jun-2026; MTB desde hace 12 semanas |

### A.2 Composición corporal (Renpho): baseline y metas

| Métrica | Base 17-abr | Meta 3 m | Meta 12 m | Meta 24 m |
| --- | --- | --- | --- | --- |
| Peso | 78.4 kg | 75-76 kg | 76-79 kg | 80-84 kg |
| IMC | 26.5 | < 25 | < 25 | — |
| Grasa corporal | 20.3% (15.9 kg) | 17-18% | 14-16% | 12-14% |
| Grasa subcutánea | 17.6% | < 14% | — | — |
| Grasa visceral | 9 | 7-8 | 5-6 | < 5 |
| Músculo esquelético | 51.4% (40.3 kg) | 53-54% | 56-58% | 60-62% |
| Masa muscular total | 75.7% (59.4 kg) | 77-78% | 80-82% | 84-86% |
| Agua corporal | 57.5% (45.1 kg) | 58-60% | — | — |
| Proteína corporal | 18.2% (14.3 kg) | mantener+ | — | — |
| Masa ósea | 3.2 kg | mantener | mantener | mantener |
| TMB | 1,721 kcal | 1,780+ | 1,900+ | 2,000+ |
| Edad metabólica | 30 | 28-29 | 26-27 | < 26 |

### A.2b Medición del 17-oct-2026 (nuevo punto de partida)

En 6 meses la composición no se movió: mismo peso, misma grasa y un poco menos de músculo. Las 12 semanas de MTB no bastaron sin gym ni control de comida; la palanca ahora es entrenamiento de fuerza más nutrición.

| Métrica | 17-abr | 17-oct | Cambio |
| --- | --- | --- | --- |
| Peso | 78.4 kg | 78.4 kg (172.8 lb) | = |
| IMC | 26.5 | 26.5 | = |
| Grasa corporal | 20.3% (15.9 kg) | 20.4% (16.0 kg) | +0.1 pp |
| Grasa subcutánea | 17.6% | 17.7% | +0.1 pp |
| Grasa visceral | 9 | 9 | = |
| Masa muscular total | 75.7% (59.4 kg) | 75.6% (59.2 kg) | −0.2 kg |
| Músculo esquelético | 51.4% (40.3 kg) | 51.3% (40.2 kg) | −0.1 kg |
| Masa ósea | 3.2 kg | 3.2 kg (4.0%) | = |
| Peso sin grasa | — | 62.4 kg | nuevo dato |
| Agua corporal | 57.5% (45.1 kg) | 57.5% (45.1 kg) | = |
| Proteína corporal | 18.2% (14.3 kg) | 18.1% (14.2 kg) | −0.1 pp |
| TMB | 1,721 kcal | 1,726 kcal | +5 |
| Edad metabólica | 30 | 31 | +1 |

Renpho clasifica el tipo de cuerpo como "sobrepeso" y sugiere un peso óptimo de 71.1 kg (156.8 lb) bajando solo grasa. Las metas del plan (recomposición: bajar grasa y subir músculo) siguen siendo las correctas.

### A.3 Medidas con cinta: baseline y metas

| Zona | Base 17-abr | Meta 3 m | Meta 12 m |
| --- | --- | --- | --- |
| Pecho | 98 cm | 101-102 | 104-107 |
| Hombros | 119 cm | 120-121 | 123-125 |
| Brazo D reposo | 30.5 cm | 32 | 35-36 |
| Brazo D contraído | 33 cm | 34.5 | 37-39 |
| Antebrazo | 29 cm | 30 | 31-32 |
| Muñeca | 16.5 cm | fija | fija |
| Cintura (ombligo) | 91 cm | 87-88 | 83-85 |
| Cadera | 100 cm | 98-99 | 96-98 |
| Muslo D | 56 cm | 58-59 | 61-63 |

### A.4 Índices

| Índice | Base | Referencia | Estado |
| --- | --- | --- | --- |
| Cintura/cadera | 0.91 | < 0.90 | Límite |
| Cintura/altura | 0.529 | < 0.50 | Elevado |
| Hombros/cintura | 1.31 | > 1.618 estético | Mucho margen |

### A.5 Calorías de referencia

| Escenario | kcal |
| --- | --- |
| TMB | 1,721 |
| Sedentario (×1.2) | 2,065 |
| Con entreno 3-5×/sem (×1.55) | 2,667 |
| Recomposición (Novato) | 2,300-2,400 |
| Volumen limpio (Principiante) | 2,800-3,000 |

El MTB añade gasto que estas cifras no incluyen: el día de un paseo, el objetivo sube con el 50 % de las kcal que reporta Strava (D-27), y el coach revisa ese porcentaje en la revisión de las 6 semanas.

### A.6 Plan de entrenamiento: Full Body A/B/C

Selección de ejercicios por día confirmada el 17-oct-2026 con tu hoja GymTracker (idéntica a la v2). Series, reps y descansos se revisan más adelante. Reinicio desde la semana 1 (exploración).

**Hoja de ruta de etapas** (se reinicia el conteo desde tu regreso):

| Etapa | Duración | Objetivo |
| --- | --- | --- |
| Novato | 0-3 meses | Adaptación, hábitos, recomposición |
| Principiante | 3-12 meses | Base de fuerza y ganancia muscular; Upper/Lower 4×/semana |
| Intermedio | 12-24 meses | Especialización, volumen, definición |
| Avanzado | 24+ meses | Optimización |

**Series rampa** (sentadilla, banca, peso muerto, militar, remo, búlgara, hip thrust):

| Serie | % peso de trabajo | Reps | Descanso |
| --- | --- | --- | --- |
| Rampa 1 | 40-50% | 5 | 60 s |
| Rampa 2 | 65-70% | 3 | 60 s |
| Rampa 3 | 85% | 2 | 90 s |
| Potenciación (desde semana 3) | 105-110% | 1 | 1-3 min |
| Trabajo | 100% | según ejercicio | según ejercicio |

**Semana tipo:** lunes Día A, miércoles Día B, viernes Día C; martes y jueves caminata 30-45 min (o MTB); fin de semana descanso activo o total. Semana 4 de cada mes: descarga (−10-15% peso, −1 serie).

| Día A — Push + Legs | Rampa | Series × reps | Descanso |
| --- | --- | --- | --- |
| Sentadilla con barra / goblet | Sí | 3 × 10-12 | 90 s |
| Press banca plano barra | Sí | 3 × 8-10 | 90 s |
| Press militar mancuernas sentado | Sí | 3 × 10-12 | 90 s |
| Extensión tríceps polea alta | No | 3 × 12-15 | 60 s |
| Elevación lateral | No | 3 × 12-15 | 60 s |
| Core: plancha 3×30-45 s + crunch 3×15 | — | — | 45 s |

| Día B — Pull + Legs | Rampa | Series × reps | Descanso |
| --- | --- | --- | --- |
| Peso muerto convencional | Sí | 3 × 8 | 2 min |
| Remo con barra / máquina | Sí | 3 × 10 | 90 s |
| Dominadas asistidas / jalón | Sí | 3 × 8-12 | 90 s |
| Curl bíceps | No | 3 × 12 | 60 s |
| Curl femoral tumbado | No | 3 × 12 | 60 s |
| Hiperextensiones (sin peso sem 1-3) | No | 3 × 12-15 | 60 s |
| Core: plancha lateral 3×20 s + elevación piernas 3×12 | — | — | 45 s |

| Día C — Full Body + Cardio | Rampa | Series × reps | Descanso |
| --- | --- | --- | --- |
| Sentadilla búlgara | Sí | 3 × 10 c/pierna | 90 s |
| Press inclinado mancuernas | Sí | 3 × 10-12 | 90 s |
| Face pull | No | 3 × 15 | 60 s |
| Hip thrust | Sí | 3 × 12-15 | 90 s |
| Pantorrillas | No | 3 × 15-20 | 60 s |
| Caminata inclinada 8-10, 5.5-6 km/h, 15-20 min | — | — | — |

**Progresión:** semanas 1-2 exploración; 3-4 potenciación y +2.5 kg si completas todo; 5-11 progresión lineal +2.5 kg/semana (o 1.25 kg); semana 12 descarga final −15%.

### A.7 Nutrición

| Macro | Objetivo Novato | Nota |
| --- | --- | --- |
| Proteína | 187 g | \~2.4 g/kg |
| Carbohidratos | 250 g | Ajustar con el gasto del MTB |
| Grasas | 54 g | Bajo (\~0.69 g/kg); propuesta: \~65 g |
| Total | \~2,255 kcal | Objetivo declarado 2,300-2,400; se unifica en la Fase 0 |

| Hora | Comida | P / C / G (g) | kcal |
| --- | --- | --- | --- |
| 7:00 AM | Avena 80 g + 3 huevos + 1 banana + café | 45 / 75 / 18 | 650 |
| \~10:00 AM | Whey 30-35 g + manzana o 200 ml jugo de naranja | 32 / 30 / 3 | 280 |
| 1:00 PM | Pollo 180-200 g + arroz 150 g + habichuelas 100 g + ensalada con aceite de oliva | 45 / 80 / 10 | 600 |
| 4:30 PM | Yogur griego/requesón 200 g + nueces 30 g + fruta | 25 / 30 / 15 | 350 |
| 7:30 PM | Pescado/carne magra 150-180 g + vegetales 200-250 g + batata/yuca 100 g | 40 / 35 / 8 | 375 |

**Despensa base:** pollo, pavo, atún, tilapia, salmón, huevos, carne magra, yogur griego, requesón, whey · avena, arroz, batata, yuca, habichuelas, frutas, pan integral, banana, mango · aguacate, nueces, almendras, aceite de oliva, mantequilla de maní.

### A.8 Suplementos (catálogo inicial)

| Suplemento | Dosis | Cuándo | Prioridad |
| --- | --- | --- | --- |
| Whey | 25-35 g | Post-entreno | Alta |
| Creatina monohidrato | 5 g | Cualquier hora | Alta |
| Vitamina D3 | 2,000-4,000 UI | Desayuno | Alta |
| Omega-3 | 2-3 g EPA/DHA | Con comidas | Media |
| Magnesio glicinato | 300-400 mg | Antes de dormir | Media |
| Zinc | 15-25 mg | Cena | Media |
| Cafeína (café) | 100-200 mg | Pre-entreno | Media |

### A.9 Sueño y hábitos

- 7.5-8.5 h; dormir 11 PM-12 AM, despertar 7 AM todos los días; sin pantallas 45-60 min antes; cuarto 18-20 °C y oscuro; sin cafeína después de 2 PM.
- Problema identificado: reels acostado en la cama.
- Alcohol: cero entre semana; fin de semana máximo 1-2, nunca la noche antes de entrenar.

### A.10 Alertas para el coach

- Menos de 1,800 kcal en un día → corregir.
- Más de 5 días/semana de gym en etapa Novato → frenar.
- Sesiones saltadas seguidas → abordar la causa.
- Grasa visceral ≥ 10 → alerta metabólica.
- NEAT casi cero (días sentado/acostado) → señalarlo.

## Anexo B — Glosario

| Término | Significado |
| --- | --- |
| ADR | Registro de una decisión técnica: qué se decidió, por qué y qué alternativas se descartaron |
| API | Puerta por la que la web, la app y el coach piden y guardan datos en el backend |
| CI/CD | Automatización que prueba cada cambio (CI) y lo despliega al servidor (CD) |
| DBML | Lenguaje de texto para describir tablas y relaciones; dbdiagram.io lo dibuja |
| Definition of Done | Lista de condiciones para dar una tarea por terminada |
| E2E | Prueba de punta a punta que simula a una persona usando la app |
| Evals | Batería de preguntas para comprobar que el coach responde bien |
| Migración | Cambio versionado del esquema de la base de datos |
| MoSCoW (M/S/C) | Prioridad: imprescindible, debería, si da tiempo |
| PWA | Web instalable en el teléfono como si fuera una app |
| RPE / RIR | Esfuerzo percibido / repeticiones que quedaban en reserva |
| RPO / RTO | Máximo de datos que se pueden perder / tiempo máximo para restaurar |
| SemVer | Versionado mayor.menor.parche (ej. 1.2.0) |
| Staging | Copia del sistema para probar antes de producción |
| Tool use | Capacidad del coach de consultar y escribir en tu base de datos mediante herramientas |
