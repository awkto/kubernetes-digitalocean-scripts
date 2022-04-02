#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#authenticate
curl -s -X GET "https://api.digitalocean.com/v2/1-clicks" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq .


