#! /bin/sh

usage () {
  echo "USAGE: $0 <vault address> <payload file>\n\$VAULT_PORT may be set, defaults to 8200"
  exit 
}

if [ $# -lt 2  ];
  then usage
fi



VAULT_ADDR=$1
VAULT_PORT=${VAULT_PORT:-8200}
PAYLOAD_FILE=$2
ADDR_PORT=$VAULT_ADDR:$VAULT_PORT

curl $ADDR_PORT/v1/sys/init
curl -X PUT $ADDR_PORT/v1/sys/init --data @$PAYLOAD_FILE
