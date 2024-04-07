# Dockerfile
FROM algorand/algod:latest

ARG CHAIN

# Conditionally copy config.json
COPY ./config-$CHAIN.json /etc/algorand/config.json
COPY ./genesis.json /node/run/genesis/voitest-v1/genesis.json

RUN echo "Building algod follower node image for AVM chain: ${CHAIN}"
