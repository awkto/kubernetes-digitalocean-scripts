#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)
DOMAIN_NAME=$(cat .defaultdomain | grep -v \#)
DNS_RECORD_NAME=$1

echo "DOMAIN NAME IS $DOMAIN_NAME"
echo "DNS RECORD NAME IS $DNS_RECORD_NAME"

#dump all DNS records for a domain
curl -s -X GET "https://api.digitalocean.com/v2/domains/$DOMAIN_NAME/records?name=$1.$DOMAIN_NAME" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq .
