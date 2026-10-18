# Servidor Oracle (`coach`)

Producción del sistema. Decisiones y motivos en [ADR 0020](../../docs/adr/0020-servidor-oracle.md).

| Dato | Valor |
| --- | --- |
| Dirección de la app | https://coach.tail72ec86.ts.net (solo dentro de Tailscale) |
| IP de Tailscale | 100.105.148.38 |
| Sistema | Ubuntu 24.04, ARM (aarch64), Oracle Cloud Ashburn |
| Usuarios | `ubuntu` (administrador, con sudo) y `deploy` (Docker, sin sudo) |
| Carpeta de despliegue | `/srv/coach` (de `deploy`) |

## Acceso desde WSL

En `~/.ssh/config`:

```
Host oracle
  HostName 100.105.148.38
  User ubuntu
  IdentityFile ~/.ssh/coach_oracle
  IdentitiesOnly yes

Host oracle-deploy
  HostName 100.105.148.38
  User deploy
  IdentityFile ~/.ssh/coach_oracle
  IdentitiesOnly yes
```

## Desplegar

Desde la raíz del repo, con Tailscale conectado:

```bash
infra/oracle/desplegar.sh
```

El script compila `apps/web`, copia `compose.yaml`, `Caddyfile` y la web a `/srv/coach` y levanta Caddy.

## Comprobar

```bash
curl -sI https://coach.tail72ec86.ts.net/
ssh oracle-deploy 'cd /srv/coach && docker compose ps && docker compose logs --tail 20 caddy'
```

## Si Tailscale falla

SSH solo se acepta por Tailscale. Para rescatar el servidor:

1. Usa la consola serie de Oracle Cloud: Compute → Instancias → la instancia de Ashburn → Console connection.
2. Si hace falta, abre temporalmente TCP 22 en la lista de seguridad de la VCN y en `/etc/iptables/rules.v4`. Ciérralo al terminar.
