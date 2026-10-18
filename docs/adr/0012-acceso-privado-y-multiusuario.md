# 0012 — Acceso privado por Tailscale con login y 2FA; arquitectura multiusuario; Oracle dedicado

- Fecha: 17-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 4 (restricciones), 11 (seguridad y privacidad, "Acceso privado con Tailscale" y "Preparada para abrirse al público") y 15 (despliegue); decisiones D-12, D-14 y D-20

## Contexto

Los datos de salud son sensibles. En la v1.0 hay un solo usuario, Francis, pero no quiere cerrar la puerta a abrir la app al público en el futuro. Reescribir un sistema de un solo usuario para volverlo multiusuario sería caro. El servidor Oracle además alojaba un servidor de Minecraft.

## Decisión

- **Dos capas de protección:**
  - **Red privada con Tailscale:** el sistema no tiene dirección pública. Caddy escucha solo en la IP de Tailscale, la ACL de Tailscale limita el acceso a los dispositivos de Francis, y web, API y SSH van solo por Tailscale.
  - **Login dentro de la app:** contraseña fuerte, segundo factor TOTP y sesiones con expiración. Passkeys más adelante.
- **Multiusuario desde el primer día:**
  - `user_id` en cada tabla de datos personales y ninguna consulta sin filtrar por usuario;
  - seguridad a nivel de fila (RLS) en Postgres como segunda barrera;
  - roles admin y usuario;
  - autenticación estándar OAuth2/OIDC con tokens;
  - configuración por usuario: unidades, objetivos y zona horaria;
  - tests que prueban que un usuario no ve datos de otro.
- **Oracle dedicado al sistema:** el servidor de Minecraft deja de correr ahí. La ADR 0020 detalla cómo quedó el servidor.

## Alternativas consideradas

El plan no compara otras redes privadas ni otros esquemas de acceso. Abrir al público queda como fase futura: registro con verificación de correo, dominio propio con Let's Encrypt, rate limiting, cuotas de IA y términos de uso.

## Consecuencias

- Máxima privacidad ahora: desde internet el sistema no responde a nada.
- Abrir al público será configuración y trabajo acotado, no reescribir. Requiere una fase propia con auditoría de seguridad y de licencias, apoyada en el inventario `docs/licencias.md`.
- Todos los dispositivos necesitan Tailscale activo para llegar al servidor. La app móvil sigue funcionando sin conexión y sincroniza cuando vuelve el túnel.
- El modelo de datos y cada endpoint cargan con `user_id` y políticas RLS aunque haya un solo usuario.
