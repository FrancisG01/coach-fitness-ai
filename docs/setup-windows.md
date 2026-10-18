# Guía de preparación — tu PC Windows

Esto es lo único que haces a mano. Cuando termines el paso 9, Claude Code toma el control y hace el resto de la Fase S (Node, Python, repositorio, CI, servidor Oracle).

Tiempo estimado: 45–60 minutos, la mayoría esperando descargas.

---

## 1. Activar WSL2 con Ubuntu

1. Abre **PowerShell como administrador** (clic derecho en Inicio → Terminal (Administrador)).
2. Ejecuta:
   ```powershell
   wsl --install -d Ubuntu-24.04
   ```
3. Reinicia el PC cuando lo pida.
4. Al volver, se abre Ubuntu solo. Crea tu usuario y contraseña de Linux (anótalos).

Si da error de virtualización: hay que activar "Virtualization" / "SVM" / "VT-x" en la BIOS del PC.

## 2. Ajuste de red para Tailscale (una sola vez)

En Windows, crea el archivo `C:\Users\<tu-usuario>\.wslconfig` con este contenido:
```ini
[wsl2]
networkingMode=mirrored
```
Luego en PowerShell: `wsl --shutdown` y vuelve a abrir Ubuntu. Así WSL ve la red de Tailscale igual que Windows.

## 3. Docker Desktop

1. Descarga e instala Docker Desktop: https://www.docker.com/products/docker-desktop/
2. Durante la instalación deja marcado **"Use WSL 2 instead of Hyper-V"**.
3. Ábrelo → Settings → Resources → **WSL integration** → activa **Ubuntu-24.04** → Apply.

## 4. VS Code y sus dos extensiones clave

1. Instala VS Code: https://code.visualstudio.com/
2. En Extensiones (Ctrl+Shift+X) instala:
   - **WSL** (Microsoft)
   - **Claude Code** (Anthropic)

El resto de extensiones las instala Claude cuando prepare el proyecto.

## 5. Navegador (no requiere instalación)

Claude Code corre dentro de WSL, y la integración Claude in Chrome no funciona en WSL. Claude revisa la web y su consola con Playwright (Chromium sin ventana) dentro de Ubuntu; lo instala él en la Fase S. Tú sigues usando Brave para ver la app.

## 6. Tailscale

1. Crea tu cuenta gratis en https://tailscale.com (puedes entrar con Google o GitHub).
2. Instala Tailscale en **Windows** e inicia sesión.
3. Instala Tailscale en tu **teléfono Samsung** (Play Store) con la misma cuenta.

El servidor Oracle lo agrega Claude más adelante.

## 7. Preparar Ubuntu

Abre **Ubuntu** (menú Inicio) y pega estos comandos uno por uno:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl unzip build-essential gh
git config --global user.name "Francis Guzman"
git config --global user.email "tu-correo-de-github@ejemplo.com"
gh auth login
```
En `gh auth login` elige: GitHub.com → HTTPS → Login with a web browser, y sigue el código que te muestra.

## 8. Instalar Claude Code dentro de Ubuntu

```bash
curl -fsSL https://claude.ai/install.sh | bash
```
Cierra y vuelve a abrir Ubuntu, y comprueba:
```bash
claude --version
claude
```
Al ejecutar `claude` te pide iniciar sesión: usa tu cuenta de Claude (la misma suscripción). Luego escribe `/exit`.

## 9. Crear el proyecto y entregarle el mando a Claude

1. Descomprime este paquete (`coach-fitness-ai-arranque`) en tu carpeta de Descargas de Windows.
2. En Ubuntu:
   ```bash
   mkdir -p ~/proyectos/coach-fitness-ai
   cp -r /mnt/c/Users/<tu-usuario-de-windows>/Downloads/coach-fitness-ai-arranque/. ~/proyectos/coach-fitness-ai/
   cd ~/proyectos/coach-fitness-ai
   code .
   ```
   VS Code se abre conectado a WSL (abajo a la izquierda dice "WSL: Ubuntu-24.04").
3. Abre el panel de **Claude Code** (ícono de Claude en la barra lateral) y escribe:

   > Lee CLAUDE.md, docs/estado.md y docs/plan-maestro.md. Actúa como el agente pm y arranca la Fase S: verifica mi entorno, instala lo que falte (Node LTS, pnpm, uv, Python 3.12, Expo CLI, EAS CLI), inicializa el repositorio en GitHub, prepara el monorepo, los agentes, las skills (Impeccable y UX Heuristics) y el CI. Explícame cada paso antes de hacerlo y pídeme lo que necesites.

A partir de aquí Claude te guía. Lo que te pedirá en algún momento:
- Acceso SSH a tu servidor Oracle (la llave que usas en Termius).
- Crear la clave de la API de Anthropic para el coach (cuando lleguemos a la Fase 5).
- Activar Samsung Health → Health Connect en el teléfono (Fase 7).
- Para la app del reloj (fase 7b): instalar Android Studio en Windows y activar la depuración por Wi-Fi en el Galaxy Watch (Ajustes → Opciones de desarrollador). Claude te guía en su momento.

---

## Si algo falla

Copia el error completo y pégaselo a Claude en VS Code. Si todavía no llegaste a instalar Claude Code, pégalo en el chat de claude.ai.
