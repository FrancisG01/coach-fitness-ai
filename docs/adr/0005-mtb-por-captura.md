# 0005 — Paseos de MTB por captura de pantalla al chat del coach

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 1, 4 (alcance y restricciones), 5 (módulo Cardio/MTB, CAR-01 y CAR-02), 7 (integraciones), 11 (licencias) y 17 (riesgos); decisiones D-05 y D-13

## Contexto

Francis lleva 12 semanas haciendo MTB y registra sus paseos en Strava. El coach necesita esos datos para calcular carga cardiovascular, calorías y recuperación de piernas. Pero desde noviembre de 2024 los términos de la API de Strava prohíben usar sus datos en IA, y en junio de 2026 endurecieron más el acceso (sección 7). El coach analizando paseos es justo lo que esos términos prohíben a las apps conectadas. En cambio, que Francis comparta sus propios datos no pasa por esa API.

## Decisión

Los paseos entran por captura de pantalla que Francis sube al chat del coach, sin conectar la API de Strava:

1. el coach lee los datos de la captura: distancia, tiempo, desnivel, velocidad, frecuencia cardíaca, calorías y lo que muestre;
2. muestra una tarjeta para confirmar o corregir;
3. guarda la actividad en Cardio/MTB con la imagen adjunta.

Opcional: archivo GPX o FIT si se quiere la ruta en mapa.

## Alternativas consideradas

- **API de Strava.** Descartada por sus términos; figura como "fuera de la v1.0" en la sección 4 y como restricción.

## Consecuencias

- El coach puede usar los paseos sin incumplir los términos de Strava.
- Registrar un paseo exige un paso manual (subir la captura) y conexión a internet; sin señal, queda en cola (sección 10).
- Riesgo de lectura errónea de la captura (sección 17), mitigado con la tarjeta de confirmación obligatoria.
- Si la app se abre al público, hay que confirmar que el registro por captura de cada usuario cumple los términos de Strava (sección 11).
