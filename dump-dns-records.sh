#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)
DOMAIN_NAME=$1

#dump all DNS records for a domain
curl -s -X GET "https://api.digitalocean.com/v2/domains/$DOMAIN_NAME/records" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq .
