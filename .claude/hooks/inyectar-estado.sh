#!/bin/sh
# Hook SessionStart: inyecta docs/estado.md como contexto (ADR 0019).
# Lo que se imprime aquí lo recibe Claude al iniciar, tras /clear, tras compactar y al reanudar.
estado="${CLAUDE_PROJECT_DIR:-.}/docs/estado.md"
if [ -f "$estado" ]; then
  echo "Estado del proyecto cargado automáticamente desde docs/estado.md (fuente: hook SessionStart):"
  echo
  cat "$estado"
fi
exit 0
