# AVM Indexer Suite

The best way to get assistance or let me know you'd like to see an update is to either comment here (on GitHub) or find me (#xarmian) in the Voi Discord (https://discord.gg/vnFbrJrHeW).

This repository borrows stuff from a bunch of more official repositories and combines them into what I think is a highly automated method to deploy your own private AVM Indexer and Algod node through a series of microservices. It's not reinventing the wheel, and there's a lot remaining to improve so don't expect too much.

---

This repository contains a suite of docker images to quickly deploy and configure an Algorand-based indexer, by launching the following containers:

1. Algod node configured to operate in Follower mode
2. Conduit configured with an algod importer and postgres exporter
3. Postgres 14 database
4. Indexer front end
5. Nginx proxy to expose indexer front-end
6. Acme companion to generate and maintain a Letsencrypt certificate for a domain name used with the indexer

If you want to change chains, I believe you can do so by stopping the containers, deleting or renaming the two data folders (follower-data and postgresql-data), changing the chain in the .env file, and then use docker compose with the --build flag, i.e.

```./up --build```

This is currently untested.

# Quick Start

1. Clone Repository
```git clone https://github.com/xarmian/avm-indexer-suite.git```
>

2. Change to indexer directory
```cd avm-indexer-suite```
>

3. Copy `env.sample` to `.env` and configure. Configuration options are as follows:
- `CHAIN` - AVM Chain to use, either `VOI` or `ALGORAND`
- `NETWORK` - The network name, i.e. `voitest-v1` for Voi, or `mainnet`, `testnet`, etc. for Algorand
- `INDEXER_API_TOKEN` - API Token used to authenticate Indexer endpoint queries
- `TOKEN` - API Token used to authenticate Algod endpoint queries
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

5. Rename `conduit.yml.final` to `conduit.yml`
```mv conduit.yml.final conduit.yml```
>

6. Launch the four core containers with docker compose using the `up` utility script, i.e.
```
./up
```

To also launch the nginx and acme-companion containers to expose the Indexer API outside of Portainer
on the host server's ports 80 and 443 use the `--nginx` flag:
```
./up --nginx
```

7. NOTE: The postgres database init doesn't work due to this issue: https://github.com/xarmian/avm-indexer-suite/issues/2 to fix this, shutdown the containers by running `./down` and then `chmod` the postgresql-data folder to your current user, i.e.

```
./down
sudo chown -R $(id -un):$(id -gn) ./postgresql-data
./up
```

Then in the future you can stop and start the services using `./down` and `./up`

# Disclaimer

This repository is supplied without warranty.

# License

MIT License. See LICENSE file.