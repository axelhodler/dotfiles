#!/bin/sh

function gasLimit() {
  curl --silent -X POST --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["latest", true],"id":1}' localhost:8545 | jq .result.gasLimit | xargs printf '%d\n'
}

function gasPrice() {
  curl --silent -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":73}' localhost:8545 | jq .result | xargs printf '%d\n'
}

function accounts() {
  curl --silent -X POST --data '{"jsonrpc":"2.0","method":"eth_accounts","id":1}' localhost:8545 | jq .result
}
