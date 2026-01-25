# Crooz

A platform for car enthusiasts.

## Stack

- Ruby 4
- Rails 8
- SQLite 3
- Hotwire/Turbo
- No-build (vanilla CSS/JS)
- Kamal (deployment)

## Getting Started (Development)

```bash
bin/setup
```

You will need `config/master.key` to decrypt credentials. Ask a team member for it.

```bash
bin/dev
```

## Deployment

### Deploy

#### Required file (gitignored)

`.env` — Kamal deployment variables:

```bash
KAMAL_WEB_HOST=your.server.ip.address
```

#### Run

```bash
bin/kamal deploy
```

### Server provisioning (first time)

#### Required file (gitignored)

`.infra/kamal-ansible-manager/inventory` — Ansible hosts:

```ini
[webservers]
your.server.ip.address
```

#### Run

```bash
cd .infra/kamal-ansible-manager
ansible-galaxy install -r requirements.yml
ansible-playbook playbook.yml
```

## License

See [LICENSE.md](LICENSE.md)
