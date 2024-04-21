#!/bin/bash
# This script configures the conduit.yml file for your indexer

if [ ! -f ".env" ]; then
    echo "Error: .env file does not exist."
    exit 1
fi

source .env

CONDUIT_ORIG="conduit.yml.orig"
CONDUIT_FINAL="conduit.yml"

if [ ! -f "${CONDUIT_ORIG}" ]; then
    echo "Error: ${CONDUIT_ORIG} does not exist."
    exit 1
fi

if [ -f "${CONDUIT_FINAL}" ]; then
    read -p "Error: ${CONDUIT_FINAL} already exists. Do you want to overwrite it? (y/n) " answer
    if [ "$answer" != "y" ]; then
        exit 0
    fi
fi

cp ${CONDUIT_ORIG} ${CONDUIT_FINAL}

sed -i "s/your-algod-url:port/voit-follower:8080/g" ${CONDUIT_FINAL}
sed -i "s/contents of your algod.token file/${TOKEN}/g" ${CONDUIT_FINAL}
sed -i "s/admin-token: \"\"/admin-token: \"${ADMIN_TOKEN}\"/g" ${CONDUIT_FINAL}
sed -i "s/host= port=5432 user= password= dbname=/host=voit-postgres port=5432 user=${POSTGRES_USER} password=${POSTGRES_PASSWORD} dbname=${POSTGRES_DB}/g" ${CONDUIT_FINAL}

echo "Success: ${CONDUIT_FINAL} has been configured."