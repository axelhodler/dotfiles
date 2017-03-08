#!/bin/sh

function isChainRunning() {
  curl --silent localhost:8545 > /dev/null
  if [ $? -ne 0 ]; then
    echo "Could not connect to ethereum blockchain"
  fi
}

function gasLimit() {
  isChainRunning
  curl --silent -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["latest", true],"id":1}' localhost:8545 | jq .result.gasLimit | xargs printf '%d\n'
}

function gasPrice() {
  curl --silent -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":73}' localhost:8545 | jq .result | xargs printf '%d\n'
}

function accounts() {
  curl --silent -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_accounts","id":1}' localhost:8545 | jq .result
}
