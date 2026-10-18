---
name: verificacion-mockups
description: Cómo verificar mockups HTML de docs/diseno/mockups (detector Impeccable en modo URL, Playwright, contraste de acentos) y hallazgos de contraste del sistema
metadata:
  type: reference
---

- pnpm no está en el PATH de los agentes: usar `node_modules/.bin/impeccable` con node de fnm (`/run/user/1000/fnm_multishells/*/bin`).
- El detector en modo archivo resuelve mal las variables CSS (falsos bajo contraste, radios de calc). La prueba que vale es el modo URL como en CI: servir `docs/diseno/mockups` con `python3 -m http.server` y correr `IMPECCABLE_BROWSER=~/.cache/ms-playwright/chromium-*/chrome-linux*/chrome impeccable detect --viewport 390x844 http://localhost:PUERTO/archivo.html` (y 1440x900). `--json` imprime `[]` sin hallazgos.
- Playwright: requerir desde `node_modules/.pnpm/playwright@1.64.1/node_modules/playwright`.
- Contraste (resuelto el 18-oct-2026): el texto de acento sobre elevado usa el token textoAcentoSobreElevado (A5 en claro, A2 en oscuro), porque A4 sobre elevado da 4.28 a 4.49:1. Ya está aplicado al subitem activo de la barra lateral en todas las láminas.
- En oscuro, el texto principal y A2 casi no se distinguen en luminancia (1.5 a 2:1): no usar "fondo invertido" contra "relleno de acento" como única diferencia.

Ver [[flujo-2-calendario]].

- Detector (18-oct-2026): una fila con borde visible dentro de otra superficie con radio cuenta como "tarjeta anidada"; para la fila actual usa un contorno (outline) hacia dentro. El modo URL es el que vale: en b2-paginas-6-y-13 el modo archivo marca falsos positivos (rellenos con var() sin resolver y los colores del selector de color propio).

- Las láminas sin `<meta charset>` salen mal codificadas con `python3 -m http.server` ("×" se ve como "Ã—" y el detector lo cuenta como raya): toda lámina debe ser un documento completo.
- Avisos (toasts): van en una ranura reservada al pie, nunca flotando sobre los controles (Never Cover Rule, en DESIGN.md).

- Flujo 10 (18-oct-2026): un espacio reservado con borde discontinuo y radio dentro del teléfono cuenta como tarjeta anidada; con `outline` discontinuo hacia dentro pasa. Las listas de la lámina (`.cambios`, `.casos`) a 86ch disparan "line-length" en escritorio: usar 60ch.
- Si se reutiliza el CSS del flujo 1 por rangos de líneas, incluir `.tabla-envoltura` (si falta, la tabla desborda a 390 px) y `.opcion-rutina`.
- Contenido que no cabe en la pantalla del mockup: contenedor con `overflow-x: visible; overflow-y: clip` para cortar abajo sin recortar las anotaciones laterales.
