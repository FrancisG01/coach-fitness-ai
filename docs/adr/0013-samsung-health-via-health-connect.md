# 0013 — Samsung Health vía Health Connect en la app Android; Strava sigue por captura

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 5 (SAL-06), 7 (integraciones), 12 (Fase S, teléfono) y 16 (Fase 7); decisiones D-05, D-13 y D-18

## Contexto

Pasos, frecuencia cardíaca y sueño son datos que el coach necesita a diario y que Francis no debería registrar a mano. Su teléfono y su reloj Samsung los guardan en Samsung Health. Las APIs de terceros como Strava están restringidas (ADR 0005).

## Decisión

- La app Android lee en el teléfono, vía Android Health Connect, lo que Samsung Health escribe ahí: pasos, frecuencia cardíaca diaria y en reposo, y sueño (SAL-06, prioridad M).
- Llega con la app Android, en la Fase 7.
- En el teléfono, Samsung Health debe tener activada la sincronización hacia Health Connect (Fase S).
- Los paseos de MTB siguen entrando por captura de pantalla (ADR 0005), no por Health Connect.

## Alternativas consideradas

- **Recibir esos datos desde Strava.** Descartado: su API está restringida y prohíbe usar sus datos en IA (ADR 0005).

El plan no menciona otras vías para estos datos.

## Consecuencias

- Pasos, frecuencia cardíaca y sueño llegan sin intervención y sin depender de APIs restringidas.
- La lectura ocurre en el teléfono, no en el servidor: estos datos solo llegan cuando la app Android corre y sincroniza. La web por sí sola no los obtiene.
- Hasta la Fase 7 el sistema no tiene estos datos.
