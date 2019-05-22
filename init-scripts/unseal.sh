#! /bin/sh

usage () {
  echo "USAGE: $0 <vault address> <key>\nKeys must be supplied repeatedly until threshold # of keys have been sent.\n\$VAULT_PORT may be set, defaults to 8200"
}

if [ $# -lt 2 ];
then
    usage
    exit
fi
VAULT_ADDR=$1
VAULT_PORT=${VAULT_PORT:-8200}
ADDR_PORT=$VAULT_ADDR:$VAULT_PORT
set -x
curl $ADDR_PORT/v1/sys/seal-status
curl -X PUT $ADDR_PORT/v1/sys/unseal --data '{"key": "'$2'"}'
