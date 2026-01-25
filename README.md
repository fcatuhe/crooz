# Crooz

Plateforme pour passionnés d'automobile.

## Stack

- Rails 8, Ruby, SQLite
- Hotwire/Turbo
- No-build (CSS/JS vanilla)
- Kamal (deploy)

## Getting Started

```bash
bin/setup
bin/dev
```

## Configuration

### Required files (gitignored)

These files contain sensitive data and must be created manually:

#### `.env`

Environment variables for Kamal deployment:

```bash
# .env
KAMAL_WEB_HOST=your.server.ip.address
```

#### `config/master.key`

Rails master key for credentials encryption. Generate with:

```bash
bin/rails credentials:edit
```

Or copy from a secure location if joining an existing project.

#### `.infra/kamal-ansible-manager/inventory`

Ansible inventory for server provisioning:

```ini
# .infra/kamal-ansible-manager/inventory
[webservers]
your.server.ip.address
```

## Deployment

### Server provisioning (first time)

```bash
cd .infra/kamal-ansible-manager
ansible-galaxy install -r requirements.yml
ansible-playbook playbook.yml
```

### Deploy

```bash
bin/kamal deploy
```

### Useful aliases

```bash
bin/kamal console  # Rails console
bin/kamal shell    # Bash shell
bin/kamal logs     # Tail logs
bin/kamal dbc      # Database console
```

## License

See [LICENSE.md](LICENSE.md)
