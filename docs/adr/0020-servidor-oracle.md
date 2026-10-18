# 0020 — Servidor Oracle: preparación, acceso y publicación por Tailscale

- Fecha: 18-oct-2026
- Estado: aceptada
- Decide: Francis Guzman
- Relacionada: plan maestro, secciones 12 (Fase S, punto 4), 13 (seguridad) y 15 (despliegue); decisiones D-12, D-14 y D-20

## Contexto

La instancia de Oracle Cloud (Ashburn, ARM, 2 núcleos, 11 GB de RAM, 193 GB de disco, Ubuntu 24.04) alojaba un servidor de Minecraft con todo un ecosistema alrededor: panel, bots, mapas web y respaldos. El plan la dedica al sistema (D-12) y exige que ningún puerto quede abierto a internet. Al revisarla, estaba expuesta: Tailscale Funnel publicaba un mapa web y la lista de seguridad de Oracle dejaba entrar SSH y diez reglas de Minecraft, una de ellas con todo UDP abierto.

## Decisión

1. **Minecraft retirado por completo**, sin respaldo, porque Francis ya tenía el suyo. Se fueron servicios, timers, archivos, Java, box64, el usuario `mapa-web` y Tailscale Funnel.
2. **Nombre `coach`** en el sistema y en Tailscale. La dirección de la app es `https://coach.tail72ec86.ts.net`.
3. **Dos usuarios con llave, ninguno con contraseña:**
   - `ubuntu`: administrador, con `sudo`.
   - `deploy`: sin `sudo`, en el grupo `docker`. Despliega en `/srv/coach`.

   SSH no admite root ni contraseñas, y solo deja entrar a esos dos usuarios (`/etc/ssh/sshd_config.d/10-coach.conf`).
4. **Ningún puerto abierto a internet, con dos barreras:**
   - el firewall del sistema (iptables, guardado en `/etc/iptables/rules.v4`, copia en `infra/oracle/iptables-rules.v4`) rechaza todo lo que entra por la interfaz pública, salvo ICMP y las respuestas a conexiones ya abiertas. Por `tailscale0`, la cadena `ts-input`, que crea `tailscaled` al arrancar, deja pasar cualquier puerto. Lo que limita la exposición dentro del tailnet es qué servicios escuchan; hoy solo lo hacen SSH y Caddy (80 y 443). SSH tiene además su propia regla, limitada a `tailscale0`, que no depende de esa cadena;
   - la lista de seguridad de la VCN conserva solo dos reglas de ICMP: tipo 3 y 4 desde cualquier origen, y tipo 3 desde `10.0.0.0/16`.

   Tailscale no necesita puertos de entrada. La instancia no tiene IPv6 público y `rules.v6` está vacío: si algún día se activa IPv6 en la VCN, hay que replicar ahí las reglas de IPv4.
5. **Docker Engine y Compose** del repositorio oficial, con rotación de logs: 3 archivos de 10 MB por contenedor.
6. **Caddy en Docker con `network_mode: host`, escuchando solo en la IP de Tailscale** (`default_bind`).
   - El certificado de `*.ts.net` lo obtiene de `tailscaled` por su socket y lo renueva solo.
   - Caddy no corre como root: usa el uid 1002 (`deploy`) y solo tiene la capacidad `NET_BIND_SERVICE`.
   - `TS_PERMIT_CERT_UID=1002` en `/etc/default/tailscaled` le permite pedir certificados y nada más; no puede, por ejemplo, activar Funnel.
   - Monta la carpeta `/var/run/tailscale` y no el socket suelto, porque `tailscaled` recrea el socket al reiniciarse.
   - Configuración y despliegue en `infra/oracle/`. La configuración de SSH (`sshd-10-coach.conf`) y del firewall (`iptables-rules.v4`) también se versiona ahí, como copia de referencia de lo que hay en el servidor.
7. **Actualizaciones automáticas de seguridad** activas (`unattended-upgrades`).

## Alternativas consideradas

- **Publicar puertos de Docker (`ports:`) con el firewall del sistema.** Docker inserta sus reglas antes que las del firewall y se lo salta. Se descarta: con `network_mode: host` y `default_bind`, lo que escucha queda atado a la IP de Tailscale.
- **`tailscale serve` en lugar de Caddy.** Es más simple, pero el plan fija Caddy como proxy de la API y la web, y Caddy se mueve sin cambios a otro servidor o a un dominio propio. Se descarta.
- **SSH escuchando solo en la IP de Tailscale (`ListenAddress`).** Si `sshd` arranca antes que Tailscale, falla al arrancar. Se descarta: se filtra en el firewall, que no depende del orden de arranque.
- **Reutilizar la llave de Termius.** Se descarta. WSL tiene su propia llave (`~/.ssh/coach_oracle`), que se puede revocar sin afectar a Termius.

## Consecuencias

- El servidor solo existe para los equipos de la red Tailscale. Desde internet no responde a nada.
- **Recuperación si Tailscale falla:** SSH deja de ser accesible. La vía de rescate es la consola serie de Oracle Cloud (instancia → Console connection), o abrir temporalmente el puerto 22 en la lista de seguridad y en `rules.v4`.
- `deploy` en el grupo `docker` equivale en la práctica a root: su llave se protege como la de administrador. El CI tendrá su propia llave cuando llegue el despliegue automático (Fase 1).
- El nombre `coach.tail72ec86.ts.net` aparece en los registros públicos de certificados (Certificate Transparency). No revela nada más.
- Claude Code solo tiene permiso para `ssh oracle` y `scp … oracle:` (`.claude/settings.local.json`, sin versionar). Los cambios que tocan el acceso SSH los ejecuta Francis con un script preparado.
