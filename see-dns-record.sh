#!/bin/bash

envup() {
  local file=$([ -z "$1" ] && echo ".env" || echo ".env.$1")

  if [ -f ./$file ]; then
    set -a
    source ./$file
    set +a
  else
    echo "No $file file found" 1>&2
    return 1
  fi
}

envup

result=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records" \
     -H "Authorization: Bearer $CLOUDFLARE_TOKEN_DNS" \
     -H "Content-Type: application/json"
)

echo $result | jq '.result'