---
name: prototipos-artefacto-utf8
description: Prototipos/mockups en formato artefacto (sin <head> ni meta charset) se rompen al servirlos con python http.server; probar con servidor que mande charset=utf-8
metadata:
  type: project
---

Los mockups y prototipos de `docs/diseno/mockups/` desde el flujo 3 siguen el formato de artefacto de claude.ai: empiezan con `<title>`, sin `<!doctype>`, `<head>` ni `<meta charset>` (claude.ai pone el esqueleto al publicar).

**Why:** `python3 -m http.server` no manda charset, el navegador lee el archivo como windows-1252 y todo carácter no ASCII se corrompe (en el flujo 3 rompió una regex con acentos combinados: "Range out of order").

Sin meta viewport, un contexto Playwright con `isMobile: true` pinta a 980 px; para probar como en claude.ai en el teléfono, el servidor de prueba debe envolver el archivo con un esqueleto (`<meta charset="utf-8">` + `<meta name="viewport" content="width=device-width, initial-scale=1">`), como hace claude.ai al publicar.

**How to apply:** para Playwright o el detector de Impeccable, servirlos con un servidor que mande `Content-Type: text/html; charset=utf-8` (un SimpleHTTPRequestHandler con `extensions_map['.html']` ajustado basta). En el JS, escribir rangos Unicode como escapes (`̀-ͯ`), nunca como caracteres literales. El detector se corre como el CI: `IMPECCABLE_BROWSER=<chromium de ~/.cache/ms-playwright> pnpm exec impeccable detect --viewport 390x844 <url>` y lo mismo con 1440x900.
