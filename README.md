# AVM Indexer Suite

Note: In this current stage this is not going to be operational because I'm making breaking changes constantly and may not commit updates very often, so don't waste your time yet. This message will be removed when it's generally stable. The best way to get assistance or let me know you'd like to see an update is to either comment here (on GitHub) or find me in the Voi Discord (https://discord.gg/vnFbrJrHeW). This message will be removed once I think it's relatively usable.

---

This repository contains a suite of docker images to quickly deploy and configure an Algorand-based indexer, by launching the following containers:

1. Algod node configured to operate in Follower mode
2. Conduit configured with an algod importer and postgres exporter
3. Postgres 14 database
4. Indexer front end
5. Nginx proxy to expose indexer front-end
6. Acme companion to generate and maintain a Letsencrypt certificate for a domain name used with the indexer

If you want to change chains, I believe you can do so by stopping the containers, deleting or renaming the two data folders (follower-data and postgresql-data), changing the chain in the .env file, and then use docker compose with the --build flag, i.e.

```docker compose up -d --build```

This is currently untested.

# Quick Start

1. Clone Repository
```git clone https://github.com/xarmian/avm-indexer-suite.git```
>

2. Change to indexer directory
```cd avm-indexer-suite```
>

3. Copy `env.sample` to `.env` and configure. Configuration options are as follows:
- `INDEXER_API_TOKEN` - API Token used to query Indexer endpoints
- `TOKEN` - API Token used to query Algod endpoints
- `ADMIN_TOKEN` - Algod Admin Token
- `POSTGRES_USER` - User to be used for the indexer's Postgres Database
- `POSTGRES_PASSWORD` - Password to be used for the Postgres User
- `POSTGRES_DB` - Indexer Postgres Database name
- `VIRTUAL_HOST` - Domain name for indexer
- `LETSENCRYPT_EMAIL` - Email to receive notifications for Letsencrypt certificate, such as expiration notifications
>

4. Run config.sh to generate your conduit.yml file
```./config.sh```
>

5. Launch the containers using docker compose
```docker compose up -d```
>

# Disclaimer

This image is supplied without warranty.
