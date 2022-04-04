#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#list all SSH keys saved in your digitalocean account
curl -s -X GET "https://api.digitalocean.com/v2/account/keys" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq .


