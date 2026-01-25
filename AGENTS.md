# Crooz

This file provides guidance to AI coding agents working with this repository.

## What is Crooz?

Crooz is a platform for car enthusiasts to share and celebrate every ride. Users can track their vehicles, log fuel consumption, maintenance, and write stories about their rides.

## Stack

- **Ruby 4.0**
- **Rails 8.2**
- **SQLite 3** (database)
- **Hotwire** (Turbo + Stimulus)
- **No-build** (vanilla CSS/JS)
- **Importmap** (no bundler)
- **Propshaft** (asset pipeline)
- **Solid Trifecta**:
  - SolidQueue (background jobs)
  - SolidCable (WebSockets)
  - SolidCache (caching)
- **Kamal** (deployment)

## Development Commands

### Setup and Server
```bash
bin/setup              # Initial setup (installs gems, creates DB, loads schema)
bin/dev                # Start development server (localhost:4002)
bin/dev --tailscale    # Start with Tailscale HTTPS (port 64002)
```

### Tailscale Access
When running `bin/dev --tailscale`, the app is available at:
- **https://azade.airplane-catfish.ts.net:64002**

This uses `tailscale serve` to expose the local server via HTTPS.

### Testing
```bash
bin/rails test                         # Run unit tests
bin/rails test test/path/file_test.rb  # Run single test file
bin/rails test:system                  # Run system tests
bin/ci                                 # Run full CI suite
```

### Database
```bash
bin/rails db:fixtures:load   # Load fixture data
bin/rails db:migrate         # Run migrations
bin/rails db:reset           # Drop, create, and load schema
```

## Rails Generators

**Always prefer Rails generators** for creating new code:

```bash
bin/rails generate model Refuel liters:decimal price_cents:integer
bin/rails generate controller Passages index show
bin/rails generate migration AddStartReadingToPassages start_reading:decimal
bin/rails generate authentication  # Rails 8 authentication
```

Generators ensure consistency and create associated test files.

## Coding style

@STYLE.md
