# 0014 — Sin dominio en la v1.0: dirección gratuita de Tailscale con HTTPS

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 11 ("Acceso privado con Tailscale" y "Preparada para abrirse al público"), 18 (costos de operación) y 21 (pendientes); decisiones D-12, D-14 y D-20

## Contexto

Con el acceso solo por Tailscale (ADR 0012), el sistema no necesita ser alcanzable desde internet. Un dominio propio tiene costo anual, y el objetivo es mantener la infraestructura en costo cero (RNF-11).

## Decisión

- No se compra dominio en la v1.0.
- La app usa un nombre privado de MagicDNS bajo `*.ts.net`, con certificado HTTPS emitido por Tailscale. Staging va por Tailscale con otro nombre privado.
- El dominio se compra solo si la app se abre al público.

## Alternativas consideradas

- **Dominio propio desde el inicio.** Pospuesto: solo hace falta al abrir al público, junto con Caddy en el puerto 443 y Let's Encrypt (sección 11).

## Consecuencias

- Costo cero de dominio en la v1.0.
- HTTPS válido sin exponer el servidor: el certificado lo provee Tailscale (en la ADR 0020, Caddy lo obtiene de `tailscaled`).
- La dirección depende del nombre del tailnet de Tailscale. Cambiarla más adelante implica reconfigurar Caddy y los clientes.
- El nombre aparece en los registros públicos de certificados (ADR 0020).
