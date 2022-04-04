#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#list all DOMAINS
curl -s -X GET "https://api.digitalocean.com/v2/domains" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq .
