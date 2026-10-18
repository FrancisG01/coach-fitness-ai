# 0017 — Dirección visual B2 "Caucho y acento"

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 5 (SIS-03, SIS-04, SIS-05), 14 ("Dirección aprobada: B2 'Caucho y acento'") y 21 (pendientes); `docs/diseno/tokens.json`; decisiones D-08, D-09 y D-17

## Contexto

La sección 14 pide definir una identidad propia antes de la primera pantalla, para evitar el look genérico de IA. Claude preparó una propuesta de identidad visual en PDF (`docs/diseno/Propuesta_Identidad_Visual_B2_Caucho_y_acento.pdf`) y Francis, como diseñador y dueño del producto, eligió la dirección B2. La personalización del aspecto es una función del producto (SIS-04).

## Decisión

- **Base neutra:** caucho `#1B1E23` en oscuro y tiza `#F3F4F1` en claro, con superficies, bordes y textos neutros.
- **Un solo acento en 5 pasos (A1 a A5):**
  - seis de fábrica (Caribe, Mar, Palma, Mango, Flamboyán y Uva de playa) más color propio con selector y campo HEX, con contraste verificado;
  - se usa solo para acción y progreso. En los datos van dos tonos del acento más un gris, con máximo tres series por gráfico.
- **8 plantillas sugeridas** (en `tokens.json`), más las plantillas que guarde el usuario.
- **Modos claro, oscuro y según el sistema**, en web y móvil.
- **Error en rojo fijo** (`#FF6B6B` oscuro, `#C9333A` claro), siempre con ícono y texto.
- **Tipografía:** Archivo (variable), con cifras condensadas y `tnum`.
- **De fábrica:** acento Caribe y modo según el sistema.
- **Nombre y logo provisionales** ("Coach Fitness AI", "Coach" en espacios cortos), configurables desde un solo archivo de marca (SIS-05).

## Alternativas consideradas

La sección 14 menciona que se prepararían tres direcciones visuales para elegir, pero el plan no describe las direcciones descartadas.

## Consecuencias

- `docs/diseno/tokens.json` es la fuente única de tokens para web y móvil; nunca se usan colores, tamaños o radios sueltos.
- Hay que construir los ajustes de apariencia con escala generada y verificación de contraste (SIS-04).
- Ninguna pantalla escribe el nombre o el logo a mano: siempre salen de `packages/brand`, para poder cambiarlos sin tocar pantallas.
