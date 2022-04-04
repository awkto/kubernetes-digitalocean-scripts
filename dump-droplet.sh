#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#id of droplet
DROPLET_ID=$1

#list all DROPLETs for your account
curl -s -X GET "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq .


