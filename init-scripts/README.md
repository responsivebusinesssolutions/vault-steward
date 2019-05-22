Example scenario:

export VAULT_ADDR=demo-vault-tls-vault.default.svc.cluster.local

./init.sh $VAULT_ADDR vault-init.json

# Save keys and root token from output.

export VAULT_TOKEN=s.6e3PUzGJQae2jU3KHq1mWFiT

./unseal.sh $VAULT_ADDR 450d1e7a8a031c1a27b89c189797da5c3e2a1c37d63518c4ba8cd8f9ec6243e711
./unseal.sh $VAULT_ADDR 4a0637d11d5326535533465ba74eafacd395bc5b010e75e3248be46f82e4862f2b
./unseal.sh $VAULT_ADDR bcc71eadd65a77608b59593e6fcd441ca23e5f2f8b37b89842bcd76583045daeb1

# Vault is now unsealed.

./put-secret.sh $VAULT_ADDR $VAULT_TOKEN donttell vault-put.json
./get-secret.sh $VAULT_ADDR $VAULT_TOKEN donttell

# See more on Vault API here: https://www.vaultproject.io/api/system/index.html
