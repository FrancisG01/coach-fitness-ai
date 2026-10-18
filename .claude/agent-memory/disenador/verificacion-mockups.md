---
name: verificacion-mockups
description: Cómo verificar mockups HTML de docs/diseno/mockups (detector Impeccable en modo URL, Playwright, contraste de acentos) y hallazgos de contraste del sistema
metadata:
  type: reference
---

- pnpm no está en el PATH de los agentes: usar `node_modules/.bin/impeccable` con node de fnm (`/run/user/1000/fnm_multishells/*/bin`).
- El detector en modo archivo resuelve mal las variables CSS (falsos bajo contraste, radios de calc). La prueba que vale es el modo URL como en CI: servir `docs/diseno/mockups` con `python3 -m http.server` y correr `IMPECCABLE_BROWSER=~/.cache/ms-playwright/chromium-*/chrome-linux*/chrome impeccable detect --viewport 390x844 http://localhost:PUERTO/archivo.html` (y 1440x900). `--json` imprime `[]` sin hallazgos.
- Playwright: requerir desde `node_modules/.pnpm/playwright@1.64.1/node_modules/playwright`.
- Contraste conocido (18-oct-2026): en claro, A4 sobre elevado da 4.28 a 4.49:1 con Caribe, Mar, Palma y Mango (subitem activo de la barra lateral). Francis decidió dejarlo en A4 por ahora; no lo cambies por tu cuenta, solo recuérdalo si se revisa el contraste.
- En oscuro, el texto principal y A2 casi no se distinguen en luminancia (1.5 a 2:1): no usar "fondo invertido" contra "relleno de acento" como única diferencia.

Ver [[flujo-2-calendario]].

- Detector (18-oct-2026): una fila con borde visible dentro de otra superficie con radio cuenta como "tarjeta anidada"; para la fila actual usa un contorno (outline) hacia dentro. Las láminas con mockups web siempre dan 5 avisos A4 sobre elevado en el subitem activo (excepción aceptada); avisa a quien pida `[]`.
