---
name: Coach Fitness AI
description: Entrenamiento, nutrición y salud con coach IA. Dirección B2 "Caucho y acento".
colors:
  # Base neutra, modo oscuro (fondo de fábrica: caucho)
  oscuro-fondo: "#1B1E23"
  oscuro-superficie: "#23272D"
  oscuro-elevado: "#2D3239"
  oscuro-borde: "#3A4048"
  oscuro-texto: "#F3F4F1"
  oscuro-textoSecundario: "#A3AAB3"
  oscuro-error: "#FF6B6B"
  oscuro-datoGris: "#6B737D"
  # Base neutra, modo claro (fondo: tiza)
  claro-fondo: "#F3F4F1"
  claro-superficie: "#FFFFFF"
  claro-elevado: "#E9EBE7"
  claro-borde: "#DADDD8"
  claro-texto: "#1E2228"
  claro-textoSecundario: "#5B626B"
  claro-error: "#C9333A"
  claro-datoGris: "#B5BBC2"
  claro-textoSobreAccion: "#FFFFFF"
  # Fondos alternos (solo modo oscuro)
  grafito-fondo: "#202124"
  grafito-superficie: "#292A2D"
  grafito-elevado: "#33353A"
  grafito-borde: "#3F4247"
  pizarra-fondo: "#1A2026"
  pizarra-superficie: "#222A31"
  pizarra-elevado: "#2B343C"
  pizarra-borde: "#38434D"
  # Acento de fábrica: Caribe (A1 a A5)
  caribe-a1: "#CFE6F5"
  caribe-a2: "#7CC0EA"
  caribe-a3: "#3B95D1"
  caribe-a4: "#1F6FA8"
  caribe-a5: "#154E78"
  # Fondo suave del acento (tarjeta destacada), Caribe
  caribe-suave-oscuro: "color-mix(in srgb, #3B95D1 20%, #23272D)"
  caribe-suave-claro: "color-mix(in srgb, #3B95D1 13%, #FFFFFF)"
  # Capas de estado (velo del texto del modo) y velo de diálogo
  oscuro-capaHover: "color-mix(in srgb, #F3F4F1 6%, transparent)"
  oscuro-capaPressed: "color-mix(in srgb, #F3F4F1 10%, transparent)"
  claro-capaHover: "color-mix(in srgb, #1E2228 6%, transparent)"
  claro-capaPressed: "color-mix(in srgb, #1E2228 10%, transparent)"
  oscuro-velo: "color-mix(in srgb, #1B1E23 72%, transparent)"
  claro-velo: "color-mix(in srgb, #1E2228 40%, transparent)"
  # Acentos alternativos (A1 a A5)
  mar-a1: "#C8EEEA"
  mar-a2: "#6FD6CC"
  mar-a3: "#22A99C"
  mar-a4: "#157A70"
  mar-a5: "#0F5850"
  palma-a1: "#CDEEDB"
  palma-a2: "#6FD19B"
  palma-a3: "#2FA866"
  palma-a4: "#1E7D4A"
  palma-a5: "#155A36"
  mango-a1: "#FCE7C2"
  mango-a2: "#F7C062"
  mango-a3: "#E89A1E"
  mango-a4: "#9A5C06"
  mango-a5: "#6E4307"
  flamboyan-a1: "#FBD6CB"
  flamboyan-a2: "#F79A7E"
  flamboyan-a3: "#E8603C"
  flamboyan-a4: "#B6411F"
  flamboyan-a5: "#7E2C14"
  uva-a1: "#E3DBFA"
  uva-a2: "#B4A2F2"
  uva-a3: "#8466DB"
  uva-a4: "#6446B8"
  uva-a5: "#45307F"
typography:
  cifraHeroe:
    fontFamily: "Archivo"
    fontSize: "56px"
    lineHeight: "52px"
    fontWeight: 800
    fontVariation: "'wdth' 62"
    fontFeature: "'tnum'"
  cifraDescanso:
    fontFamily: "Archivo"
    fontSize: "96px"
    lineHeight: "88px"
    fontWeight: 800
    fontVariation: "'wdth' 62"
    fontFeature: "'tnum'"
  cifraMetrica:
    fontFamily: "Archivo"
    fontSize: "32px"
    lineHeight: "32px"
    fontWeight: 800
    fontVariation: "'wdth' 62"
    fontFeature: "'tnum'"
  tituloPantalla:
    fontFamily: "Archivo"
    fontSize: "25px"
    lineHeight: "30px"
    fontWeight: 700
    fontVariation: "'wdth' 85"
  tituloSeccion:
    fontFamily: "Archivo"
    fontSize: "20px"
    lineHeight: "26px"
    fontWeight: 650
  cuerpo:
    fontFamily: "Archivo"
    fontSize: "16px"
    lineHeight: "24px"
    fontWeight: 400
  detalle:
    fontFamily: "Archivo"
    fontSize: "13px"
    lineHeight: "18px"
    fontWeight: 500
  boton:
    fontFamily: "Archivo"
    fontSize: "15px"
    lineHeight: "20px"
    fontWeight: 650
rounded:
  casilla: "6px"
  control: "10px"
  tarjeta: "16px"
  pildora: "999px"
spacing:
  "4": "4px"
  "8": "8px"
  "12": "12px"
  "16": "16px"
  "24": "24px"
  "32": "32px"
  "48": "48px"
components:
  button-primary-dark:
    backgroundColor: "{colors.caribe-a2}"
    textColor: "{colors.oscuro-fondo}"
    typography: "{typography.boton}"
    rounded: "{rounded.control}"
  button-primary-light:
    backgroundColor: "{colors.caribe-a4}"
    textColor: "{colors.claro-textoSobreAccion}"
    typography: "{typography.boton}"
    rounded: "{rounded.control}"
  button-primary-dark-hover:
    backgroundColor: "{colors.caribe-a1}"
    textColor: "{colors.oscuro-fondo}"
  button-primary-dark-pressed:
    backgroundColor: "{colors.caribe-a1}"
    textColor: "{colors.oscuro-fondo}"
  button-primary-dark-disabled:
    backgroundColor: "{colors.oscuro-elevado}"
    textColor: "{colors.oscuro-texto}"
  button-primary-light-hover:
    backgroundColor: "{colors.caribe-a5}"
    textColor: "{colors.claro-textoSobreAccion}"
  button-primary-light-pressed:
    backgroundColor: "{colors.caribe-a5}"
    textColor: "{colors.claro-textoSobreAccion}"
  button-primary-light-disabled:
    backgroundColor: "{colors.claro-elevado}"
    textColor: "{colors.claro-texto}"
  button-primary-gym:
    typography: "{typography.boton}"
    rounded: "{rounded.control}"
    height: "56px"
  button-secondary-dark:
    textColor: "{colors.oscuro-texto}"
    typography: "{typography.boton}"
    rounded: "{rounded.control}"
  button-secondary-light:
    textColor: "{colors.claro-texto}"
    typography: "{typography.boton}"
    rounded: "{rounded.control}"
  button-secondary-dark-hover:
    backgroundColor: "{colors.oscuro-capaHover}"
    textColor: "{colors.oscuro-texto}"
  button-secondary-dark-pressed:
    backgroundColor: "{colors.oscuro-capaPressed}"
    textColor: "{colors.oscuro-texto}"
  button-secondary-light-hover:
    backgroundColor: "{colors.claro-capaHover}"
    textColor: "{colors.claro-texto}"
  button-secondary-light-pressed:
    backgroundColor: "{colors.claro-capaPressed}"
    textColor: "{colors.claro-texto}"
  button-text-dark:
    textColor: "{colors.caribe-a2}"
    typography: "{typography.boton}"
    rounded: "{rounded.control}"
  button-text-dark-hover:
    backgroundColor: "{colors.oscuro-capaHover}"
    textColor: "{colors.caribe-a1}"
  button-text-dark-pressed:
    backgroundColor: "{colors.oscuro-capaPressed}"
    textColor: "{colors.caribe-a1}"
  button-text-light:
    textColor: "{colors.caribe-a4}"
    typography: "{typography.boton}"
    rounded: "{rounded.control}"
  button-text-light-hover:
    backgroundColor: "{colors.claro-capaHover}"
    textColor: "{colors.caribe-a5}"
  button-text-light-pressed:
    backgroundColor: "{colors.claro-capaPressed}"
    textColor: "{colors.caribe-a5}"
  card-dark:
    backgroundColor: "{colors.oscuro-superficie}"
    textColor: "{colors.oscuro-texto}"
    rounded: "{rounded.tarjeta}"
  card-light:
    backgroundColor: "{colors.claro-superficie}"
    textColor: "{colors.claro-texto}"
    rounded: "{rounded.tarjeta}"
  card-featured-dark:
    backgroundColor: "{colors.caribe-suave-oscuro}"
    textColor: "{colors.oscuro-texto}"
    rounded: "{rounded.tarjeta}"
  card-featured-light:
    backgroundColor: "{colors.caribe-suave-claro}"
    textColor: "{colors.claro-texto}"
    rounded: "{rounded.tarjeta}"
  checkbox-checked-dark:
    backgroundColor: "{colors.caribe-a2}"
    textColor: "{colors.oscuro-fondo}"
    rounded: "{rounded.casilla}"
  checkbox-checked-light:
    backgroundColor: "{colors.caribe-a4}"
    textColor: "{colors.claro-textoSobreAccion}"
    rounded: "{rounded.casilla}"
  chip-selected-dark:
    backgroundColor: "{colors.caribe-a2}"
    textColor: "{colors.oscuro-fondo}"
    typography: "{typography.detalle}"
    rounded: "{rounded.pildora}"
  chip-unselected-dark:
    backgroundColor: "{colors.oscuro-elevado}"
    textColor: "{colors.oscuro-textoSecundario}"
    typography: "{typography.detalle}"
    rounded: "{rounded.pildora}"
  chip-unselected-dark-hover:
    textColor: "{colors.oscuro-texto}"
  chip-selected-light:
    backgroundColor: "{colors.caribe-a4}"
    textColor: "{colors.claro-textoSobreAccion}"
    typography: "{typography.detalle}"
    rounded: "{rounded.pildora}"
  chip-unselected-light:
    backgroundColor: "{colors.claro-elevado}"
    textColor: "{colors.claro-textoSecundario}"
    typography: "{typography.detalle}"
    rounded: "{rounded.pildora}"
  chip-unselected-light-hover:
    textColor: "{colors.claro-texto}"
  row-dark:
    backgroundColor: "{colors.oscuro-superficie}"
    textColor: "{colors.oscuro-texto}"
    rounded: "{rounded.control}"
    height: "56px"
  row-dark-pressed:
    backgroundColor: "{colors.oscuro-capaPressed}"
  row-light:
    backgroundColor: "{colors.claro-superficie}"
    textColor: "{colors.claro-texto}"
    rounded: "{rounded.control}"
    height: "56px"
  row-light-pressed:
    backgroundColor: "{colors.claro-capaPressed}"
  input-dark:
    backgroundColor: "{colors.oscuro-elevado}"
    textColor: "{colors.oscuro-texto}"
    typography: "{typography.cuerpo}"
    rounded: "{rounded.control}"
  input-light:
    backgroundColor: "{colors.claro-elevado}"
    textColor: "{colors.claro-texto}"
    typography: "{typography.cuerpo}"
    rounded: "{rounded.control}"
  nav-bar-dark:
    backgroundColor: "{colors.oscuro-superficie}"
    height: "64px"
  nav-bar-light:
    backgroundColor: "{colors.claro-superficie}"
    height: "64px"
  nav-item-dark:
    textColor: "{colors.oscuro-textoSecundario}"
    typography: "{typography.detalle}"
  nav-item-dark-active:
    textColor: "{colors.caribe-a2}"
  nav-item-light:
    textColor: "{colors.claro-textoSecundario}"
    typography: "{typography.detalle}"
  nav-item-light-active:
    textColor: "{colors.caribe-a4}"
  dialog-dark:
    backgroundColor: "{colors.oscuro-elevado}"
    textColor: "{colors.oscuro-texto}"
    rounded: "{rounded.tarjeta}"
    padding: "24px"
    width: "400px"
  dialog-light:
    backgroundColor: "{colors.claro-superficie}"
    textColor: "{colors.claro-texto}"
    rounded: "{rounded.tarjeta}"
    padding: "24px"
    width: "400px"
  scrim-dark:
    backgroundColor: "{colors.oscuro-velo}"
  scrim-light:
    backgroundColor: "{colors.claro-velo}"
  toast-dark:
    backgroundColor: "{colors.oscuro-texto}"
    textColor: "{colors.oscuro-fondo}"
    typography: "{typography.cuerpo}"
    rounded: "{rounded.control}"
    padding: "12px 16px"
  toast-dark-action:
    textColor: "{colors.caribe-a4}"
    typography: "{typography.boton}"
  toast-light:
    backgroundColor: "{colors.claro-texto}"
    textColor: "{colors.claro-fondo}"
    typography: "{typography.cuerpo}"
    rounded: "{rounded.control}"
    padding: "12px 16px"
  toast-light-action:
    textColor: "{colors.caribe-a2}"
    typography: "{typography.boton}"
  skeleton-dark:
    backgroundColor: "{colors.oscuro-elevado}"
    rounded: "{rounded.casilla}"
  skeleton-light:
    backgroundColor: "{colors.claro-elevado}"
    rounded: "{rounded.casilla}"
  metric-hero:
    typography: "{typography.cifraHeroe}"
  metric-rest:
    typography: "{typography.cifraDescanso}"
  metric:
    typography: "{typography.cifraMetrica}"
---

<!-- Aprobado por Francis el 18-oct-2026. Derivado de la dirección aprobada B2 "Caucho y acento" (docs/diseno/tokens.json y Propuesta_Identidad_Visual_B2_Caucho_y_acento.pdf, 17-oct-2026), ampliado el 18-oct-2026 con estados, movimiento, íconos, superposiciones, navegación y logo provisional. Todavía no existe interfaz real: no hay componentes ni CSS que escanear. Los valores del frontmatter salen de tokens.json, que es la fuente normativa; si algo de este archivo choca con tokens.json, gana tokens.json. Vuelve a ejecutar /impeccable document en modo escaneo cuando exista código en apps/web y apps/mobile. -->

# Design System: Coach Fitness AI

## Overview

**Creative North Star: "Caucho y acento"**

El piso de goma de un gimnasio y una sola señal de color. La base es neutra y mate: caucho (#1B1E23) en oscuro, tiza (#F3F4F1) en claro, con superficies, bordes y textos también neutros. Sobre ese fondo aparece un único acento, y solo donde hay acción o progreso: el botón principal, los anillos, la selección, la tarjeta destacada y la línea del coach. Así la mirada va directo a lo importante. La propuesta nace de corregir la B, donde el azul se repartía por fondos, tarjetas y datos.

Los datos son los protagonistas: cifras grandes en Archivo condensado con cifras tabulares, gráficos limpios con dos tonos del acento y un gris, y anillos de progreso. La densidad es de herramienta de uso diario con mucho aire: el panel web ordena el día por importancia, sin franja de KPIs, y el móvil apila lo mismo en una columna según el uso. El sistema es plano, minimalista y con claro y oscuro igual de cuidados. El modo de fábrica sigue al sistema del dispositivo.

El movimiento es corto y con propósito: responde al toque en 120 ms, mueve en 200 ms y abre superficies grandes en 320 ms, siempre con curvas que frenan al llegar. Tachar una serie se siente en la mano (háptica) antes de verse. Con "reducir movimiento" activo quedan solo fundidos y la háptica.

El usuario puede cambiar el acento (seis de fábrica o uno propio), el fondo oscuro (caucho, grafito o pizarra) y el modo, o partir de una de ocho plantillas. El color de error y los textos son fijos para que la app siempre se lea bien. El nombre y el logo son provisionales y salen siempre de `packages/brand` (`brand.name` = "Coach Fitness AI", `brand.shortName` = "Coach"), nunca escritos a mano en una pantalla.

**Key Characteristics:**
- Base neutra caucho/tiza más un solo acento en cinco pasos (A1 a A5).
- Acento de fábrica Caribe; modo de fábrica según el sistema; fondo de fábrica caucho.
- Archivo como única familia; cifras en peso 800, ancho 62 y `tnum`.
- Plano: la profundidad se construye con capas tonales (fondo, superficie, elevado), no con sombras; los estados son velos del color de texto.
- Datos con máximo tres series: dos tonos del acento y un gris neutro.
- Contraste AA en claro y oscuro con los seis acentos; foco visible con anillo de acento de 3:1 o más.
- Íconos de trazo de Tabler (outline), trazo 1.75 en 24 px.
- Uso con una mano en el gym y con guantes: objetivos táctiles de 48 px como mínimo y 56 px en el modo gym.
- Cinco pestañas en móvil: Hoy, Gym, Comida, Salud y Coach.

## Colors

Una base neutra que no compite y un acento que solo habla cuando hay algo que hacer o algo que celebrar.

### Primary (acento de fábrica: Caribe, "azul del mar abierto")
- **Caribe A1** (#CFE6F5): serie 1 de datos en modo oscuro; hover y pressed de todo lo que lleva acento en oscuro.
- **Caribe A2** (#7CC0EA): en oscuro, botón principal, progreso, selección, texto de acento y anillo de foco. Lleva texto caucho (#1B1E23) encima.
- **Caribe A3** (#3B95D1): serie 2 de datos en ambos modos; base del fondo suave (al 20 % sobre superficie en oscuro, al 13 % sobre blanco en claro) de la tarjeta destacada.
- **Caribe A4** (#1F6FA8): en claro, botón principal, progreso, selección, texto de acento y anillo de foco. Lleva texto blanco (#FFFFFF). En claro el acento se oscurece un paso para mantener el contraste.
- **Caribe A5** (#154E78): serie 1 de datos en modo claro; hover y pressed de todo lo que lleva acento en claro.

### Acentos alternativos
Mismo papel y mismos pasos que Caribe; cada uno es un tema completo que cambia toda la app, web, Android y reloj.
- **Mar, turquesa de laguna** (A3 #22A99C).
- **Palma, verde de palma** (A3 #2FA866).
- **Mango, ámbar de mango maduro** (A3 #E89A1E).
- **Flamboyán, rojo naranja del flamboyán** (A3 #E8603C).
- **Uva de playa, violeta de la uva de playa** (A3 #8466DB).

Los cinco pasos de cada uno están en el frontmatter. El color propio se genera desde un HEX: se convierte a OKLCH, se sacan A1 a A5 con la misma tonalidad y distinta luminosidad, se verifica 4.5:1 para botón y texto en claro y oscuro (si no pasa, se ajusta la luminosidad lo mínimo), 3:1 del anillo de foco contra fondo, superficie y elevado, y se comprueba que no se confunda con el error.

### Neutral
- **Caucho** (#1B1E23): fondo en oscuro; también texto sobre el botón de acento en oscuro.
- **Superficie caucho** (#23272D): tarjetas, filas y barra de navegación en oscuro.
- **Elevado caucho** (#2D3239): elementos elevados, pistas, chips sin seleccionar, campos, diálogos y esqueletos en oscuro.
- **Borde caucho** (#3A4048): bordes y divisores en oscuro.
- **Texto tiza** (#F3F4F1): texto principal en oscuro (15:1); también fondo de los avisos en oscuro.
- **Texto secundario** (#A3AAB3): etiquetas, detalle y pestañas inactivas en oscuro (7.1:1).
- **Gris de datos oscuro** (#6B737D): tercera serie de los gráficos en oscuro.
- **Tiza** (#F3F4F1): fondo en claro.
- **Superficie blanca** (#FFFFFF): tarjetas, filas, diálogos y barra de navegación en claro.
- **Elevado tiza** (#E9EBE7): elementos elevados, pistas, chips sin seleccionar, campos y esqueletos en claro.
- **Borde tiza** (#DADDD8): bordes y divisores en claro.
- **Texto grafito** (#1E2228): texto principal en claro (14.5:1); también fondo de los avisos en claro.
- **Texto secundario claro** (#5B626B): etiquetas, detalle y pestañas inactivas en claro (5.6:1).
- **Gris de datos claro** (#B5BBC2): tercera serie de los gráficos en claro.
- **Fondos alternos de modo oscuro:** grafito (#202124 / #292A2D / #33353A / #3F4247) y pizarra (#1A2026 / #222A31 / #2B343C / #38434D), en el orden fondo, superficie, elevado, borde. Los textos y el error no cambian con el fondo.

### Capas de estado y velo
- **Capa de hover** (texto del modo al 6 %) y **capa de pressed** (texto del modo al 10 %): velos que se pintan sobre controles neutros (botón secundario, botón de texto, chip sin seleccionar, fila pulsable, pestaña, campo). Aclaran en oscuro y oscurecen en claro sin traer un color nuevo.
- **Velo de diálogo:** caucho al 72 % en oscuro y grafito al 40 % en claro, detrás de diálogos y hojas.

### Error (fijo)
- **Error oscuro** (#FF6B6B, 6.0:1) y **error claro** (#C9333A, 4.7:1). No cambian con el acento ni con el fondo. Como borde de campo con error pasan 3:1 también sobre elevado (4.4:1 y 4.4:1).

### Plantillas sugeridas
Noche de gym (oscuro, caucho, Caribe), Laguna (oscuro, pizarra, Mar), Monte (oscuro, grafito, Palma), Flamboyán (oscuro, caucho, Flamboyán), Tinta (oscuro, grafito, Uva de playa), Amanecer (claro, tiza, Mango), Brisa (claro, tiza, Caribe) y Uva de playa (claro, tiza, Uva de playa). El usuario puede guardar las suyas.

### Named Rules
**The One Accent Rule.** El acento solo en acción y progreso: botón principal, anillos, selección, foco, tarjeta destacada y línea del coach. Todo lo demás es neutro. Si un elemento no se toca ni mide avance, no lleva acento.

**The Step Up Rule.** En hover y pressed, todo lo que lleva acento sube un paso de contraste: A2 pasa a A1 en oscuro y A4 pasa a A5 en claro. Los controles neutros reciben la capa de estado, y un texto secundario sobre elevado pasa a texto principal. Así ningún estado baja de 4.5:1.

**The Three Series Rule.** Máximo tres series por gráfico: en oscuro A1, A3 y gris de datos; en claro A5, A3 y gris de datos. Nunca colores nuevos para distinguir datos.

**The Goal Line Rule.** Una meta (OBJ-03, D-28) se dibuja como línea punteada horizontal de referencia en texto secundario, de 1 px, con su valor en detalle y `tnum` al extremo derecho. Es una referencia, no un dato: no cuenta como serie para la regla de tres series ni lleva acento.

**The Error Has a Voice Rule.** El error es siempre rojo fijo con ícono y texto. El color solo nunca comunica un error, y un acento propio que se parezca al rojo no borra el ícono.

**The Token Only Rule.** Todo componente usa variables (fondo, superficie, acento A1 a A5, datos, capas). Nunca un color suelto; el detector de Impeccable los bloquea.

## Typography

**Display Font:** Archivo (variable: peso 100 a 900, ancho 62 a 125)
**Body Font:** Archivo
**Label/Mono Font:** Archivo (no hay segunda familia)

**Character:** Una sola familia que cambia de voz con sus ejes. Condensada y pesada para las cifras, que se leen de un vistazo entre series; abierta y tranquila para el texto. Licencia SIL Open Font License. La pila de respaldo está pendiente de la Fase 0.5.

### Hierarchy
- **Cifra de descanso** (800, 96px, 88px de interlínea, ancho 62, `tnum`): solo en el modo gym, para la cuenta regresiva del descanso y de las series por tiempo, que se leen desde el banco a un brazo de distancia (D-30). Fuera del modo gym no se usa.
- **Cifra héroe** (800, 56px, 52px de interlínea, ancho 62, `tnum`): el número que manda en la pantalla, como el tiempo total del resumen o un nuevo récord.
- **Cifra métrica** (800, 32px, 32px, ancho 62, `tnum`): peso, calorías, totales de sesión, valores de composición corporal.
- **Título de pantalla** (700, 25px, 30px, ancho 85): uno por pantalla ("Press de banca plano", "Buenos días, Francis").
- **Título de sección** (650, 20px, 26px): encabezado de tarjeta o bloque, título de diálogo y de estado vacío.
- **Cuerpo** (400, 16px, 24px): texto corrido, mensajes del coach, filas de lista, avisos.
- **Detalle** (500, 13px, 18px): etiquetas, unidades, metadatos, estado de sincronización, etiquetas de pestaña. En tipo oración, nunca en mayúsculas.
- **Botón** (650, 15px, 20px): texto de todos los botones; también la etiqueta de la pestaña activa (peso 650 como señal que no depende del color).

### Named Rules
**The Tabular Figures Rule.** Toda cifra que cambia o se compara (peso, reps, kg, kcal, tiempos) usa `tnum` para que no baile al actualizarse.

**The Sentence Case Rule.** Etiquetas, botones y títulos en tipo oración, con tuteo y sin signos de exclamación. Nada de etiquetas en mayúsculas.

**The Plain Voice Rule.** Los textos de interfaz dicen qué pasó y qué puedes hacer, en ese orden y sin culpar: "No se pudo guardar la comida. Revisa la conexión y vuelve a intentarlo". Los botones usan el verbo de la acción ("Guardar plan", "Borrar serie"), nunca "Aceptar" u "OK". Los títulos de confirmación son preguntas ("¿Borrar esta serie?"). Lo que está en curso termina en puntos suspensivos ("Subiendo 3 series…"). La interfaz nunca nombra la infraestructura (Tailscale, Oracle, servidor, VPN): dice "tu conexión".

## Layout

Un solo diseño que se reacomoda con el ancho:

- **1100 px o más:** barra lateral con texto, retícula de 12 columnas. Referencia de escritorio: 1440 px.
- **700 a 1099 px:** rail de íconos, 6 columnas. Referencia de tablet: 834 px.
- **Menos de 700 px y app Android:** navegación inferior, una columna ordenada por uso. Referencia de móvil: 390 px.

### Navegación
Las cinco secciones principales son las mismas en todas las superficies y siempre en este orden: **Hoy, Gym, Comida, Salud, Coach** (decisión de Francis, 18-oct-2026).

- **Móvil y Android:** barra inferior de 64 px más el área segura del sistema, cinco pestañas de igual ancho con ícono de 24 px y etiqueta de detalle. Sin pestaña "Más".
- **Ajustes vive fuera de la barra:** botón de cuenta (círculo de 40 px con la inicial, objetivo táctil de 48 px) arriba a la derecha en la cabecera de Hoy. Abre Ajustes como pantalla apilada con atrás del sistema. En web ancha y en el rail, Ajustes va al pie, junto al estado de sincronización.
- **Rail (700 a 1099 px):** las cinco secciones como íconos con etiqueta corta debajo; el botón de cuenta al pie.
- **Barra lateral (1100 px o más):** las cinco secciones con su nombre; la activa despliega sus subsecciones. Agrupación (aprobada el 18-oct-2026; calendario movido a Gym por D-25): Hoy (panel del día), Gym (sesión, calendario, rutinas, historial, cardio y MTB), Comida (registro, calendario, recetas, alimentos y suplementos; D-35: el plan del coach vive en el calendario), Salud (composición, mediciones, análisis, informes), Coach (chat, memoria). Al pie, Ajustes y el estado de sincronización.
- **Subsecciones en móvil (D-26):** dentro de una sección, las subsecciones van en una fila de pestañas internas bajo la cabecera, con desplazamiento lateral y la activa en texto de acento con subrayado de 2 px. Son las mismas de la barra lateral web. Gym abre en la última subsección usada.
- **Modo gym en sesión:** la sesión ocupa toda la pantalla y oculta la barra. Si sales con atrás, una franja "Sesión en curso · 12:40" sobre la barra te devuelve a ella.
- **Reloj:** sin pestañas. Lista vertical con la sesión de hoy primero; atrás con el gesto del sistema y desplazamiento con el bisel.

**Nota sobre la página 13 del PDF B2.** Los mockups móviles de "Apariencia" y "Color propio" muestran la barra con Hoy, Gym, Comida, Salud y Ajustes, y la barra lateral web lista diez secciones. Esa página es anterior a esta decisión y no es normativa: la quinta pestaña es Coach, Ajustes se abre desde el botón de cuenta y la barra lateral se agrupa en las cinco secciones. Cuando se rehagan los mockups en la Fase 0.5, la página 13 se corrige.

### Objetivos táctiles
Mínimo 48 px (cumple los 44 de RNF-07 y la guía de Android) con 8 px de separación entre objetivos vecinos. En el modo gym, los controles de la sesión (casilla de serie, ajustar peso y reps, atajos del descanso, botón principal) miden 56 px de alto para usarse con guantes o con manos sudadas.

Ritmo de espaciado: 4, 8, 12, 16, 24, 32 y 48 px. Los márgenes de pantalla, los anchos de canal y la asignación exacta de cada paso a cada contexto están pendientes de la Fase 0.5.

En móvil, el inicio se ordena así: entreno de hoy, nutrición del día, lo que dice el coach, suplementos pendientes, tu objetivo, y composición, fuerza y semana. La tarjeta de objetivos (OBJ-01, D-28) muestra el objetivo principal y la próxima meta intermedia con su estado (adelante, en ritmo, atrasado); toda la tarjeta es pulsable y abre la página de Objetivos, apilada dentro de Hoy. No es una sexta pestaña. Su posición exacta se confirma en los mockups del flujo 8. En escritorio, el día va en orden de importancia sin franja de KPIs: el entreno de hoy ocupa el bloque más ancho y las demás tarjetas tienen anchos distintos según su peso.

### Named Rules
**The One Hand Rule.** En el modo gym todo se hace con una mano: objetivos táctiles de 56 px, registrar una serie en 3 toques o menos (RNF-07, O1) y sin gestos finos. Las acciones del modo gym responden en menos de 200 ms; el pressed y la háptica, en el mismo fotograma del toque.

**The Five Tabs Rule.** La barra inferior tiene exactamente cinco pestañas (Hoy, Gym, Comida, Salud, Coach) y nunca cambia de orden. Lo demás vive dentro de una sección o detrás del botón de cuenta.

## Elevation & Depth

El sistema es plano. En los mockups B2 la profundidad se construye con capas tonales: fondo, superficie (tarjetas) y elevado (pistas, controles, chips), más bordes neutros cuando hace falta separar. No hay sombras en la dirección aprobada ni tokens de sombra en tokens.json. La tarjeta destacada se distingue por el fondo suave del acento, no por elevación.

Las superficies que flotan tampoco usan sombra:

- **Diálogo y hoja inferior:** se separan con el velo de diálogo detrás y suben un nivel tonal (elevado en oscuro, superficie blanca en claro).
- **Aviso:** usa la superficie invertida del modo (texto tiza en oscuro, texto grafito en claro), así resalta sobre cualquier contenido sin sombra.
- **Foco:** anillo de 2 px en el color de acción del modo (A2 oscuro, A4 claro), separado 2 px del control, con el radio del control más la separación. Contraste mínimo medido con los seis acentos y los tres fondos oscuros: 5.49:1 en oscuro y 4.28:1 en claro (requisito 3:1).

### Named Rules
**The Tonal Layer Rule.** Para subir un nivel, cambia al siguiente neutro (fondo, superficie, elevado); no agregues sombra. Para separar algo que flota, usa el velo o la superficie invertida.

**The Visible Focus Rule.** Todo lo que se puede enfocar con teclado (web) o mando direccional (Android) muestra el anillo de foco solo con `:focus-visible`, nunca con el toque. El anillo no se quita ni se reemplaza por un cambio de color.

## Shapes

Cuatro radios, cada uno con un papel:

- **Casilla** (6px): casillas de verificación, como las de series y suplementos; bloques de esqueleto.
- **Control** (10px): botones, campos, controles segmentados, filas de serie y avisos.
- **Tarjeta** (16px): tarjetas, contenedores, diálogos y hojas inferiores (solo esquinas superiores).
- **Píldora** (999px): chips de rango ("1 mes", "6 meses", "1 año") y etiquetas de estado ("Programada").

Trazos: borde de 1 px (contornos y divisores) y selección de 2 px (serie actual, tarjeta elegida, campo con error, anillo de foco). Los anillos de progreso son circulares y las barras de progreso, rectas sobre una pista neutra. En listas de nutrientes y en el desglose la barra mide 4 px de alto (finas, porque se repiten muchas); el tramo programado lleva contorno de 1 px.

### Íconos
**Tabler Icons, estilo outline** (v3.49.0, MIT; ADR de íconos). Mismo dibujo en las tres superficies: `@tabler/icons-react` en web, `@tabler/icons-react-native` en Android y los SVG de `@tabler/icons` convertidos a `ImageVector` en el reloj.

- **Trazo:** 1.75 en la retícula de 24, con extremos y uniones redondeados; 2 en el tamaño de 16 para que no se adelgace.
- **Tamaños:** 16 (junto a texto de detalle), 20 (dentro de botones y campos), 24 (estándar, navegación y filas), 32 (modo gym, estados vacíos y reloj).
- **Color:** heredan el color del texto. El acento solo cuando el ícono es acción, progreso o selección.
- **Íconos base:** Hoy `home`, Gym `barbell`, Comida `tools-kitchen-2`, Salud `heart`, Coach `message-circle`; peso `scale-outline`, cardio y MTB `bike`, pulso `heartbeat`, sin conexión `cloud-off`, sincronizado `cloud-check`, error `alert-circle`.

### Logo provisional
El logo provisional es el glifo `barbell` de Tabler dentro de una casilla de radio control, con el glifo en texto principal sobre elevado (neutro, sin acento). Se sirve solo desde `packages/brand` junto con el nombre, y ninguna pantalla importa el ícono suelto para usarlo como logo.

**The Provisional Logo Rule.** El logo se pinta siempre como pieza de marca (casilla más glifo) desde `packages/brand`, a 24 px como mínimo, sin degradados, sombras ni recolor con el acento, y con un margen libre igual a la mitad de su lado. Cuando aparece junto a la pestaña Gym, la casilla es lo que lo distingue del ícono de la pestaña. Cambiar el logo definitivo es cambiar un solo archivo.

## Components

No existen componentes en código todavía. Lo que sigue describe cómo aparecen en los mockups B2 (con Caribe) y las reglas de estado e interacción acordadas el 18-oct-2026. Las medidas internas que no aparecen aquí son de la Fase 0.5.

### Estados interactivos (todas las piezas)
- **Hover:** solo en web con puntero fino (`@media (hover: hover) and (pointer: fine)`). En táctil (Android, web en el teléfono, reloj) no existe y el pressed da la respuesta.
- **Focus-visible:** anillo de foco (ver Elevation & Depth). En el reloj el foco lo maneja el bisel sobre la lista, sin anillo.
- **Pressed:** inmediato, en rapido (120 ms) con curva estándar. En Android se admite el ripple del sistema acotado al control y con el color de la capa de pressed; nunca un ripple sin límites.
- **Disabled:** el control pasa a neutro y baja al 40 % de opacidad, sin hover, pressed ni foco. Evítalo cuando puedas: es mejor un botón activo que explique qué falta al tocarlo.
- **Selected:** relleno de acción con texto sobre acción (chip, casilla, segmento), o borde de acción de 2 px (fila de serie actual, tarjeta elegida), o texto de acento más peso 650 (navegación).

### Buttons
- **Shape:** curvas suaves de control (10px). Alto mínimo 48 px; 56 px en el modo gym.
- **Primary:** en oscuro, fondo A2 con texto caucho; en claro, fondo A4 con texto blanco. Uno por vista ("Empezar sesión", "Guardar plan", "Usar este color"). Hover y pressed: A1 en oscuro, A5 en claro; el pressed además escala a 0.97. Disabled: elevado con texto principal al 40 %.
- **Secondary:** contorno neutro de 1 px en texto secundario, texto principal y fondo transparente ("Cambiar rutina", "Cancelar", "Registrar comida", "Abrir chat"). Hover y pressed: capas de estado.
- **De texto:** sin fondo ni borde, texto de acento ("Ver las 8 plantillas", "Deshacer"). Hover y pressed: capa de estado y el texto sube un paso (A1 o A5).
- **Contraste medido en estados:** texto caucho sobre A1 12.4:1 como mínimo; blanco sobre A5 8.2:1; texto de acento con capa de pressed 4.78:1 (oscuro) y 5.69:1 (claro, A5).

### Chips
- **Style:** píldora (999px), texto de detalle, objetivo táctil de 48 px aunque el dibujo sea más bajo.
- **State:** seleccionado con relleno de acción (A2 oscuro, A4 claro) y texto sobre acción; sin seleccionar sobre elevado con texto secundario. Hover y pressed sin seleccionar: capa de estado y el texto pasa a principal. Las etiquetas de estado ("Programada") usan el mismo molde pero no son pulsables ni tienen estados.

### Cards / Containers
- **Corner Style:** tarjeta (16px).
- **Background:** superficie del modo; la destacada, el fondo suave del acento.
- **Shadow Strategy:** ninguna (ver Elevation & Depth).
- **Border:** sin borde por defecto; divisores internos en el color de borde.
- **Internal Padding:** de la escala de espaciado; el paso exacto está pendiente de la Fase 0.5.
- **Pulsables (tarjetas y filas):** toda la superficie es el objetivo. Hover y pressed con capa de estado, sin escala. Seleccionada: borde de acción de 2 px. Foco: anillo alrededor de toda la tarjeta.

### Inputs / Fields
- **Style:** fondo elevado, radio de control (10px), texto de cuerpo, alto de 48 px. Ejemplos en los mockups: "Buscar alimento", "Código HEX". **Dentro de una hoja en oscuro**, el campo va sobre fondo y no sobre elevado: la hoja ya es elevado y el campo se fundía con ella (aprobado con el prototipo del flujo 5, 27-oct-2026). En claro sigue en elevado sobre la hoja de superficie.
- **Hover:** borde de 1 px en texto secundario. **Focus:** anillo de foco (también con toque, porque abre el teclado y conviene saber dónde se escribe). **Error:** borde de error de 2 px más ícono `alert-circle` y mensaje debajo en detalle, en el color de error. **Disabled:** 40 % de opacidad.
- **Unidad:** dentro del campo, a la derecha, en texto secundario ("lb", "cm", "%", "min"). Sigue a Ajustes → Unidades (SIS-07) y nunca se escribe en el valor. **Excepción, Comida (D-37):** la unidad de un alimento se elige en cada registro con chips debajo del campo, empezando por las porciones caseras con sus gramos ("1 unidad · 50 g") y luego g, oz, lb y kg; ml y L solo si el alimento tiene densidad. Se recuerda la última unidad usada con cada alimento; un alimento sin porción casera ni uso previo arranca en g, la unidad de fábrica de la comida.
- **Botón dentro del campo:** ícono de 24 px en texto secundario sobre un objetivo de 48 px (calendario, mostrar contraseña), con capa de estado y su propia etiqueta accesible.

**The Typed Field Rule.** Un campo solo deja entrar lo que su dato admite, mientras escribes y al pegar. No se espera al botón de seguir para descubrir una letra en una estatura (feedback de Francis al probar el flujo 10, 18-oct-2026). Los errores de rango (una fecha que no existe, una edad fuera de 14 a 100) se dicen en cuanto el valor está completo, con el estilo de error de siempre.

- **Números:** solo dígitos y, si la magnitud lo admite, un separador decimal; un segundo separador o una letra no entran. Se acepta coma o punto y se muestra punto (Archivo con `tnum`). Decimales por magnitud: uno en kg, lb, cm, pulgadas y %; dos en metros; ninguno en pies, días, repeticiones, minutos y kcal. En cantidades de comida (D-37): g y ml enteros; oz con uno; lb, kg y L con dos; porción casera con uno y atajos ¼, ½ y ¾ en chips junto al campo. Sin separador de miles mientras se escribe. Teclado `inputmode="decimal"` si admite decimales y `numeric` si no; en Android, el teclado numérico equivalente.
- **Fechas:** máscara dd/mm/aaaa. Solo entran dígitos y las barras se ponen solas (27071996 → 27/07/1996); borrar sobre una barra borra el dígito anterior; al pegar quedan solo los dígitos, ocho como máximo. Nunca el selector nativo del navegador. Al lado, un botón con el ícono `calendar` abre el selector propio: hoja inferior en el teléfono y diálogo en la web, con tokens, Archivo y `tnum`, navegable con flechas, Re Pág y Av Pág, y Escape cierra y devuelve el foco al botón. Abre en la vista que pide la fecha: una fecha lejana (nacimiento) abre en años, por décadas, luego meses y días; una fecha cercana (una sesión, una cita, la fecha de una meta) abre directo en el mes. Lo que queda fuera del rango del campo se ve deshabilitado. El día seleccionado lleva el relleno de acción; la semana empieza en lunes.
- **Horas:** máscara hh:mm; los dos puntos se ponen solos. Sigue el formato del sistema, como el modo: con 12 h, un botón de texto "a. m." o "p. m." dentro del campo cambia la mitad del día (de 1:00 a 12:59); con 24 h no aparece (de 0:00 a 23:59). La app muestra todas las horas en ese mismo formato ("8:00 a. m." o "08:00").

### Navigation
- **Móvil y Android:** barra inferior en superficie con borde superior de 1 px, cinco pestañas (Hoy, Gym, Comida, Salud, Coach). Inactiva: ícono y etiqueta en texto secundario. Activa: ícono y etiqueta en texto de acento con la etiqueta en peso 650 y `aria-current="page"`. Pressed: capa de estado en un óvalo detrás del ícono. Tocar la pestaña activa vuelve al inicio de la sección.
- **Tablet:** rail de íconos con las mismas cinco secciones y el botón de cuenta al pie.
- **Escritorio:** barra lateral con logo y nombre desde `packages/brand`, las cinco secciones con sus subsecciones, Ajustes y el estado de sincronización al pie. El activo va sobre fondo elevado con texto de acento sobre elevado (`textoAcentoSobreElevado`: A5 en claro, A2 en oscuro), porque A4 sobre elevado se queda en 4.28 a 4.49:1.

### Fila de serie (modo gym)
La pieza central de GYM-04. Cada serie es una fila de 56 px con casilla, nombre ("Rampa 1 · 50 %", "Trabajo 2") y la carga en cifras condensadas ("40 × 10"). La serie actual lleva borde de acción de 2 px; las hechas llevan la casilla llena de acción con `check`. Tocar la fila o la casilla tacha la serie: háptica de impacto medio en el mismo fotograma, casilla llena en 120 ms y aviso "Serie guardada" con "Deshacer" en la ranura de avisos, encima del botón grande. Debajo, el temporizador de descanso en cifra de descanso (96 px) con barra de progreso y los atajos "−15 s", "Saltar" y "+15 s", de 56 px. Durante el descanso, la tarjeta destacada "Sigue" (fondo suave del acento) dice qué viene: serie, ejercicio en título de sección y carga en cifra métrica.

### Estado de sincronización (modo gym)
Una línea en detalle con ícono de 16 px en la cabecera de la sesión, nunca un diálogo:
- **Sincronizado:** `cloud-check` y "Sincronizado", en texto secundario.
- **Sin conexión:** `cloud-off` y "Sin conexión · 3 por subir", en texto secundario. No es un error: el modo gym está hecho para funcionar así.
- **Subiendo:** `refresh` girando y "Subiendo 3 series…".
- **Falló:** `alert-circle` y "No se pudieron subir 3 series" en color de error, con el botón de texto "Reintentar". Los datos siguen guardados en el teléfono y se dice.

En el reloj, el estado es un ícono de 16 px junto a la hora (TimeText) y solo aparece si hay pendientes o si falló.

### Línea del coach
Tarjeta neutra (superficie) con una cabecera de ícono `message-circle` de 16 px y etiqueta "Coach" en detalle, ambos en texto de acento, y el mensaje en cuerpo y texto principal. Si la tarjeta reúne varios consejos, cada uno lleva su tema como etiqueta de acento ("Nutrición", "Recuperación") y las alertas usan el color de error con su ícono, como en el panel web del PDF B2 (página 10). Es el único lugar donde el coach toma el acento.

**Cambio respecto a los mockups móviles (aprobado por Francis el 18-oct-2026):** los mockups móviles del PDF (por ejemplo, la página 6) dibujan la línea del coach como una barra vertical de acento pegada al borde izquierdo de la tarjeta. El detector de Impeccable marca ese recurso como "side-tab", uno de los rasgos más reconocibles de interfaz hecha con IA, y el panel web del mismo PDF ya resuelve al coach sin barra. Se unifica con la versión web: etiqueta e ícono de acento, sin franja lateral.

**Mientras piensa:** la tarjeta aparece de inmediato con el ícono del coach en pulso de opacidad (1600 ms) y una línea en detalle que dice qué está consultando ("Revisando tus sesiones de la última semana…", "Leyendo tu registro de comidas…"), tomada de las herramientas que usa. La respuesta llega por partes en la misma tarjeta. Junto al campo del chat, el botón de enviar se convierte en "Detener". Nada de tres puntos saltando. Con reducir movimiento, el ícono queda fijo y solo cambia el texto.

### Anillos y barras de progreso
Pista en elevado y relleno en acción. Las barras de macros usan las tres series de datos. En los mockups el anillo muestra el avance del día (calorías) y la vista previa del tema. El avance se anima en normal (200 ms) con curva estándar; con reducir movimiento salta al valor.

### Registro de comida y desglose (Comida, D-37)
- **Lo programado:** una comida o un suplemento programado se ve en contorno (contorno = programado), como en el calendario de Gym, con sus alimentos. Nunca se tacha y no hay botón "Lo comí": cada alimento lleva una X para quitarlo (sin confirmación, aviso "Alimento quitado · Deshacer") y se toca para editar en la misma hoja de cantidad. Cuando lo programado empieza a contar (al pasar su hora habitual), deja el contorno y se ve como lo comido.
- **Barra con lo pendiente:** en hoy, la barra de kcal y macros muestra lo comido en relleno de datos y lo programado pendiente como tramo en contorno a continuación, con la línea en detalle "Con lo programado: 2,180" y `tnum`.
- **Restan:** empieza en el objetivo y baja al comer. En kcal, carbohidratos y grasa, al pasarse muestra el negativo ("−184") en texto principal, nunca en rojo, porque pasarse no es un error (el rojo queda para errores, The Error Has a Voice Rule). El ícono `alert-triangle` de 16 px en texto secundario solo aparece si el exceso supera el 5 % del objetivo de ese día (340 de 339 g de carbohidratos es "−1" sin ícono; 3,134 de 2,950 kcal es "−184" con ícono, porque pasa de 147.5). Proteína y fibra, igual que un micro, dicen "Cumplido" con ícono `check` al llegar o pasarse: nunca negativo ni advertencia; mientras no llegas, se ve lo que resta (reglas de coach aprobadas por Francis, 26-oct-2026).
- **Límites:** sodio, azúcar añadida y grasa saturada dicen en Objetivo "hasta 2,300 mg" y la barra lleva una marca vertical de 1 px en el límite, en texto secundario. Al pasarse, el mismo estilo neutro con `alert-triangle`, siempre: los límites no tienen tolerancia.
- **Topes máximos seguros (UL):** al llegar al 80 % del tope, una línea en detalle bajo el nutriente ("Cerca del tope seguro: 280 de 350 mg") con `alert-triangle`; al pasarlo, "Pasaste el tope seguro". Mismo estilo neutro; el coach puede comentarlo en su línea.
- **Origen del objetivo:** el día de un paseo, el Objetivo de kcal lleva debajo en detalle "2,350 + 600 del paseo". Si falta un dato opcional, una línea en detalle "Faltan datos de 1 alimento" que lleva al alimento.
- **Dónde vive:** en el móvil, el resumen (kcal y 3 macros con Total, Objetivo y Restan) va arriba del registro del día, debajo las comidas, luego el bloque "Suplementos" y al final el botón de texto "Ver todos los nutrientes", que abre la pantalla completa. En la web ancha, dos columnas: comidas a la izquierda y desglose fijo a la derecha. Hoy lleva la tarjeta "Nutrición de hoy" (flujo 8).
- **Armar el plato:** un alimento a la vez en una hoja de cantidad (campo, macros en vivo y "Agregar" arriba; unidad y Crudo · Cocido debajo) con "Agregar" (botón principal) que vuelve a la búsqueda; barra fija al pie con el total de la comida en `tnum` y "Listo". "Crear alimento" siempre a mano: en la búsqueda como botón secundario; en el día del teléfono, dentro del menú del botón flotante.
- **Botón flotante del día (móvil):** en Comida › Día no hay barra fija de botones al pie. Un botón redondo de 56 px con `plus`, relleno de acción y texto de acción, anillo de 2 px del color de fondo (separa sin sombra), abajo a la derecha encima de la barra de navegación y del área segura. Al tocarlo gira a × y abre un menú en una caja de hoja sobre el velo: primero "Agregar al almuerzo" (la comida sale de la hora) y luego "Crear alimento" (`pencil`). Tocar fuera, × o Escape lo cierran y el foco vuelve al botón; `aria-expanded`, `role="menu"` y flechas para recorrerlo. Se oculta mientras hay una hoja abierta o la búsqueda está abierta. El + flota solo, sin franja ni rectángulo al pie: mientras desplazas puede tapar datos de la lista, como cualquier botón flotante (aceptado a sabiendas), pero nunca al final, porque el contenido del día termina con un margen inferior de 72 px (el alto del + más 16 px), y así la última cifra de la última comida y la línea de cierre quedan encima del botón. La línea de cierre va al final de todo el día, después de Suplementos y de "Ver todos los nutrientes": lo que resta en texto de detalle y `tnum` ("Restan 811 de 2,350 kcal"; al pasarse, "184 kcal sobre 2,950"), y se actualiza con cada cambio. Cada comida conserva su "Agregar". Cambio pedido por Francis al probar el prototipo del flujo 5 en Android, 27-oct-2026: reemplaza la franja al pie aprobada con el prototipo del flujo 4. Excepción aprobada: en las láminas, el detector de Impeccable marca "text-occlusion" del + sobre la lista; no se corrige (el resto de hallazgos sigue en cero). En la web no hay botón flotante: los dos botones van en la cabecera (feedback de Francis al probar el prototipo del flujo 3 en Android, 26-oct-2026).
- **Formulario de alimento nuevo:** botón de cámara "Leer la etiqueta" (`camera`), botón de código de barras (`barcode`) dibujado pero deshabilitado hasta después de la v1.0 y selector "Crudo · Cocido" en chips. Tras leer la etiqueta, los obligatorios que falten (porción en g, kcal, proteína, carbohidratos y grasa) llevan el estilo de error de siempre (borde de 2 px, `alert-circle` y "Falta este dato") y el botón de guardar no avanza sin ellos; los opcionales no leídos dicen "sin dato" en texto secundario, nunca 0.
- **Lista de evitar:** al marcar "Evitar" desde un alimento, una hoja ofrece "Solo camarones" o "Todo el grupo Mariscos" (el grupo, marcado de fábrica) y el motivo en chips (Gusto, Alergia, Intolerancia). Un resultado de la lista de evitar no se oculta; lleva la etiqueta de estado "En tu lista de evitar". En Comida › Alimentos, cada elemento de la lista dice su motivo en la etiqueta ("Evitar · gusto", "Evitar · alergia"); una receta con un ingrediente de evitar por alergia o intolerancia lleva la etiqueta "Contiene maní · alergia" con `alert-triangle` de 16 px en texto secundario, nunca en rojo (D-38).

### Calendario y recetas (Comida, D-38)
- **Marcas de la vista de mes:** punto lleno de acento = día con registro (algo comido o que ya cuenta); contorno de acento = día solo programado; día libre sin marca. Sin cifras en la celda. Hoy, como en Gym: número en texto de acento y peso 650, sin contorno de día. Las mismas marcas sirven en claro y oscuro y con los seis acentos, porque se distinguen por forma (lleno frente a contorno), no solo por color.
- **Vista semana:** cada día en una fila de 56 px con sus kcal ("2,336 de 2,350") en `tnum` y detalle; un día con plan de mes muestra en la cabecera de la semana "Semana tipo 1" o "Semana tipo 2" en detalle, sin marca nueva por día. "Copiar la semana anterior" pasa a botón principal cuando la semana está vacía; "Pedir un plan al coach" es secundario y abre el chat con el rango elegido. Cada día dice lo que ya tiene en Gym y Salud ("Día A en Gym", "Análisis de sangre 7:30 a. m."), para planear alrededor. Sin conexión, "Pedir un plan al coach" sigue activo y, al tocarlo, explica en un aviso que necesita conexión (aprobado con la guía del flujo 4, 26-oct-2026).
- **Copiar:** sin diálogo; termina en el aviso "Semana copiada: 31 comidas · 4 se respetaron · Deshacer". Las comidas que ya tenían algo, y en hoy las que ya pasaron su hora, no se tocan. El aviso no cuenta la comida saltada por la hora: se ve vacía en el día ("Día copiado: 1 comida · 3 se respetaron").
- **Editor de receta:** nombre, lista de ingredientes (cada uno con su cantidad y chips "Crudo · Cocido", "Crudo" de fábrica), campo "Porciones" con − y + (1 a 20) y el resumen "Por porción" en `tnum` (kcal y P · C · G) junto al total. Al editar una receta ya usada, una línea en detalle "Usada en 12 comidas: los días pasados no cambian" y, además de "Guardar", el botón secundario "Guardar como receta nueva". Las versiones no se muestran.
- **Calendario web:** al tocar un día del mes, un panel a la derecha muestra lo programado con "Abrir el día" y "Copiar este día", como el panel del día de Gym; se planea sin salir del mes.
- **Copiar desde un día:** en el teléfono, un día futuro lleva "Copiar este día" como botón secundario arriba de las comidas (el + sigue siendo para agregar). La hoja de copiar pone "Hoy" primero y el mes marca en contorno los días que ya tienen plan; elegir uno solo llena sus comidas vacías.
- **Preferidos:** se quitan con la X, sin confirmación; aviso "Pollo quitado de preferidos · Deshacer".
- **Agregar una receta a una comida:** la misma hoja de cantidad del flujo 3, solo con porciones: chips "1 porción", ¼, ½, ¾, "1.5", "2" y campo con un decimal; sin g ni Crudo · Cocido. Una receta de 1 porción (combo) se agrega con un toque desde recientes, como un alimento.

### Comidas del día (Ajustes, NUT-02)
Pantalla de Ajustes (en el teléfono, apilada desde el botón de cuenta de Hoy; en la web, subsección de Ajustes al pie de la barra lateral).

- **Lista:** una sola superficie con divisores. Cada fila de 56 px lleva el nombre y, debajo en detalle con `tnum`, la hora habitual ("7:30 p. m."); a la derecha, botones de ícono `arrow-up` y `arrow-down` de 48 px con nombre accesible ("Subir cena"); el primero no sube y el último no baja (inactivos). No se arrastra. Encima, una frase explica que el orden es el de Comida y que la hora habitual decide qué comida queda elegida y cuándo empieza a contar lo programado.
- **Orden y horas:** si el orden deja de seguir las horas, una línea en detalle lo dice con el botón de texto "Ordenar por hora". Una comida nueva entra en su lugar por la hora.
- **Editar o agregar:** al tocar una fila, una hoja (en la web, el panel derecho) con Nombre (hasta 24 letras, sin repetir) y Hora habitual con máscara hh:mm (1:00 a 12:59) y el segmento "a. m. · p. m." (The Typed Field Rule); "Guardar" o "Agregar comida", y al final el botón de texto "Quitar cena" con `trash`. De 1 a 8 comidas: con una sola, Quitar queda inactivo y una línea lo explica.
- **Quitar con algo programado:** una hoja dice cuántas comidas programadas tiene y en qué fechas ("La cena tiene 26 comidas programadas, del 26 de octubre al 22 de noviembre. Los días pasados no cambian.") y ofrece "Moverlas a otra comida" (con la comida anterior marcada en chips) o "Quitarlas". Termina en el aviso "Cena quitada · 26 comidas movidas a merienda · Deshacer". Hoy y los días pasados conservan la comida quitada con la etiqueta "Quitada". Sin nada programado, se quita al instante con el aviso y Deshacer.
- **Efecto:** Comida usa los nombres, el orden y las horas al momento; la hora decide la comida elegida al abrir y cuándo cuenta lo programado de hoy.

### Paseo MTB y Cardio y MTB (Gym, D-39)
- **Tarjeta del paseo (propuesta del coach en el chat):** una sola línea del coach con divisores, nunca tarjeta dentro de tarjeta. Arriba, la fecha como botón de 48 px con detalle "Fecha · leída de la captura" y `pencil`; luego la distancia en cifra héroe (56 px) con su unidad en título de sección secundario; debajo, las demás cifras en dos columnas (tres en la web) como botones de 48 px: etiqueta en detalle y cifra métrica de 25 px con `tnum`. La velocidad media y los minutos por zona son calculados: no son botones y la velocidad lleva "calculada" en detalle. Lo que falta dice "sin dato" en texto secundario, nunca 0. Una lectura dudosa lleva `alert-triangle` de 16 px junto a la cifra y "Revisa este dato" en detalle 650 y texto principal, sin rojo. Antes de los botones, una nota con `info-circle` dice cuánto sube el objetivo ("Al guardarlo, tu objetivo de hoy sube a 2,670 kcal: 2,350 + 320, la mitad de las 640 del paseo") o que no sube sin kcal. Botones: "Guardar paseo" (principal) y "Descartar" (texto, aviso con Deshacer). Tras guardar, la tarjeta se reduce a la constancia "Paseo guardado · 18.4 km · 52 min" con `check` y "Ver paseo". Duplicado: la línea "Ya registraste este paseo el sábado 17" arriba, con `alert-triangle`, y los botones apilados "Descartar" (principal) y "Guardar de todas formas" (secundario). En la web, cifras a la izquierda y zonas a la derecha.
- **Hoja de una cifra:** hoja inferior con título de sección, una línea de detalle con lo leído, el campo tipado con su unidad (The Typed Field Rule) y los botones "Sin dato" (texto, solo en los datos opcionales) y "Guardar". La fecha usa su hoja con máscara dd/mm/aaaa, selector propio y "Cancelar" en lugar de "Sin dato".
- **Zonas de FC:** filas de 24 px de alto mínimo, de Z5 a Z1: zona en 650 con su rango en ppm en detalle, barra de 8 px con pista en elevado y relleno en la serie de datos 1 (A5 en claro, A1 en oscuro), y a la derecha el % en 650 con los minutos debajo en detalle. Una sola serie: el color no distingue zonas, lo hace la etiqueta.
- **Capturas:** miniaturas de 48 × 72 px con radio de casilla; se tocan para verlas a pantalla completa.
- **Gym › Cardio y MTB:** arriba, "Registrar paseo" (principal, `photo`) y "Registrar a mano" (secundario, `pencil`) apilados en el teléfono y en la cabecera en la web. La lista va por semana: cabecera en detalle ("Semana 2 · 12 – 18 oct.") con los totales en cuerpo 650 y `tnum` ("18.4 km · 52 min · 240 m") y, debajo, una superficie con divisores donde cada paseo lleva el día, el detalle (tiempo, velocidad, kcal) y los km en cifra de 20 px. Una semana sin paseos dice "Sin paseos esta semana". Primera vez: estado vacío con `bike`, "Todavía no registras paseos" y las dos formas de registrar. En la web, lista en 5 columnas y detalle en 7, con el paseo elegido en contorno de acción de 2 px.
- **Detalle del paseo:** cabecera con atrás, fecha en título de pantalla, línea de estado con `bike` (hora de inicio, tiempo total, app de origen) y, a la derecha, "Editar" (`pencil`) y "Borrar" (`trash`) como botones de ícono de 48 px (de texto con ícono en la web). Tarjetas: cifras, zonas (o el estado vacío "Sin zonas de FC" con "Agregar captura de zonas"), ruta (o "Sin ruta" con "Agregar ruta GPX", `route`) y capturas. Borrar no pide confirmación: aviso "Paseo borrado. El sábado 17 vuelve a 2,350 kcal." con Deshacer.
- **Ruta y perfil de desnivel:** la ruta es una línea de 3 px en la serie de datos 1 con un círculo de inicio en contorno y uno de fin relleno, sin mapa de calles ni teselas. Debajo, el perfil de desnivel: línea de 2 px en la misma serie sobre un eje base de 1 px en borde, una guía discontinua en la altitud máxima y solo cuatro rótulos en detalle con `tnum` (altitud mínima y máxima, 0 y la distancia total). Sin relleno ni degradado bajo la línea. En la web, ruta y perfil lado a lado.
- **El coach está en pausa:** cuando se agotan los créditos de la API, la app (no el coach) lo dice en una tarjeta neutra de superficie: título de sección "El coach está en pausa", una frase con la fecha de vuelta y la acción que sigue funcionando ("Registrar a mano"). Sin acento de coach ni rojo: no es un error del usuario.
- **Capturas sin conexión:** en el teléfono, el mensaje se envía igual y debajo dice "En cola · se leen al volver la conexión" con `clock`; al leerlas llega el aviso "Tu paseo está listo para confirmar" con "Revisar", también fuera del chat. En la web sin conexión, "Registrar paseo" sigue activo y da el aviso "Leer capturas necesita conexión" con "Registrar a mano".
- **Zona para soltar (web):** al arrastrar archivos sobre la columna del chat aparece un área con fondo suave del acento, contorno discontinuo de 2 px en acción hacia dentro (outline, no borde), ícono `photo` de 32 px, "Suelta las capturas aquí" en título de sección y el detalle en texto principal (el secundario baja de 4.5:1 sobre el suave en oscuro).
- **Recuperación (CAR-02):** una línea del coach con el tema "Recuperación" en Hoy y encima de la sesión de Gym del día afectado. Propone y nunca cambia solo: "Bajar la carga" (principal), "Mover al jueves" (secundario, solo en Hoy) y "Dejar como está" (texto). Aplicar termina en un aviso con Deshacer y el coach lo confirma en su línea; en la sesión, los ejercicios de pierna llevan "pierna" en detalle 650 a la derecha.
- **Comida el día del paseo:** el objetivo de kcal lleva debajo "2,350 + 320 del paseo" con `bike` (regla de D-37) y la línea de cierre del día resta sobre el objetivo del día ("Restan 2,045 de 2,670 kcal"), sin franja junto al + (cambio pedido por Francis al probar el prototipo del flujo 5 en Android, 27-oct-2026).

### Salud: composición y mediciones (D-40)
- **Pestañas internas:** Salud tiene Composición, Mediciones, Análisis e Informes, con las mismas pestañas internas que Gym en el teléfono y como subsecciones de Salud en la barra lateral web. Abre en Composición.
- **Peso del día (Composición):** superficie con radio de tarjeta que se toca entera (abre los pesajes): "Peso de hoy · 6:44 a. m." en detalle, la cifra héroe (56 px) con "lb" en título de sección secundario, "Media de 7 días: 172.5 lb · −0.6 lb desde el 17-oct" en detalle (hasta tener 4 semanas de pesajes, el cambio es desde el primer pesaje; con un solo pesaje reciente: "Pésate cada mañana para ver tu media de 7 días") y, si hay meta, la línea de meta. Antes del primer sync del día dice "Último peso · martes 27".
- **Línea de meta:** ícono `target` de 16 px en texto de acento, texto en detalle 650 y texto principal con `tnum` ("Hacia tu meta de 88 cm: faltan 2.5", "Te alejas de tu meta de 88 cm", "Meta 167.6 lb (76 kg): faltan 4.6"). Sin verde ni rojo.
- **Línea del sync de Renpho:** detalle en texto secundario con `cloud-check` ("Renpho · sincronizado a las 7:05 a. m."), `alert-circle` si falla y `cloud-off` sin conexión; a la derecha, "Sincronizar ahora" como botón de texto. Renpho sincroniza cada noche y con ese botón; abrir la app no sincroniza. Mientras sincroniza, el botón pasa a "Sincronizando" con el indicador de 16 px y lo que ya hay sigue a la vista; el esqueleto solo aparece al traer el historial la primera vez.
- **Fallo del sync (2 días):** una lista con una fila de `alert-triangle` y la frase "Renpho no sincroniza desde el lunes 26…", y al pie "Registrar a mano" e "Importar CSV" como botones de texto con ícono. Va arriba de Salud y de Hoy, sin rojo. Un fallo al tocar "Sincronizar ahora" es solo el aviso "No pude conectar con Renpho." con Reintentar.
- **Recordatorio de la cinta:** una línea (no una tarjeta) con `ruler` de 20 px en texto de acento y cuerpo de 15 px: "Toca la cinta: la última fue el 17-abr.". Aparece a las 4 semanas de la última cinta; al registrar, Mediciones dice "Próxima cinta: …" con `calendar`.
- **Pesajes:** lista por día; el primero de la mañana lleva la etiqueta "Peso del día" en detalle 650 y texto principal; uno fuera de la cuenta queda en texto secundario con "No cuenta". En el detalle, los campos de Renpho sin editar y "No contar" (secundario, `ban`) o "Volver a contar" (`check`); el aviso confirma con Deshacer.
- **Fila de medida (registro con cinta):** fila de 64 px en una superficie con divisores: nombre en cuerpo con el botón `info-circle` de 40 px (48 px de área), debajo "Último: 91 cm · 17-abr" o "Primera vez" en detalle, y a la derecha el campo de 112 px con su unidad (un decimal en cm y lb, enteros en mm). Con el lado izquierdo activo, dos campos de 84 px marcados D e I. "Revisa este dato: 4 cm más" va debajo con `alert-triangle` de 16 px en detalle 650 y texto principal. Cintura va sola arriba, las recomendadas a la vista y "Más medidas" como fila desplegable con su detalle y `chevron-down`/`chevron-up`; dentro, el interruptor "Medir también el lado izquierdo" y el subgrupo "Pliegues · mm".
- **Interruptor:** 52 × 32 px; apagado, pista en elevado con contorno de 2 px en texto secundario y perilla de 16 px; encendido, pista en acción y perilla de 24 px en texto sobre acción. Toda la fila es el objetivo táctil.
- **Hoja "Cómo medir" (ADR 0026):** hoja inferior con "Cómo medir la cintura" en título de sección, el dibujo de 208 px centrado en un área de 220 px, la instrucción en cuerpo de 16 px, la nota del protocolo con `info-circle` y "Cerrar" (secundario, a todo el ancho). En la web, el mismo contenido es un panel a la derecha del formulario que sigue al campo enfocado; esa fila lleva contorno de acción de 2 px.
- **Resumen al guardar:** pantalla completa con "Medición guardada" y "Listo" al pie. Cada medida en una fila con su cifra (20 px) y el cambio en detalle ("−0.5 cm desde el 17-abr", "Igual que el 17-abr", "Primera vez"); la meta en su propia fila. Debajo, "Medidas calculadas" con su referencia en detalle y "% de grasa" en dos columnas iguales con divisor (Marina "segunda opinión" y Renpho, cifra de 32 px) y la nota "Son métodos distintos…". Si falta un dato, una fila con `info-circle` dice cuál ("Falta el cuello para el % de grasa de la Marina"). Una medición pasada calcula con los datos de ese día.
- **Historial de una medida:** cabecera con atrás y `info-circle` (abre "Cómo medir"), cifra héroe con el lugar ("28-oct · en el ombligo"), cambio y meta; un gráfico de una serie en dato 1 (línea de 2 px, puntos de 10 px con anillo de superficie) con la meta como línea punteada (The Goal Line Rule) y solo tres rótulos de eje; debajo, el historial por fecha como vista en tabla.
- **Gráfico de peso (web):** una sola serie de color con dos marcas, puntos huecos para los pesajes de la mañana y línea para la media de 7 días, con leyenda. La meta se dibuja solo si cae dentro del rango visible; si no, va en la línea de meta, sin estirar el eje.
- **Teclado:** numérico con punto decimal y borrar; en el teléfono tapa la barra inferior y el contenido se desplaza para dejar "Guardar" a la vista.
- **Conectar Renpho:** Ajustes › Conexiones (o la bienvenida): correo y contraseña de Renpho y la nota con `lock` sobre dónde se guardan. Primera vez en Salud: estado vacío con `scale`, "Todavía no hay pesajes", "Conectar Renpho" (principal) y "Registrar peso".
- **Importar CSV:** hoja con el archivo elegido (nombre, cuántos pesajes y de qué fechas) y una línea con `check` que dice cuántos son nuevos; "Importar 2 pesajes" (principal) y "Cancelar".
- **Sin conexión:** en el teléfono la cinta y el peso a mano se guardan igual y el resumen lo dice con `cloud-off` ("Guardada en el teléfono · se sube al volver la conexión"); "Sincronizar ahora" da el aviso "Sincronizar necesita conexión.". En la web, el formulario conserva lo escrito y "Guardar" da "Guardar necesita conexión." con Reintentar.
- **Web:** Composición en 7 + 5 columnas (peso y gráfico; sync, recordatorio y campos de Renpho), con "Registrar medición" y "Registrar peso" en la cabecera. Mediciones en 5 + 7 (lista y calculadas; la medida elegida con su gráfico). "Registrar medición" es una página: formulario en 7 columnas y panel "Cómo medir" en 5. El resumen va en dos columnas: cambios y calculadas.

### Revisión de propuesta (flujos 4 y 7, D-38)
Un borrador grande del coach (plan de comidas de día, semana o mes; rutina o bloque de sesiones) se revisa en una pantalla propia, no en un diálogo de 400 px. Es un solo componente para los flujos 4 y 7.

- **Dónde:** en el teléfono, pantalla apilada a todo el alto con atrás del sistema, abierta desde la tarjeta de la propuesta en el chat o desde el aviso "Tu plan está listo para revisar". En la web ancha, en la columna principal con el resumen del día elegido fijo a la derecha, como el desglose de Comida.
- **Cabecera:** título con el alcance ("Plan del 26 de octubre al 22 de noviembre"), las condiciones del pedido en detalle ("Con pollo y piña, sin mariscos") y, si aplica, una línea del coach con lo que conviene saber ("Tu revisión es el 16 de noviembre; el coach ajustará desde ahí", "Planes con Sonnet hasta el 1 de noviembre"). El aviso del modo reducido se repite aquí aunque ya salió en el chat, porque se puede llegar desde el aviso "Tu plan está listo" sin pasar por el chat.
- **Navegación:** un plan de mes abre con un control segmentado "Semana tipo 1 · Semana tipo 2" y, debajo, la cuenta de esa semana tipo ("Semana tipo 1: 31 de 35 comidas"); luego una tira de los 7 días (chips con la inicial y el número, el elegido en relleno de acción). En el teléfono se revisa un día a la vez. Un plan de día no lleva tira.
- **Día:** arriba, kcal y macros del día propuesto contra el objetivo (mismas columnas Total, Objetivo y Restan del flujo 3; en el teléfono 48, 58 y 76 px para que "Carbohidratos g" quepa en una línea). Debajo, cada comida como fila con casilla (marcada de fábrica, objetivo de 48 px), nombre y hora, kcal y P · C · G en `tnum`, y sus alimentos; a la derecha, el botón de texto "Otra opción" (`refresh`). Una comida desmarcada pasa a texto secundario, pliega sus alimentos y dice "No se guarda". Las comidas no son tarjetas idénticas: una sola superficie por día con divisores. En la web, la semana tipo va en 7 columnas: cada comida muestra nombre, hora y kcal sin sus alimentos, y al tocarla se despliega en su columna con "Otra opción"; el total de cada columna cuenta solo lo marcado y baja al desmarcar (aprobado con los mockups del flujo 4, 26-oct-2026).
- **Suplementos:** bloque al final de cada día con las tomas que ubica el plan, sin casilla: se aprueban con su día y una toma se quita después con la X; al tocar una, una línea explica "Las pautas se cambian en Comida › Suplementos".
- **Otra opción:** la fila se queda en su sitio con esqueleto tras 300 ms y la línea "Buscando otra opción…"; la nueva comida entra con un fundido normal (200 ms). Con reducir movimiento, cambia sin fundido.
- **Pie fijo:** botón principal que cuenta lo que se guarda en todos los días del plan ("Aprobar 132 de 140 comidas" en un mes; "Aprobar 31 de 35 comidas" en una semana; con todo marcado, "Aprobar todo") y, debajo, el botón de texto "Descartar" (apilados en el teléfono para que el contador quepa en una línea). El contador se anuncia con `aria-live="polite"`. Aprobar termina en el aviso "Plan guardado: 31 comidas · Deshacer"; descartar, en "Plan descartado · Deshacer". Ninguno pide confirmación porque los dos se deshacen.
- **Mientras se genera:** la tarjeta "Mientras piensa" del coach con pasos reales ("Revisando tus entrenos del 26 de octubre al 22 de noviembre…", "Armando la semana tipo 1 de 2…"). Se puede salir; al terminar llega el aviso "Tu plan está listo para revisar · Revisar".

### Diálogos
- **Anatomía:** velo de diálogo; caja en elevado (oscuro) o superficie (claro), radio de tarjeta, relleno de 24 px, ancho máximo de 400 px; título de sección como pregunta, una o dos frases de cuerpo, y los botones abajo a la derecha (web) o apilados a todo el ancho (móvil), con la acción a la derecha o arriba.
- **Cuándo:** solo para confirmar algo que no se puede deshacer (borrar una rutina, descartar una sesión) o para aprobar un borrador corto del coach (una comida, un cambio de pauta). Un plan o una rutina van a la revisión de propuesta (D-38). Lo que se puede deshacer no pide confirmación: se hace y se ofrece "Deshacer" en un aviso.
- **Botones:** el verbo de la acción ("Borrar rutina") y "Cancelar". Si la acción destruye datos, el botón va con fondo de error y texto caucho en oscuro (6.0:1) o blanco en claro (5.2:1), y nunca es el foco inicial; el foco inicial es "Cancelar".
- **Movimiento:** entra en lento (320 ms) con curva de entrada (fundido más subida de 8 px); sale en normal (200 ms) con curva de salida. En móvil, las opciones largas van en hoja inferior.
- **Hoja inferior con campos (teclado):** no se depende de detectar el teclado (dentro de un iframe, como en claude.ai, el navegador no lo informa). En el teléfono, al tocar un campo de una hoja (cantidad, hora), la hoja se ancla arriba a pantalla completa, bajo la barra de estado, con una subida corta; así el teclado solo tapa la parte baja. Se queda arriba hasta cerrarse (ocupa todo el alto: sin huecos ni saltos al bajar el teclado). Lo crítico va en la mitad de arriba: título, campo, macros en vivo y la acción principal ("Agregar", "Guardar"); debajo, las opciones (chips de unidad, Crudo · Cocido). Al abrirla con un toque no se enfoca el campo, para que el teclado no aparezca solo. En los formularios a pantalla completa (crear alimento, completar datos), el campo enfocado sube a la mitad de arriba, con recorrido de sobra al final de la lista. Si el navegador sí informa el teclado (`visualViewport` más bajo que la ventana), la hoja además se limita a lo visible, y vuelve a su alto en cuanto el teclado se cierra; nunca se estima su alto. La búsqueda no se encoge: su lista se desplaza sola.
- **En el reloj:** pantalla completa de Wear (`AlertDialog`) con dos botones redondos de ícono (`check` y `x`) y el título en una línea.

### Avisos (snackbar)
- **Anatomía:** superficie invertida (texto tiza en oscuro, texto grafito en claro), radio de control, relleno de 12 × 16 px, máximo dos líneas de cuerpo y una acción de texto opcional a la derecha en el color de acción del modo contrario (A4 sobre tiza, A2 sobre grafito; 4.65:1 como mínimo).
- **Dónde:** en el teléfono el aviso se superpone: flota abajo sobre el contenido desplazable, justo encima de la acción fija más alta del pie (el botón flotante, la barra de navegación, la barra del plato o el botón principal de un formulario u hoja), sin moverlo, sin reservar alto y sin cambiar márgenes ni espacios de nada. Puede cubrir por un momento parte de la lista que se desplaza, nunca una acción fija. Excepción: en el modo gym se mantiene la ranura reservada de 56 px encima de los atajos (flujo 1), porque ahí el aviso trae "Deshacer" a cada serie (cambio del 26-oct-2026, feedback de Francis al probar el flujo 3 en Android). En web ancha, abajo a la izquierda del contenido, sin cubrir botones. Uno a la vez: el nuevo reemplaza al anterior.

**The Never Cover Rule.** Un aviso nunca tapa la acción principal, los atajos ni ningún control que la persona necesite para seguir (feedback de Francis al probar el flujo 1, 18-oct-2026). Flota sobre el contenido desplazable sin moverlo y siempre queda encima de las acciones fijas: el botón flotante, la barra de navegación, la barra del plato y los botones principales de una hoja o formulario (26-oct-2026).
- **Duración:** 4 s sin acción, 8 s con acción; no desaparece mientras tiene el foco o el puntero encima. Se anuncia con `role="status"`.
- **Cuándo:** confirmar algo que ya pasó ("Serie guardada", "Comida registrada") o un fallo leve con salida ("No se pudo enviar el mensaje · Reintentar"). Nunca para errores que bloquean ni para pedir una decisión.
- **Movimiento:** entra en normal (200 ms) con curva de entrada, sale en rapido (120 ms) con curva de salida.
- **En el reloj:** confirmación de pantalla completa de Wear (`ConfirmationOverlay`) con ícono de 32 px y una palabra, 1.5 s, con háptica.

### Estados vacíos
- **Anatomía:** ícono de Tabler de 32 px en texto secundario, título de sección, una frase que explica qué aparecerá aquí y para qué sirve, y una acción. Sin ilustraciones, emojis ni mascotas.
- **Primera excepción, la bienvenida (SIS-08):** cada uno de sus 7 pasos lleva una ilustración SVG de trazo lineal, coherente con Tabler outline, con colores solo de tokens (`currentColor` y variables, cambian con el modo y el acento) (ADR 0024).
- **Segunda excepción, "Cómo medir" (SAL-02, D-40):** la hoja que abre el ícono de información de cada medida con cinta lleva un dibujo del cuerpo con el mismo estilo: figura neutra sin rasgos en texto secundario y la cinta o el punto del pliegue en acento, con una instrucción de una línea y texto alternativo igual a ella (ADR 0026). Fuera de estas dos, incluidos los estados vacíos, la regla no cambia.
- **Tres tipos:** primera vez ("Todavía no registras comidas hoy" · "Registra el desayuno para ver tus macros del día" · "Registrar comida"); sin resultados ("No hay alimentos con «yuca frita»" · "Prueba con otra palabra o créalo" · "Crear alimento"); faltan datos para un gráfico ("Faltan pesajes para la tendencia" · "Pésate en la Renpho dos veces más y aparece aquí").
- **En el reloj:** una línea de texto y un botón ("Sin sesión para hoy" · "Abrir en el teléfono").

### Carga
- **Esqueleto** para contenido con forma conocida (listas, tarjetas, gráficos): bloques en elevado con radio de casilla, del tamaño del contenido que vendrá. Pulso de opacidad (1600 ms) sin brillo ni degradado; con reducir movimiento, fijo.
- **Indicador circular** para acciones de duración desconocida dentro de un control (el botón que guarda, la fila que sube): 20 px dentro del botón, que mantiene su ancho y su texto ("Guardando…"). Nunca un indicador a pantalla completa que bloquee.
- **Retraso:** nada de esqueleto ni indicador si la respuesta llega antes de 300 ms, para que no parpadee.
- **Modo gym:** no tiene estado de carga. Todo se lee y se guarda en el teléfono primero (offline-first); la red solo cambia la línea de sincronización.
- **En el reloj:** indicador circular indeterminado de Wear solo al iniciar la sesión; el ciclo de serie y descanso nunca espera.

### Movimiento y háptica
Duraciones de tokens.json con su curva:

| Uso | Duración | Curva |
| --- | --- | --- |
| Respuesta (pressed, hover, foco, tachar serie, interruptores) | rapido 120 ms | estándar `cubic-bezier(0.2, 0, 0, 1)` |
| Mover (reordenar, barras y anillos que avanzan, cambio de pestaña interna) | normal 200 ms | estándar |
| Entrar pequeño (aviso, menú) | normal 200 ms | entrada `cubic-bezier(0.05, 0.7, 0.1, 1)` |
| Entrar grande (diálogo, hoja, pantalla nueva en móvil) | lento 320 ms | entrada |
| Salir | un paso menos que al entrar | salida `cubic-bezier(0.3, 0, 0.8, 0.15)` |

- **Reanimated:** `withTiming(v, { duration: 200, easing: Easing.bezier(0.2, 0, 0, 1) })`; igual para entrada y salida con sus cuatro números.
- **Compose (reloj):** `tween(durationMillis = 200, easing = CubicBezierEasing(0.2f, 0f, 0f, 1f))`.
- **Háptica:** tachar serie, impacto medio al confirmar; deshacer, impacto ligero; fin del descanso, vibración larga en teléfono y reloj; error, notificación de error. La háptica sale en el mismo fotograma del toque, sin esperar a la animación ni a la red.
- **Reducir movimiento** (`prefers-reduced-motion`, `useReducedMotion()` de Reanimated, escala de animaciones del sistema en Android y Wear): sin desplazamientos ni escalas; solo fundidos en 120 ms; esqueletos e ícono del coach sin pulso; anillos y barras saltan al valor. La cuenta regresiva y la háptica se mantienen.

## Do's and Don'ts

### Do:
- **Do** usar solo tokens de docs/diseno/tokens.json: nunca colores, tamaños o radios sueltos.
- **Do** limitar el acento a acción y progreso: botón principal, anillos, selección, foco, tarjeta destacada y línea del coach.
- **Do** usar A2 con texto caucho en oscuro y A4 con texto blanco en claro para el botón principal, y subir un paso (A1, A5) en hover y pressed.
- **Do** escribir toda cifra en Archivo 800, ancho 62, con `tnum`.
- **Do** mostrar el error con ícono y texto, en #FF6B6B (oscuro) o #C9333A (claro).
- **Do** probar cada pantalla en claro y oscuro y con los seis acentos, con contraste AA y foco de 3:1.
- **Do** tomar el nombre y el logo de `packages/brand`.
- **Do** dar a los objetivos táctiles del modo gym al menos 44 px, grandes y separados: se usan con manos sudadas o con guantes, sin gestos finos.
- **Do** usar 56 px en los controles de la sesión de gym y 48 px en el resto, con 8 px entre objetivos.
- **Do** ofrecer "Deshacer" en un aviso en lugar de pedir confirmación cuando la acción se puede revertir.
- **Do** usar esqueletos con la forma del contenido y esperar 300 ms antes de mostrar cualquier carga.
- **Do** usar los íconos outline de Tabler con trazo 1.75 en los tamaños 16, 20, 24 y 32.

### Don't:
- **Don't** usar degradados decorativos ni repartir el acento por fondos y tarjetas (el error de la propuesta B).
- **Don't** poner más de tres series en un gráfico ni traer colores nuevos para los datos (la línea punteada de meta no cuenta como serie).
- **Don't** armar rejillas de tarjetas idénticas ni una franja de KPIs; el día va en orden de importancia.
- **Don't** usar etiquetas en mayúsculas, signos de exclamación ni emojis como íconos.
- **Don't** usar una segunda familia tipográfica ni fuentes por defecto (Inter, la del sistema).
- **Don't** usar sombras para jerarquía; usa las capas tonales.
- **Don't** escribir "Coach Fitness AI" o "Coach" a mano en una pantalla.
- **Don't** aplicar un color propio sin generar A1 a A5 en OKLCH y verificar contraste.
- **Don't** depender del hover para mostrar algo: en táctil no existe.
- **Don't** quitar el anillo de foco ni mostrarlo al tocar.
- **Don't** usar brillos animados en los esqueletos, spinners a pantalla completa ni tres puntos saltando para el coach.
- **Don't** mezclar familias de íconos ni usar íconos rellenos junto a los de trazo.
- **Don't** agregar una sexta pestaña ni mover Ajustes a la barra inferior.
