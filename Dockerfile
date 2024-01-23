# inject configurable build images
ARG BUILD_IMAGE=ubuntu:20.04
ARG RUNTIME_IMAGE=ubuntu:20.04

FROM ${BUILD_IMAGE} as builder

RUN apt update && apt -y upgrade
RUN apt -y install curl cmake 
RUN apt -y install libboost-all-dev g++

RUN mkdir /build

ARG SOLIDITY_VERSION=0.8.20
RUN curl -L https://github.com/ethereum/solidity/releases/download/v${SOLIDITY_VERSION}/solidity_${SOLIDITY_VERSION}.tar.gz | tar -xz  -C /build/

WORKDIR /build/solidity_${SOLIDITY_VERSION}
ENV CI true
RUN ./scripts/build.sh
RUN mkdir /dist && cp  /build/solidity_${SOLIDITY_VERSION}/build/solc/solc /dist

# runtime image
FROM ${RUNTIME_IMAGE} as runtime

# copy the custom build solidity compiler
COPY --from=builder /dist/solc /usr/local/bin

ENTRYPOINT ["/usr/local/bin/solc"]
