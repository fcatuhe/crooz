# Crooz

A platform for car enthusiasts.

## Stack

- Ruby 4.0
- Rails 8.1
- SQLite 3.47
- Hotwire/Turbo
- No-build (vanilla CSS/JS)
- Kamal (deployment)

## Getting Started (Development)

```bash
bin/setup
```

You'll need `config/master.key` to decrypt credentials. Ask a team member for it.

```bash
bin/dev
```

## Deployment

### Required files (gitignored)

#### `.env`

```bash
KAMAL_WEB_HOST=your.server.ip.address
```

#### `.infra/kamal-ansible-manager/inventory`

```ini
[webservers]
your.server.ip.address
```

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
