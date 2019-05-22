#! /bin/sh

usage () {
  echo "USAGE: $0 <vault address> <client token> <path>\n\$VAULT_PORT may be set, defaults to 8200"
}

if [ $# -lt 3 ];
then
    usage
    exit
fi
VAULT_ADDR=$1
VAULT_PORT=${VAULT_PORT:-8200}
ADDR_PORT=$VAULT_ADDR:$VAULT_PORT
set -x
curl --header "X-Vault-Token: $2 " $ADDR_PORT/v1/secret/$3
