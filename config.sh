#!/bin/bash
source .env

CONDUIT_ORIG="conduit.yml.orig"
CONDUIT_FINAL="conduit.yml.final"

cp ${CONDUIT_ORIG} ${CONDUIT_FINAL}

sed -i "s/your-algod-url:port/voit-follower:8080/g" ${CONDUIT_FINAL}
sed -i "s/contents of your algod.token file/${TOKEN}/g" ${CONDUIT_FINAL}
sed -i "s/admin-token: \"\"/admin-token: \"${ADMIN_TOKEN}\"/g" ${CONDUIT_FINAL}
sed -i "s/host= port=5432 user= password= dbname=/host=voit-postgres port=5432 user=${POSTGRES_USER} password=${POSTGRES_PASSWORD} dbname=${POSTGRES_DB}/g" ${CONDUIT_FINAL}

