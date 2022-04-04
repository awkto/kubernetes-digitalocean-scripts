#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#list all DROPLETs for your account
curl -s -X GET "https://api.digitalocean.com/v2/droplets" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq .


