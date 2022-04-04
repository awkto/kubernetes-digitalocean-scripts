#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#ID of droplet to delete
DROPLET_ID=$1

#DELETE the DROPLET
curl -s -X DELETE "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" \
	-H "Authorization: Bearer $DTOKEN" \
	-H "Content-Type: application/json" \
	| jq .

