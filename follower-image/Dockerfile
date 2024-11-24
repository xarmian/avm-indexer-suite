# Dockerfile
FROM algorand/algod:latest

ARG NETWORK
ARG CONFIG_FILE

# Copy the appropriate config file
COPY ./${CONFIG_FILE} /etc/algorand/config.json
COPY ./genesis-voi-testnet.json /node/run/genesis/voitest-v1.0/genesis.json
COPY ./genesis-voi-mainnet.json /node/run/genesis/voimain-v1.0/genesis.json

RUN echo "Building algod follower node image for AVM chain: ${NETWORK}"
