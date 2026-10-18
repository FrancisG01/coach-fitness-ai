#!/usr/bin/env bash
# Compila la web y la despliega en el servidor Oracle con Caddy.
# Uso, desde la raíz del repo: infra/oracle/desplegar.sh
# Requiere el alias SSH `oracle-deploy` (ver infra/oracle/README.md).
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"
DESTINO="oracle-deploy:/srv/coach"

echo "Compilando la web"
pnpm --filter @coach/web build

echo "Copiando al servidor"
ssh oracle-deploy 'mkdir -p /srv/coach/caddy/data /srv/coach/caddy/config'
rsync -a infra/oracle/compose.yaml infra/oracle/Caddyfile "$DESTINO/"
rsync -a --delete apps/web/dist/ "$DESTINO/web/"

echo "Levantando servicios"
# Caddy corre sin API de administración: se reinicia para leer un Caddyfile nuevo.
ssh oracle-deploy 'cd /srv/coach && docker compose up -d --remove-orphans && docker compose restart caddy && docker compose ps'
