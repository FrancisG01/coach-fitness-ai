# 0018 — App nativa para Galaxy Watch y cronometría de sesión

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 5 (GYM-09, GYM-10, WAT-01 a WAT-06), 9 (stack), 10 ("App para Galaxy Watch"), 13 (pruebas del reloj), 16 (Fase 7b) y 17 (riesgos); decisiones D-02, D-13 y D-18

## Contexto

Francis quiere entrenar sin sacar el teléfono. Usa un Galaxy Watch4 Classic, que ya recibe One UI 8 Watch (Wear OS 6), salvo los modelos LTE, que siguen en One UI 7. La app Android es Expo/React Native (ADR 0002), pero Wear OS no ejecuta React Native ni WebView.

## Decisión

- **App nativa para el reloj:**
  - Kotlin con Jetpack Compose for Wear OS, Horologist y Health Services;
  - apunta a Wear OS 3 o superior;
  - se conecta a la app Android por el Data Layer de Wear OS, con un módulo nativo en la app Expo. Usa Bluetooth cuando están cerca y Wi-Fi como respaldo;
  - el teléfono sube los datos al servidor.
- **Fase 7b**, después de la app Android.
- **El reloj hace lo esencial de la sesión:**
  - iniciar la sesión del día;
  - ciclo de serie y descanso con vibración;
  - espera hasta play manual.

  Lo complejo sigue en el teléfono.
- **Nada se pierde:**
  - cada acción se guarda primero en el reloj y se envía al teléfono, que confirma; si no confirma, el reloj reintenta;
  - la sesión es un registro de eventos con hora real y se cierra sola tras 2 horas sin actividad.
- **Cronometría de sesión en todo el sistema** (teléfono, reloj y estadísticas): tiempo total, tiempo en series, descanso programado y tiempo extra de descanso, por serie, por ejercicio y por sesión (GYM-09).

## Alternativas consideradas

- **React Native o WebView en el reloj.** Descartado: Wear OS no los ejecuta.

## Consecuencias

- Un tercer lenguaje y toolchain en el monorepo (Kotlin, en `apps/watch/`), con su propio agente (Reloj) y pruebas de Compose for Wear OS más una prueba real en el Watch4 Classic.
- La sincronización tiene dos tramos: reloj a teléfono por Data Layer y teléfono a servidor (offline-first, ADR 0012 y sección 10). Ambos deben ser idempotentes y sobrevivir a cortes, al cierre de la app y a quedarse sin batería.
- El coach puede usar los tiempos; por ejemplo, un tiempo extra que crece semana a semana puede indicar fatiga.
- Riesgo del Watch4 por ser un modelo antiguo (batería, versión de Wear OS), mitigado apuntando a Wear OS 3+, con pantalla siempre activa solo durante la sesión y pruebas en el reloj real.
