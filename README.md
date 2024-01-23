# Solidity compiler

A Dockerized version for the solidity compiler "solc" as there is no pre-compiled distro for `arm64` based devices.

The binary can be found under `/usr/local/bin/solc` in the image.

~~~bash
# Example use for version 0.8.20
$ docker run -it finatics/solidity-compiler:0.8.20 --version
~~~

## Build

~~~bash
# Specify a Solidity version - see https://github.com/ethereum/solidity/releases
$ export SOLIDITY_VERSION=0.8.20

# Build the image
$ docker build . -t finatics/solidity-compiler:$SOLIDITY_VERSION \
    --build-arg="SOLIDITY_VERSION=$SOLIDITY_VERSION"

# Push to your registry
$ docker login -u finatics
$ docker push finatics/solidity-compiler:$SOLIDITY_VERSION
~~~