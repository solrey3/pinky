---
title: Nextcloud
category: platform
docs_url: https://docs.nextcloud.com/
created: "2026-05-10"
tags: [nextcloud, self-hosted, cloud, collaboration, files]
---

# Nextcloud Cheatsheet

> Self-hosted open-source cloud platform. Files, photos, calendar, contacts, tasks, notes, deck, office collaboration — all in one place.

**Official Docs:** https://docs.nextcloud.com/  
**GitHub:** https://github.com/nextcloud  
**Platform(s):** Linux (server), macOS/Windows/Linux/iOS/Android (clients)

---

## Installation

### Docker (Recommended)
```bash
# docker-compose.yml
version: '3.8'
services:
  nextcloud:
    image: nextcloud:latest
    ports:
      - "8080:80"
    volumes:
      - nextcloud_data:/var/www/html
    environment:
      - NEXTCLOUD_ADMIN_USER=admin
      - NEXTCLOUD_ADMIN_PASSWORD=changeme
      - NEXTCLOUD_TRUSTED_DOMAINS=cloud.example.com
    depends_on:
      - db
      - redis

  db:
    image: mariadb:10.6
    environment:
      - MYSQL_ROOT_PASSWORD=rootpass
      - MYSQL_PASSWORD=dbpass
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
    volumes:
      - db_data:/var/lib/mysql

  redis:
    image: redis:alpine
    volumes:
      - redis_data:/data

volumes:
  nextcloud_data:
  db_data:
  redis_data:
```

### Manual (LAMP/LEMP)
```bash
# Debian/Ubuntu with Apache
sudo apt install apache2 mariadb-server libapache2-mod-php php-gd php-mysql \
  php-curl php-mbstring php-intl php-gmp php-bcmath php-xml php-zip php-imagick

# Download Nextcloud
cd /var/www
sudo wget https://download.nextcloud.com/server/releases/latest.tar.bz2
sudo tar -xjf latest.tar.bz2
sudo chown -R www-data:www-data nextcloud
```

### Snap
```bash
sudo snap install nextcloud
```

### Verify
```bash
# Via web browser
https://your-server/status.php
```

---

## Setup

### Web installer
1. Navigate to `https://your-server/`
2. Create admin account
3. Configure database (MySQL/MariaDB/PostgreSQL)
4. Select apps to install

### occ (Nextcloud CLI)
```bash
# Get usage
sudo -u www-data php /var/www/nextcloud/occ --help

# Maintenance mode
sudo -u www-data php /var/www/nextcloud/occ maintenance:mode --on
sudo -u www-data php /var/www/nextcloud/occ maintenance:mode --off

# Add user
sudo -u www-data php /var/www/nextcloud/occ user:add alice

# List apps
sudo -u www-data php /var/www/nextcloud/occ app:list

# Enable/disable app
sudo -u www-data php /var/www/nextcloud/occ app:enable calendar
sudo -u www-data php /var/www/nextcloud/occ app:disable calendar

# Update
sudo -u www-data php /var/www/nextcloud/occ upgrade

# Scan files
sudo -u www-data php /var/www/nextcloud/occ files:scan --all
```

---

## Command Reference (occ)

### User management
| Command | Description |
|---------|-------------|
| `occ user:list` | List users |
| `occ user:add <uid>` | Add user |
| `occ user:delete <uid>` | Delete user |
| `occ user:disable <uid>` | Disable user |
| `occ user:enable <uid>` | Enable user |
| `occ user:setting <uid>` | Manage user settings |
| `occ user:resetpassword <uid>` | Reset password |
| `occ user:lastseen <uid>` | Last login |

### Group management
| Command | Description |
|---------|-------------|
| `occ group:list` | List groups |
| `occ group:add <name>` | Add group |
| `occ group:delete <name>` | Delete group |
| `occ group:adduser <group> <user>` | Add user to group |

### App management
| Command | Description |
|---------|-------------|
| `occ app:list` | List apps |
| `occ app:install <app>` | Install app |
| `occ app:remove <app>` | Remove app |
| `occ app:enable <app>` | Enable app |
| `occ app:disable <app>` | Disable app |
| `occ app:update <app>` | Update app |

### Maintenance
| Command | Description |
|---------|-------------|
| `occ maintenance:mode --on` | Enable maintenance mode |
| `occ maintenance:mode --off` | Disable maintenance mode |
| `occ maintenance:repair` | Run repair |
| `occ maintenance:update:htaccess` | Update .htaccess |
| `occ db:add-missing-indices` | Add DB indices |
| `occ db:convert-filecache-bigint` | Convert filecache to bigint |

### Files
| Command | Description |
|---------|-------------|
| `occ files:scan <user>` | Scan user files |
| `occ files:scan --all` | Scan all files |
| `occ files:cleanup` | Cleanup filecache |
| `occ files:transfer-ownership <source> <target>` | Transfer ownership |

### Security
| Command | Description |
|---------|-------------|
| `occ security:certificates` | Manage certificates |
| `occ security:bruteforce:reset <ip>` | Reset brute-force attempts |
| `occ integrity:check-core` | Core integrity check |
| `occ integrity:check-app <app>` | App integrity check |

### Background jobs
| Command | Description |
|---------|-------------|
| `occ background:ajax` | Set AJAX mode |
| `occ background:cron` | Set cron mode |
| `occ background:webcron` | Set webcron mode |

### Configuration
| Command | Description |
|---------|-------------|
| `occ config:list` | List config |
| `occ config:system:get <key>` | Get system config |
| `occ config:system:set <key> --value=<value>` | Set system config |
| `occ config:app:get <app> <key>` | Get app config |
| `occ config:app:set <app> <key> --value=<val>` | Set app config |

---

## Tips

- **occ user:** The `occ` command is the primary admin tool — always run as `www-data` user.
- **Background jobs:** Use cron for production (`occ background:cron`), not AJAX.
- **Trusted domains:** Add all domains to `config.php`: `'trusted_domains' => ['localhost', 'cloud.example.com']`.
- **Redis:** Enable for file locking and caching in `config.php` for performance.
- **Reverse proxy:** Set `'overwriteprotocol' => 'https'` behind nginx/traefik.
- **Updates:** Always put in maintenance mode before updating: `occ maintenance:mode --on`.
- **Docker:** Volumes are your data — back up `nextcloud_data` and `db_data` volumes.
- **External storage:** Mount S3, SFTP, WebDAV via Settings > Administration > External Storage.

---
*Generated via cheatsheet skill on 2026-05-10*
