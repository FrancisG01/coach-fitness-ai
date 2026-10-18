# Estado del proyecto

Última actualización: 17-oct-2026 (sesión de planificación en claude.ai)

## Hecho

- Plan Maestro v1.0 completo (docs/plan-maestro.md): requisitos, stack, arquitectura, fases, decisiones D-01 a D-17.
- Dirección visual aprobada: B2 "Caucho y acento" (docs/diseno/). Acento de fábrica Caribe, modo según el sistema.
- Nombre provisional: Coach Fitness AI ("Coach" en espacios cortos), configurable.
- Datos del atleta en el Anexo A del plan, incluida la medición Renpho del 17-oct-2026.
- App para Galaxy Watch agregada al plan (fase 7b, D-18), con cronometría de sesión (GYM-09).
- Centro de ayuda en la web (SIS-06) escrito a la par del desarrollo; agente documentador.
- Reloj y teléfono en tiempo real por Bluetooth con autoguardado (WAT-06, GYM-10).
- Rutina Full Body A/B/C confirmada (selección de ejercicios; series y reps por revisar).

## Siguiente

- Fase S (setup): Francis sigue docs/setup-windows.md hasta el paso 9; luego el agente pm arranca la Fase S.
- Después: Fase 0 (PRD, PRODUCT.md, DESIGN.md, monorepo, CI) y Fase 0.5 (flujos, mockups, prototipo).

## Pendientes de Francis

- Plan de Claude: Max. En la Fase 5, vincular los créditos mensuales de API (claude.ai → Ajustes → Facturación) a una organización de Claude Console y crear la clave del coach.

- Nombre definitivo y logo (más adelante).

## Bloqueos

- Ninguno.

## Red Tailscale (verificado 17-oct-2026)

- `francisdesign`: PC Windows (WSL2 Ubuntu-24.04 ve la red Tailscale con networkingMode=mirrored).
- `minecraft-server`: servidor Oracle Cloud (Ashburn), destino de producción del sistema.
- `la-tribu-server`: servidor de casa (misma red local). No se usa para este proyecto salvo decisión nueva.
- `francis-s24-ultra`: teléfono Android.
