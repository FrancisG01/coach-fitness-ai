# 0022 — Íconos: Tabler Icons (outline) en web, Android y reloj

- Fecha: 18-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 9 (stack), 14 (diseño) y 21 (pendientes); `DESIGN.md` (Shapes, sección Íconos y logo provisional); `docs/diseno/tokens.json` (`iconos`); decisiones D-02, D-17 y D-18

## Contexto

Los mockups B2 usan íconos de trazo lineal, pero la biblioteca no estaba elegida. El producto vive en tres superficies con tecnologías distintas: web en React (ADR 0002), app Android en Expo/React Native (ADR 0002) y app nativa del reloj en Kotlin con Compose for Wear OS (ADR 0018). Un mismo ícono tiene que verse igual en las tres.

Además, el logo provisional es una mancuerna genérica de la biblioteca elegida, servida desde `packages/brand` (SIS-05).

Se compararon tres bibliotecas de trazo, con las versiones publicadas en npm el 18-oct-2026:

| | Tabler Icons | Lucide | Phosphor |
| --- | --- | --- | --- |
| Versión y licencia | 3.49.0, MIT | 1.59.0, ISC | 2.1.10 (React), MIT |
| React | `@tabler/icons-react` (oficial) | `lucide-react` (oficial) | `@phosphor-icons/react` (oficial) |
| React Native | `@tabler/icons-react-native` (oficial, sobre `react-native-svg`) | `lucide-react-native` (oficial, sobre `react-native-svg`) | `phosphor-react-native` 3.0.6 (mantenido fuera de la organización de Phosphor) |
| Compose | SVG de `@tabler/icons` a `ImageVector` | SVG de `lucide-static` a `ImageVector` | SVG de `@phosphor-icons/core` a `ImageVector` |
| Grosor de trazo | Libre (prop `stroke`) | Libre (prop `strokeWidth`) | Seis pesos fijos, sin trazo libre |
| Cantidad | ~5,180 | ~1,890 | ~1,510 por peso |
| Mancuerna | `barbell` (de lado, como en el mockup) y `dumbbell` (pesa rusa) | `dumbbell` (en diagonal) | `barbell` |
| Báscula de baño | `scale-outline` | No tiene (`scale` es una balanza de justicia; `weight` es una pesa) | No tiene (`scales` es balanza) |
| Corazón y pulso | `heart`, `heartbeat`, `heart-rate-monitor` | `heart`, `heart-pulse` | `heart`, `heartbeat` |
| Bici | `bike` | `bike` | `bicycle` |
| Otros del dominio | `treadmill`, `run`, `stretching`, `salad`, `pill`, `device-watch` | `salad`, `pill`, `footprints`, `watch` | `person-simple-run`, `pill`, `fork-knife` |

## Decisión

- **Tabler Icons, estilo outline**, como única biblioteca de íconos en las tres superficies:
  - web: `@tabler/icons-react`;
  - Android (Expo): `@tabler/icons-react-native`, que depende de `react-native-svg`;
  - reloj: los SVG de `@tabler/icons` se convierten a `ImageVector` de Compose (Android Studio, "Vector Asset", o un conversor de SVG a ImageVector en el build) y se guardan en `apps/watch` solo los que se usan.
- **Versión fijada:** 3.49.0, la misma en los tres paquetes. Se actualiza a la vez en las tres superficies.
- **Trazo:** 1.75 en la retícula de 24, con extremos y uniones redondeados; 2 en el tamaño de 16.
- **Tamaños (tokens):** 16, 20, 24 y 32 px (dp en Android y reloj).
- **Solo outline.** No se mezclan las variantes rellenas ni íconos de otra familia.
- **Logo provisional:** el glifo `barbell`, presentado como pieza de marca desde `packages/brand` (regla en `DESIGN.md`).

## Alternativas consideradas

- **Lucide.** Muy cuidada y con paquetes oficiales para React y React Native. Descartada por cobertura: no tiene báscula de baño, que el producto necesita para el pesaje en Renpho, y su mancuerna va en diagonal, distinta de la de los mockups.
- **Phosphor.** Buen dibujo y seis pesos. Descartada porque el paquete de React Native se mantiene fuera de la organización de Phosphor, no hay trazo libre (solo pesos fijos) y tampoco tiene báscula de baño.
- **Dibujar íconos propios.** Descartado para la v1.0 por costo. Se puede revisar cuando haya nombre y logo definitivos.

## Consecuencias

- Un solo dibujo de ícono en web, Android y reloj; el trazo y los tamaños son tokens y se cambian en un lugar.
- La app Android suma `react-native-svg` como dependencia nativa (Expo la incluye en su SDK).
- En el reloj no hay paquete de Compose: cada ícono nuevo se convierte a mano o con un paso del build. Conviene un script en `apps/watch` que genere los `ImageVector` desde la lista de íconos usados.
- Los SVG de Tabler traen un primer trazado vacío (`M0 0h24v24H0z`) que se descarta al convertir.
- Al importar ícono por ícono (no el paquete completo) el peso en web y móvil se limita a los que se usan.
- Si cambia el logo definitivo, el glifo `barbell` sigue siendo el ícono de la pestaña Gym; la pieza de marca vive aparte en `packages/brand`.
