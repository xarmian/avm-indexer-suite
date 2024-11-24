# Dockerfile
FROM algorand/algod:latest

ARG NETWORK

# Conditionally copy config.json based on network
COPY ./config-$([[ "$NETWORK" == "voitest-v1.0" || "$NETWORK" == "voimain-v1.0" ]] && echo "$NETWORK" || echo "ALGORAND").json /etc/algorand/config.json
COPY ./genesis-voi-testnet.json /node/run/genesis/voitest-v1.0/genesis.json
COPY ./genesis-voi-mainnet.json /node/run/genesis/voimain-v1.0/genesis.json

RUN echo "Building algod follower node image for AVM chain: ${NETWORK}"
