# Registro de decisiones (ADR)

Las decisiones D-01 a D-18 tomadas en la planificación (docs/plan-maestro.md, sección 20) ya están registradas como ADR 0001 a 0018. El número del ADR coincide con el de la decisión.

Desde la D-19, cada decisión nueva se registra directamente como ADR con su mismo número y se agrega una fila a la sección 20 del plan.

Formato de cada ADR: contexto, decisión, alternativas consideradas, consecuencias, fecha.

| ADR | Decisión |
| --- | --- |
| [0001](0001-plataforma-propia.md) | Plataforma propia en Oracle |
| [0002](0002-stack-python-react-expo.md) | Stack: Python/FastAPI y PostgreSQL, React con Vite, Expo para Android |
| [0003](0003-registro-nutricional-propio.md) | Registro nutricional propio; Cronometer opcional |
| [0004](0004-base-de-alimentos-y-unidades.md) | Base de alimentos y unidades de medida |
| [0005](0005-mtb-por-captura.md) | Paseos de MTB por captura de pantalla al chat del coach |
| [0006](0006-coach-con-herramientas-y-memoria.md) | Coach con herramientas sobre la base de datos y memoria con pgvector; Obsidian solo para documentación |
| [0007](0007-vscode-claude-code-y-agentes.md) | VS Code con Claude Code y un equipo de agentes dirigido por un Project Manager |
| [0008](0008-skills-de-diseno.md) | Skills de diseño: Impeccable y UX Heuristics; Taste Skill descartada |
| [0009](0009-fase-de-diseno-ux.md) | Fase 0.5 de Diseño UX: ninguna pantalla se programa sin mockup aprobado |
| [0010](0010-diseno-de-base-de-datos-en-tres-niveles.md) | Diseño de la base de datos en tres niveles con DBML, DBeaver y Mermaid |
| [0011](0011-reinicio-full-body-y-fuera-protocolo-capilar.md) | Reinicio con Full Body A/B/C; protocolo capilar fuera del proyecto |
| [0012](0012-acceso-privado-y-multiusuario.md) | Acceso privado por Tailscale con login y 2FA; arquitectura multiusuario; Oracle dedicado |
| [0013](0013-samsung-health-via-health-connect.md) | Samsung Health vía Health Connect en la app Android; Strava sigue por captura |
| [0014](0014-sin-dominio-en-v1.md) | Sin dominio en la v1.0: dirección gratuita de Tailscale con HTTPS |
| [0015](0015-claude-code-y-api-para-el-coach.md) | Desarrollo con Claude Code; coach de la app con la API de Anthropic |
| [0016](0016-wsl2-fase-s-y-backlog-cerrado.md) | Desarrollo en Windows con WSL2; Fase S antes de la Fase 0; backlog de la v1.0 cerrado |
| [0017](0017-direccion-visual-b2.md) | Dirección visual B2 "Caucho y acento" |
| [0018](0018-app-galaxy-watch-nativa.md) | App nativa para Galaxy Watch y cronometría de sesión |
| [0019](0019-gestion-automatica-del-contexto.md) | Gestión automática del contexto |
| [0020](0020-servidor-oracle.md) | Servidor Oracle: preparación, acceso y publicación por Tailscale |
| [0021](0021-embeddings-locales-en-el-servidor.md) | Embeddings de la memoria del coach con un modelo local en el servidor |
