#!/bin/sh

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

public_ip=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records/$CLOUDFLARE_DNS_RECORD_ID" \
     -H "Authorization: Bearer $CLOUDFLARE_TOKEN_DNS" \
     -H "Content-Type: application/json"
)

public_ip=($(echo $public_ip | jq -r '.result.content'))

user=$([ -z "$1" ] && echo "root" || echo $1)
port=$([ -z "$2" ] && echo 22 || echo $2)
echo SSH to $user@$public_ip:$port...
ssh -p $port $user@$public_ip