#!/usr/bin/env bash
# Regenera desde el Cerebro las copias que las herramientas necesitan en el repo (ADR 0028).
# Uso: pnpm generar   (CEREBRO_DIR cambia la ruta del Cerebro)
set -euo pipefail

CEREBRO_DIR="${CEREBRO_DIR:-/mnt/c/Users/franc/OneDrive/Documentos/000 - Cebrero Claude}"
P="$CEREBRO_DIR/proyectos/fitness-coach/conocimiento"
GEN="$CEREBRO_DIR/compartido/migracion/generar_desde_nodos.py"
cd "$(dirname "$0")/.."

[ -f "$GEN" ] || { echo "No encuentro el Cerebro en $CEREBRO_DIR (define CEREBRO_DIR)." >&2; exit 1; }

gen() { # gen <fuente relativa a conocimiento/> <salida> <carpeta del aviso>
  python3 -I "$GEN" "$P/$1" "$2" --cabecera "generado — editar en el Cerebro: proyectos/fitness-coach/conocimiento/$3 (no edites este archivo)"
}

gen claude-md/_indice.md CLAUDE.md claude-md/
gen diseno/design-md/_indice.md DESIGN.md diseno/design-md/
gen producto-md/_indice.md PRODUCT.md producto-md/
gen repo/readme.md README.md repo/readme.md
gen repo/plantilla-pull-request.md .github/pull_request_template.md repo/plantilla-pull-request.md
for a in arquitecto backend disenador documentador frontend movil pm qa reloj revisor; do
  gen "agentes/definiciones/$a.md" ".claude/agents/$a.md" "agentes/definiciones/$a.md"
done
echo "Copias regeneradas desde el Cerebro."
