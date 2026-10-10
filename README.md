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
mise trust && mise install   # Ruby, and fnox
export BW_SESSION=$(bw unlock --raw)
bin/setup
```

The credentials keys live in Bitwarden, in the secure note `crooz-repository`, which [fnox](https://fnox.jdx.dev) reads through the `bw` CLI as `fnox.toml` maps it. It is named after the repository rather than `crooz` alone because `bw` finds an item by searching names, usernames and URLs, and a login for the site would match too.

- `config/master.key` decrypts the development credentials and stays on disk. `bin/setup` writes it from the note's `RAILS_DEVELOPMENT_KEY` when it is missing.
- The production key never touches the disk. It is the note's `RAILS_PRODUCTION_KEY`, which `mise.toml` grants to two tasks only, as `RAILS_MASTER_KEY`, the name Rails and Kamal read: `mise run kamal ...` and `mise run credentials:production`. Rails reads `RAILS_MASTER_KEY` before any key file, whatever the environment, so it must never reach a development command, and nothing else sees it: not the shell, `mise env`, the shims, or an agent. The tasks' output shows it as `[redacted]`, except the credentials editor, which needs the terminal.

```bash
bin/dev
```

## Deployment

### Deploy

Pushing to `main` deploys: the `deploy` job in `.github/workflows/ci.yml` runs `kamal deploy` from an arm64 runner once every other job is green, with the secrets of the GitHub `production` environment.

By hand, with Bitwarden unlocked:

```bash
mise run kamal deploy
```

`config/deploy.yml` names the web server `CROOZ_SERVER_IP` when it is set, as in the deploy job, and the `crooz` SSH alias otherwise, which the dotfiles render into `~/.ssh/config` from Bitwarden. Kamal reads that file, so a deploy by hand needs no variable.

`.kamal/secrets` reads `RAILS_MASTER_KEY` from the environment only, and the `pre-build` hook stops a deploy that has none, so a plain `bin/kamal deploy` fails before it builds. Commands that only read from the server, such as `bin/kamal app details`, run as they are.

### Server provisioning

Handled outside this repo, from [vps-ansible](https://github.com/fcatuhe/vps-ansible), which provisions the whole fleet from one inventory.

## License

See [LICENSE.md](LICENSE.md)
