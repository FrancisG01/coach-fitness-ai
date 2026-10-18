# Coach Fitness AI — Documento de producto (PRD) v1.0

| Campo | Valor |
| --- | --- |
| Versión | 1.0 (borrador) |
| Fecha | 18-oct-2026 |
| Estado | Pendiente de aprobación |
| Dueño del producto | Francis Guzman |
| Redacta | Agente `pm` |
| Fuentes | [`plan-maestro.md`](plan-maestro.md) v1.1, [`adr/`](adr/), [`diseno/`](diseno/) |

Este documento resume qué se construye en la v1.0, para quién y cómo sabremos que funcionó. No añade alcance: el backlog de la v1.0 está cerrado (D-16, [ADR 0016](adr/0016-wsl2-fase-s-y-backlog-cerrado.md)). El detalle de cada requisito vive en el plan maestro; aquí solo se resume y se enlaza. Tu aprobación cierra, junto con el diseño, la Fase 0.

Las secciones 5, 6 y 7 (metas físicas, costo del coach y tiempos) son **propuestas** que tienes que validar.

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
| Quién | Francis Guzman: 29 años, 172 cm, diseñador gráfico y trader algorítmico (trading 8-9 PM), República Dominicana |
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
| O6 | Progreso físico | Cumplir las metas a 3 meses de la sección 5 (propuestas) |

---

## 2. Alcance de la v1.0

Prioridad MoSCoW del plan: **M** imprescindible, **S** debería entrar, **W** después de la v1.0. Total: 48 requisitos, 38 M, 4 S, 6 W. Lista completa en el [plan, sección 5](plan-maestro.md#requisitos-funcionales); requisitos no funcionales (RNF-01 a RNF-11) en la [sección 6](plan-maestro.md#6-requisitos-no-funcionales).

| Módulo | Qué incluye en la v1.0 | IDs (prioridad) | Fase |
| --- | --- | --- | --- |
| Gym | Biblioteca con implicación por músculo, rutinas, calendario con pesos, modo gym con temporizador y vibración, rampa automática, volumen semanal por músculo, historial con 1RM y RM múltiples, cronometría de sesión, autoguardado y recuperación | GYM-01 a 07, 09, 10 (M) | 2 |
| Gym en el reloj | Sesión del día desde el reloj, ciclo serie/check/descanso/vibración, funciona sin el teléfono cerca, sync en tiempo real por Bluetooth | WAT-01, 02, 05, 06 (M); WAT-03 ajuste rápido de peso, WAT-04 FC en la sesión (S) | 7b |
| Salud | Sync diario de Renpho, medidas con cinta y cualquier métrica, análisis de sangre con rangos y calendario de análisis, Samsung Health vía Health Connect | SAL-01, 02, 04 (M, fase 3); SAL-06 (M, fase 7) | 3 y 7 |
| Nutrición | Base de alimentos (USDA + INCAP + Open Food Facts + manual) por 100 g, registro en g/kg/lb/oz/ml/L o porción casera, totales por tipo de día, recetas con crudo/cocido, planes día/semana/mes del coach, frecuentes y recientes | NUT-01 a 05, 09 (M) | 4 |
| Suplementos | Catálogo con dosis y horario, registro de toma sumado al día, inventario con alerta de stock bajo | SUP-01, 02 (M); SUP-03 (S) | 4 |
| Cardio | Paseo MTB desde captura de Strava con tarjeta de confirmación; carga combinada gym + MTB | CAR-01, 02 (M) | 6 |
| Coach | Chat con herramientas sobre todos los módulos, memoria de decisiones, consejos diarios y revisión semanal, propuestas que apruebas antes de guardar | COA-01 a 04 (M) | 5 |
| Dashboard | Panel del día; informe mensual en PDF | DSH-01, 02 (M) | 6 |
| Sistema | Login seguro con 2FA y sesión persistente, modo claro/oscuro/sistema, ajustes de apariencia con acentos y color propio, marca configurable, Centro de ayuda; exportar datos | SIS-01, 03 a 06 (M); SIS-02 (S) | 1 en adelante |

Reglas de producto que aplican a todo:

- El coach no diagnostica, no interpreta síntomas graves (te refiere a un médico) y no prescribe fármacos ([plan, sección 8](plan-maestro.md#reglas-y-límites-del-coach)).
- Ningún cambio del coach se guarda sin tu aprobación (COA-04).
- Acceso solo por Tailscale (D-12, D-14); interfaz en español con unidades métricas por defecto.
- Diseño B2 "Caucho y acento", acento de fábrica Caribe, Archivo como única fuente (D-17, [ADR 0017](adr/0017-direccion-visual-b2.md)).

### Fuera de alcance

| Fuera de la v1.0 | Motivo |
| --- | --- |
| App iOS, publicación en Google Play | Usuario único con Android; APK directo y OTA |
| Apertura al público y registro de otros usuarios | Arquitectura lista, decisión futura (D-12) |
| API de Strava y de Cronometer | Términos de Strava; Cronometer sin API (D-03, D-05) |
| Escáner de código de barras | Backlog |
| Farmacología y protocolo capilar | Decisión del dueño del producto (D-11) |
| Dominio propio | Dirección gratuita de Tailscale (D-14) |
| RPE/RIR y sugerencia de progresión | GYM-08 (W) |
| Fotos de progreso con comparador | SAL-03 (W) |
| Check-in diario | SAL-05 (W) |
| Lista de compras, comida por foto o texto libre, importación de Cronometer | NUT-06, 07, 08 (W) |
| Mapa corporal, sustitución automática de ejercicios, hábitos y rachas | Backlog de la [sección 19](plan-maestro.md#19-backlog-de-mejoras) |

---

## 3. Flujos clave

La [sección 13](plan-maestro.md#13-calidad-y-pruebas) pide pruebas E2E en Playwright de "los 8 flujos clave"; son los flujos de la tabla de la Fase 0.5 ([sección 14](plan-maestro.md#fase-05-diseño-ux-antes-de-programar)) que se usan en la web. El noveno flujo de esa tabla (entrenar desde el reloj) también se diseña en la Fase 0.5, pero se prueba en el reloj real, no en Playwright.

| # | Flujo | Pasos | Requisitos | Prueba |
| --- | --- | --- | --- | --- |
| 1 | Entrenar en el gym | Abrir sesión programada → rampa → tachar series → ajustar peso → descanso → cerrar sesión | GYM-04, 05, 09, 10 | Playwright + Maestro |
| 2 | Programar entrenamientos | Calendario → elegir rutina → asignar pesos por ejercicio → guardar | GYM-02, 03 | Playwright |
| 3 | Registrar una comida | Buscar alimento → elegir unidad → confirmar → ver macros y micros del día | NUT-02, 03, 09 | Playwright |
| 4 | Crear receta o plan | Ingredientes → porciones → plan día/semana/mes con suplementos | NUT-04, 05, SUP-01 | Playwright |
| 5 | Registrar paseo MTB | Subir captura al chat → tarjeta de confirmación → guardar | CAR-01 | Playwright |
| 6 | Registrar medición | Renpho automático o manual → medidas con cinta → fotos | SAL-01, 02 | Playwright |
| 7 | Hablar con el coach | Pregunta → respuesta con tus datos → aprobar plan propuesto | COA-01, 04 | Playwright + evals |
| 8 | Empezar el día | Dashboard: entreno, comidas, suplementos pendientes, alertas | DSH-01, COA-03 | Playwright |
| 9 | Entrenar desde el reloj | Iniciar sesión del día → serie → check → descanso → vibración → espera → play → siguiente → resumen de tiempos | WAT-01, 02, 05, 06 | Compose for Wear OS + reloj real |

Cada flujo se entrega en la Fase 0.5 en cuatro piezas: diagrama, guía paso a paso en imágenes, mockups de alta fidelidad (web y móvil) y prototipo navegable.

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

## 5. Metas físicas recalculadas (propuesta)

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
| Cintura (ombligo) | 91 cm | sin medir | 87-89 cm | −2 a −4 cm vs abril | ~1 cm por kg de grasa perdida; hace falta medir en octubre |
| Cintura/altura | 0.529 | sin medir | ≤ 0.51 | — | Referencia < 0.50, se alcanza en la etapa Principiante |

Las metas a 12 y 24 meses del Anexo A.2 se mantienen como referencia y se revisan con la medición de enero.

### Objetivo calórico unificado (propuesta)

El Anexo A tiene dos cifras que no cuadran: el plan de comidas suma ~2,255 kcal (P 187 / C 250 / G 54) y el objetivo declarado es 2,300-2,400 kcal.

| Concepto | Valor |
| --- | --- |
| TMB (17-oct) | 1,726 kcal |
| Gasto estimado con 3 días de gym + 2 de caminata, trabajo sentado (×1.45-1.55) | 2,500-2,675 kcal |
| Déficit para ~0.25 kg de grasa por semana | ~275 kcal/día |
| **Objetivo propuesto** | **2,350 kcal/día** (punto medio del rango declarado) |
| Macros propuestos | Proteína 187 g (~2.4 g/kg), grasas 65 g (~0.83 g/kg, la propuesta del propio Anexo A.7), carbohidratos 255 g → 2,353 kcal |
| Días con MTB | Se suman kcal según el gasto del paseo registrado (CAR-02); el coach decide cuánto con tus datos |
| Suelo de alerta | Menos de 1,800 kcal en un día (Anexo A.10, sin cambio) |

Para llegar a 2,350 el plan de comidas solo necesita ~100 kcal más (por ejemplo, +10 g de grasa con aceite de oliva o aguacate y algo de carbohidrato); se ajusta en la Fase 4. Punto de control a las 6 semanas (fin de noviembre): si bajas más de 0.5 % por semana, subir 100-150 kcal; si la media de 7 días no se mueve en 3 semanas, bajar 100-150 kcal.

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
| Planes y rutinas | $1.2 (3) | $2.4 (6) | $6 (12) |
| Informe mensual | $0.3 | $0.3 | $0.5 |
| **Operación** | **~$17** | **~$42** | **~$132** |
| Evals del coach en CI (sobre todo en la Fase 5) | ~$5 | ~$15 | ~$40 |
| **Total** | **~$22** | **~$57** | **~$172** |
| ¿Alcanza con Max 5x ($100)? | Sí, sobra 78 % | Sí, sobra 43 % | No: se agotaría hacia el día 17 |
| ¿Alcanza con Max 20x ($200)? | Sí | Sí | Sí, justo |

Los embeddings para la memoria semántica (pgvector) no salen de Anthropic, que no ofrece ese servicio; ver preguntas.

### Recomendación

| Tarea | Modelo | Motivo |
| --- | --- | --- |
| Chat del coach, planes y rutinas, revisión semanal | Opus 5.5, esfuerzo medio | Razonamiento sobre muchos datos; precio razonable |
| Consejos diarios, lectura de capturas, extracción de datos | Sonnet 5.5 (esfuerzo bajo) | Tareas acotadas; la mitad del costo |
| Clasificación simple o resúmenes cortos | Haiku 5.5 | Casi gratis |
| Coach en producción | Nunca Fable 5.1 | 2.5× el precio de Opus sin ganancia clara aquí |

- **Tope mensual en la app:** $80 si tienes Max 5x ($160 con Max 20x), con avisos al 50 % y al 80 %, y un tope diario de $8 para cortar bucles. Así nunca te quedas sin coach a mitad de mes.
- **Al llegar al 80 %:** propuesta de pasar el chat a Sonnet 5.5 hasta fin de mes (decisión tuya, ver preguntas).
- **Evals:** en cada pull request, solo los casos críticos; la batería completa cuando cambian el prompt o las herramientas.
- Registro de tokens por conversación y panel de costos (RNF-11).

---

## 7. Estimación de tiempo por fase (propuesta)

### Supuestos

- Claude Code programa rápido; el cuello de botella es tu revisión: aprobar mockups, probar demos y cumplir criterios que exigen vida real (una semana entrenando, una semana de comidas, una sesión con el reloj).
- Tu disponibilidad: 8-12 horas por semana para revisar y probar, con respuestas en 1-2 días.
- Una fase a la vez, con solape menor (diseño de la siguiente mientras se prueba la actual).
- Fable 5.1 solo en lo crítico (BD de la Fase 1, sincronización de las fases 7 y 7b, RLS); su límite semanal puede frenar esas fases.
- No incluye pausas largas ni cambios de alcance.

| Fase | Optimista | Probable | Qué la alarga |
| --- | --- | --- | --- |
| 0. Lo que falta (PRD, `/impeccable init`) | 0.5 | 1 | Rondas de revisión |
| 0.5 Diseño UX (9 flujos × 4 piezas, modelo conceptual de BD) | 2 | 4 | Iteraciones de mockups |
| 1. Núcleo | 1.5 | 3 | Modelo de datos completo, RLS, despliegue y backups |
| 2. Gym (PWA) | 2 | 4 | Incluye la semana real de entreno |
| 3. Salud | 1.5 | 2.5 | Librería no oficial de Renpho |
| 4. Nutrición y suplementos | 2.5 | 4 | Cargar la base de alimentos dominicanos; semana real de comidas |
| 5. Coach IA | 2 | 4 | Prompt, herramientas y evals |
| 6. Dashboard y cardio | 1 | 2 | Informe PDF y carga combinada |
| 7. App Android | 3 | 5 | Offline-first sin pérdida de datos, Health Connect |
| 7b. Galaxy Watch | 2.5 | 4 | App nativa en Kotlin, Data Layer, pruebas en el Watch4 |
| 8. Versión 1.0 | 1 | 2 | Hallazgos de la auditoría |
| **Total** | **~19.5 semanas** | **~35.5 semanas** | |

- **v1.0 completa:** entre principios de marzo (optimista) y finales de junio de 2027 (probable).
- **Modo gym usable en el teléfono (fin de la Fase 2):** entre finales de noviembre de 2026 y mediados de enero de 2027.

**Riesgo principal (plan, sección 17):** que el desarrollo retrase tu vuelta al gym. Con estas fechas, casi toda la ventana de las metas de enero pasa antes de que exista el modo gym. Mitigación: empezar ya con la rutina Full Body A/B/C en papel ([Anexo A.6](plan-maestro.md#a6-plan-de-entrenamiento-full-body-abc)), apuntar pesos y reps, y cargarlos en el sistema cuando llegue la Fase 2. El gym no espera al software.

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

## 9. Preguntas para Francis

1. **Plan Max:** ¿tienes Max 5x ($100 de créditos de API) o Max 20x ($200)? Define el tope del coach.
2. **Metas de enero:** ¿validas la tabla de la sección 5? En especial, cambiar el IMC meta de "< 25" a 25.5-26.0 y la TMB de "1,780+" a "≥ 1,725".
3. **Calorías:** ¿apruebas 2,350 kcal con P 187 / C 255 / G 65? ¿Quieres un objetivo distinto para días de gym y de descanso (NUT-03 lo permite) o uno solo más el ajuste por MTB?
4. **Medidas con cinta:** no hay medición de octubre (las del Anexo A.3 son de abril). ¿Puedes medirte antes de empezar para tener punto de partida?
5. **Tope del coach:** ¿te parece $80 al mes (o $160 con Max 20x) con tope diario de $8? Al llegar al 80 %, ¿prefieres que el chat pase a Sonnet 5.5 o que siga en Opus 5.5 hasta agotarse?
6. **Embeddings de la memoria:** Anthropic no ofrece embeddings. Opciones: un modelo local en el servidor (gratis, tus datos no salen) o un servicio externo (de pago, otro proveedor ve tus conversaciones). Es privacidad y costo; la parte técnica irá en un ADR.
7. **Fotos de progreso:** SAL-03 (fotos con comparador) está en W, pero la Fase 3 y el flujo "Registrar medición" mencionan fotos. ¿Entran fotos simples sin comparador o quedan todas fuera?
8. **Mapa corporal de músculos:** la sección 14 lo describe como parte del diseño, pero el backlog lo deja fuera de la v1.0. ¿Lo confirmas fuera (el volumen por músculo de GYM-06 se ve en tablas y gráficos)?
9. **Requisitos S** (WAT-03, WAT-04, SUP-03, SIS-02): ¿son compromiso de la v1.0 o se pueden posponer si las fechas se alargan?
10. **Flujos de la Fase 0.5:** ¿confirmas que se diseñan los 9 flujos (los 8 de la web más el del reloj)?
11. **Disponibilidad:** ¿cuántas horas por semana puedes dedicar a revisar y probar? Con eso ajusto la estimación de la sección 7.
12. **Nombre en el plan:** el plan maestro se titula "Fitness Coach System" y el nombre provisional es "Coach Fitness AI". ¿Unifico el título del plan?
