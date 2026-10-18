# Product

<!-- impeccable:product-schema 1 -->

<!-- Encabezados en inglés porque Impeccable los lee por nombre; contenido en español. Fuente: docs/prd.md y docs/plan-maestro.md. Si algo choca, mandan esos dos. -->

## Platform

adaptive

Un mismo producto en tres superficies: web responsive instalable (PWA), app Android (Expo, Galaxy S24 Ultra) y app nativa Wear OS 3+ (Galaxy Watch4 Classic). La identidad B2 (color, Archivo, formas) es la misma en todas. Android y el reloj respetan lo nativo: gesto atrás del sistema, pantalla redonda y corona o bisel del reloj (decisión de Francis, 18-oct-2026).

## Users

- **Usuario principal (v1.0):** Francis Guzman, 29 años, diseñador gráfico y trader algorítmico en República Dominicana. Conoce series rampa, periodización y progresión de carga. Es dueño y único usuario.
- **Situación:** gym completo a las 8:00 AM, a veces sin señal; trabajo sentado el resto del día; MTB registrado en Strava. Vuelve tras 19 semanas sin gym con una rutina Full Body A/B/C.
- **Trabajo que hace:** registrar cada día entreno, comida, suplementos y mediciones para que un coach IA decida sobre datos reales y el progreso sea visible.
- **Usuarios futuros:** la arquitectura es multiusuario desde el día 1, pero abrirla al público es una decisión futura. El perfil de ese público no está definido.

## Product Purpose

En seis meses (abril a octubre de 2026) la composición corporal de Francis no se movió: datos dispersos y herramientas que no se hablan. Coach Fitness AI junta todo en un sistema y pone encima un coach que trabaja con esos datos.

Éxito (docs/prd.md §1):

- Registrar sin fricción: una serie en 3 toques o menos; una comida en 30 s o menos.
- Uso constante: 90 % o más de sesiones de gym y 80 % o más de días de comida registrados.
- Coach con datos reales: el 100 % de las respuestas se basa en datos o dice cuáles faltan.
- Progreso visible y confiable: tendencias a la vista, cero pérdida de datos.
- Progreso físico: metas de enero de 2027 (docs/prd.md §5), con 2,350 kcal/día como objetivo.

## Positioning

Un coach personal de élite que conoce todos tus datos, sobre una plataforma que hace fácil registrarlos. Lo que lo separa de una app de fitness comercial:

- El coach consulta la base de datos con herramientas, como un analista, y dice qué datos usó.
- Tiene memoria de decisiones y preferencias; todo lo que propone es un borrador que se aprueba antes de guardarse.
- Modo gym offline-first en el teléfono y en el reloj, con cronometría de sesión.
- Une lo que las herramientas comerciales no juntan: Renpho, Health Connect, MTB desde captura de Strava, nutrición propia con alimentos dominicanos (INCAP + USDA) y volumen semanal ponderado por músculo.

## Operating Context

- **Modo gym (teléfono):** tachar series, editar peso y reps al vuelo, descanso con vibración, rampa calculada sola, autoguardado. Funciona sin señal con 14 días de sesiones descargadas e indica el estado de sincronización.
- **Reloj:** ciclo serie → check → descanso con cuenta regresiva grande → vibración → "listo cuando quieras". Sigue funcionando lejos del teléfono.
- **Escritorio y web:** planificación, nutrición, salud, panel del día, informe mensual y chat con el coach.
- **Rituales:** entreno por la mañana, registro de comidas durante el día, revisión semanal del coach, pesaje en Renpho.
- **Acceso:** solo por Tailscale, con login y 2FA.

## Capabilities and Constraints

- **Módulos v1.0:** GYM, WAT (reloj), SAL (salud), NUT (nutrición), SUP (suplementos), CAR (cardio), COA (coach), DSH (panel) y SIS (sistema). Detalle e IDs en docs/prd.md §2.
- **Fuera de la v1.0:** iOS, Google Play, apertura al público, APIs de Strava y Cronometer, escáner de código de barras, fotos de progreso, mapa corporal, RPE/RIR, comida por foto o texto libre, hábitos y rachas.
- **Coach:** nunca diagnostica, no interpreta síntomas graves (refiere a un médico), no prescribe fármacos, no inventa datos ni valida por comodidad, no recomienda déficits extremos. Tope de $80/mes y $8/día; al 80 % pasa a Sonnet 5.5 y avisa.
- **Rendimiento:** pantallas en menos de 2 s en 4G; acciones del modo gym en menos de 200 ms.
- **Datos:** offline-first sin duplicar ni perder series; datos de salud sensibles, sin puertos públicos; a Anthropic solo sale lo necesario.
- **Idioma:** español neutro con tuteo y unidades métricas. Los alimentos y porciones dominicanos conservan su nombre local (habichuelas, mangú, plátano).
- **Textos de interfaz:** tipo oración, sin mayúsculas en etiquetas, sin signos de exclamación.
- **Abierto:** perfil del público futuro y si el tono del coach cambia para él.

## Brand Commitments

- **Nombre provisional:** "Coach Fitness AI" ("Coach" en espacios cortos). Nombre, logo e ícono salen siempre de `packages/brand`; nunca se escriben a mano en pantallas (SIS-05). Nombre y logo definitivos: pendientes.
- **Dirección visual aprobada:** B2 "Caucho y acento" (ADR 0017, `docs/diseno/`). Su detalle vive en DESIGN.md, no aquí.
- **Personalidad:** datos como protagonistas, mucho aire, movimiento con propósito y respuesta háptica al tachar una serie. Que no parezca hecho con IA: nada de componentes de plantilla sin tocar, tarjetas idénticas ni emojis.
- **Voz del coach:** directa, técnica, sin suavizar; cita los datos que usó.

## Evidence on Hand

- Datos reales de Renpho del 17-abr y 17-oct-2026 (docs/plan-maestro.md, Anexo A.2 y A.2b).
- Rutina A/B/C confirmada con la hoja GymTracker; catálogo inicial de suplementos.
- Propuesta visual B2 en `docs/diseno/Propuesta_Identidad_Visual_B2_Caucho_y_acento.pdf` y `docs/diseno/tokens.json`.
- **No existen y no se inventan:** medidas con cinta de octubre (pendientes), análisis de sangre, historial de Cronometer, testimonios, usuarios externos, investigación con usuarios, logo definitivo, mockups (Fase 0.5 sin empezar).

## Product Principles

1. **Registrar cuesta menos que olvidarlo.** Cada toque de más en el gym o en la comida es una razón para dejar de registrar.
2. **Los datos mandan.** El coach y las pantallas muestran lo que dicen los números y lo que falta, sin adornar.
3. **Nada se pierde.** Sin señal, sin teléfono o con la sesión a medias, la serie queda guardada.
4. **El coach propone, Francis decide.** Ningún cambio del coach se guarda sin aprobación.
5. **Una sola persona hoy, muchas mañana.** Todo se construye aislado por usuario aunque hoy haya uno.

## Accessibility & Inclusion

- Uso con una mano en el gym y con manos sudadas o con guantes: objetivos táctiles de 44 px o más, botones grandes y separados, sin gestos finos en el modo gym.
- Contraste AA, texto escalable y modo oscuro según el sistema; el error siempre con ícono y texto.
- Color propio del usuario solo si pasa la verificación de contraste (SIS-04).
- Lectura rápida: cifras grandes con números tabulares, cuenta regresiva grande en el reloj, vibración al terminar el descanso.
