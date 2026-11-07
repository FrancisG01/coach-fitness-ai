#!/bin/sh
# Hook SessionStart: inyecta el ESTADO.md del proyecto en el Cerebro como contexto (ADR 0019, cambiado por el ADR 0027).
# Lo que se imprime aquí lo recibe Claude al iniciar, tras /clear, tras compactar y al reanudar.
# CEREBRO_DIR permite apuntar a otra copia del Cerebro (por defecto, la de OneDrive vista desde WSL).
cerebro="${CEREBRO_DIR:-/mnt/c/Users/franc/OneDrive/Documentos/000 - Cebrero Claude}"
estado="$cerebro/proyectos/fitness-coach/ESTADO.md"
if [ -f "$estado" ]; then
  echo "Estado del proyecto cargado automáticamente desde el Cerebro, proyectos/fitness-coach/ESTADO.md (fuente: hook SessionStart, ADR 0027)."
  echo "Es la única fuente del estado: actualízalo con cerebro_actualizar; docs/estado.md ya no se usa."
  echo
  # Sin el frontmatter: solo el cuerpo.
  awk 'NR==1 && $0=="---" {fm=1; next} fm && $0=="---" {fm=0; next} !fm' "$estado"
else
  echo "Aviso del hook SessionStart: no encontré el ESTADO del proyecto en el Cerebro ($estado)."
  echo "Conéctate con cerebro_conectar(\"fitness-coach\") para leerlo, o revisa la ruta del Cerebro (CEREBRO_DIR)."
fi
exit 0
