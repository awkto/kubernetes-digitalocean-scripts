#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)
DOMAIN_NAME=$(cat .defaultdomain|grep -v \#)
DNS_NAME=$1
DNS_VALUE=$2
DNS_TYPE="A"

#get DNS record ID
DNS_RECORD_ID=$( \
	curl -s -X GET "https://api.digitalocean.com/v2/domains/$DOMAIN_NAME/records?name=$1.dnsif.ca" \
        -H "Authorization: Bearer $DTOKEN" \
	| jq .domain_records[0].id \
)

echo $DNS_RECORD_ID
