# 0007 — VS Code con Claude Code y un equipo de agentes dirigido por un Project Manager

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, sección 12 (herramientas, memoria del proyecto, múltiples agentes, flujo de cada funcionalidad y metodología); decisiones D-07, D-15, D-16 y D-19

## Contexto

El proyecto abarca backend, web, app Android, reloj, diseño, pruebas y documentación, y lo desarrolla Claude Code. Un solo agente para todo pierde foco en un proyecto de este tamaño, y muchos agentes en paralelo sin control generan código que choca. Francis es diseñador gráfico, no programador: necesita un responsable técnico que planifique, verifique y le reporte.

## Decisión

- **Herramienta única: VS Code** conectado a WSL, con la extensión de Claude Code y su terminal integrada.
- **Equipo de agentes** en `.claude/agents/`:
  - un Project Manager que mantiene el plan y el backlog, divide, asigna, verifica criterios de aceptación y bloquea lo que no pase pruebas;
  - especialistas: Arquitecto, Backend, Frontend web, Móvil, Reloj, Diseñador UI, QA, Revisor de código y seguridad, y Documentador.
- **Trabajo casi siempre en secuencia.** En paralelo solo cuando las tareas no se tocan, cada agente en su propio worktree de git.
- **Candados automáticos:** reglas en `CLAUDE.md`, hooks de lint y tests, y CI que no deja fusionar código en rojo. Francis aprueba la spec y hace la demo final.

## Alternativas consideradas

- **Cursor.** Descartado: ya trae su propia IA y se pagarían dos agentes para hacer lo mismo.
- **JetBrains.** También funciona, pero VS Code es más ligero y es donde Claude Code tiene mejor integración.
- **Un solo agente para todo.** Descartado: pierde foco.
- **Muchos agentes en paralelo sin control.** Descartado: genera código que choca.
- **App de escritorio de Claude.** No hace falta.

## Consecuencias

- Foco por especialidad con control central; ningún agente fusiona sin el visto bueno del PM.
- El conocimiento se guarda en el repositorio en varias capas (`CLAUDE.md`, `.claude/rules/`, memoria de cada agente, `docs/`), porque cada sesión empieza en blanco. La ADR 0019 automatiza recuperar el estado.
- El PM es un agente: revisa mucho, pero Francis es el dueño del producto y las pruebas automáticas son el juez final.
- La integración Claude in Chrome no funciona en WSL: la web se prueba con Playwright y Chromium sin ventana.
