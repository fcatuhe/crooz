# Crooz

Crooz Club · share and celebrate every ride.

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

### Server provisioning

Handled outside this repo, from [vps-ansible](https://github.com/fcatuhe/vps-ansible), which provisions the whole fleet from one inventory.

## License

See [LICENSE.md](LICENSE.md)
