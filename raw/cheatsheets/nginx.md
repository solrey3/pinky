---
title: nginx
category: service
docs_url: https://nginx.org/en/docs/
created: "2026-05-10"
tags: [nginx, web-server, proxy, ssl, devops]
---

# nginx Cheatsheet

> High-performance HTTP server, reverse proxy, and load balancer. Industry standard for serving web content and proxying to application servers.

**Official Docs:** https://nginx.org/en/docs/  
**Platform(s):** Linux, BSD, macOS, Windows

---

## Installation

### macOS
```bash
brew install nginx
```

### Linux
```bash
# Debian/Ubuntu
sudo apt install nginx

# RHEL/CentOS/Fedora
sudo dnf install nginx

# Arch
sudo pacman -S nginx

# Alpine
apk add nginx
```

### Verify
```bash
nginx -v
nginx -t              # Test configuration
```

---

## Setup

### Default directories
| Directory | Purpose |
|-----------|---------|
| `/etc/nginx/` | Configuration |
| `/etc/nginx/nginx.conf` | Main config |
| `/etc/nginx/sites-available/` | Site configs (Debian/Ubuntu) |
| `/etc/nginx/sites-enabled/` | Symlinked active sites |
| `/usr/share/nginx/html/` | Default web root |
| `/var/log/nginx/` | Logs |
| `/var/run/nginx.pid` | PID file |

### Basic commands
```bash
# Start/stop/restart/reload
sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl restart nginx
sudo nginx -s reload      # Graceful reload (no downtime)
sudo nginx -s stop
sudo nginx -s quit        # Graceful shutdown

# Test config before reload
sudo nginx -t
sudo nginx -t -c /etc/nginx/nginx.conf
```

---

## Configuration

### Main config structure
```nginx
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log warn;
pid /var/run/nginx.pid;

events {
    worker_connections 1024;
    use epoll;
    multi_accept on;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';

    access_log /var/log/nginx/access.log main;

    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
```

### Server block (reverse proxy)
```nginx
server {
    listen 80;
    server_name example.com www.example.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }

    location /static {
        alias /var/www/static;
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
}
```

### SSL/HTTPS with Let's Encrypt
```nginx
server {
    listen 443 ssl http2;
    server_name example.com;

    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
    }
}

server {
    listen 80;
    server_name example.com;
    return 301 https://$server_name$request_uri;
}
```

---

## Command Reference

### nginx CLI
| Command | Description |
|---------|-------------|
| `nginx -v` | Version |
| `nginx -V` | Version + compile flags |
| `nginx -t` | Test configuration |
| `nginx -t -q` | Test quietly |
| `nginx -c /path/nginx.conf` | Use custom config |
| `nginx -s reload` | Graceful reload |
| `nginx -s stop` | Fast shutdown |
| `nginx -s quit` | Graceful shutdown |
| `nginx -s reopen` | Reopen log files |

---

## Tips

- **Test before reload:** Always run `nginx -t` before `nginx -s reload`. A bad config can take nginx down.
- **Symlink sites:** On Debian/Ubuntu, place configs in `sites-available/` and symlink to `sites-enabled/`.
- **Rate limiting:** Use `limit_req_zone` to prevent abuse.
- **Gzip:** Enable `gzip on; gzip_types text/plain text/css application/json;`
- **Security headers:** Add `add_header X-Frame-Options "SAMEORIGIN";` etc.
- **Let's Encrypt:** Use `certbot --nginx` for automatic cert provisioning.

---
*Generated via cheatsheet skill on 2026-05-10*
