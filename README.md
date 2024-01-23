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

# Login to the registry
$ docker login -u finatics
~~~

### Build and push ARM64 or AARM64 on Macbook M2

~~~bash
$ docker build . -t finatics/solidity-compiler-arm64:$SOLIDITY_VERSION \
    --build-arg="SOLIDITY_VERSION=$SOLIDITY_VERSION" \
    --platform linux/arm64/v8

$ docker push finatics/solidity-compiler-arm64:$SOLIDITY_VERSION
~~~

### Build and push for x86_64 or amd64 on Macbook Intel

~~~bash
$ docker build . -t finatics/solidity-compiler-amd64:$SOLIDITY_VERSION \
    --build-arg="SOLIDITY_VERSION=$SOLIDITY_VERSION" \
    --platform linux/amd64

$ docker push finatics/solidity-compiler-amd64:$SOLIDITY_VERSION
~~~

### Multi architecture manifest

~~~bash
$ docker manifest create finatics/solidity-compiler:$SOLIDITY_VERSION \
    finatics/solidity-compiler-arm64:$SOLIDITY_VERSION \
    finatics/solidity-compiler-amd64:$SOLIDITY_VERSION

$ docker manifest push finatics/solidity-compiler:$SOLIDITY_VERSION
~~~