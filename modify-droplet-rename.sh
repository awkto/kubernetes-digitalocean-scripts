#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#ID of droplet to rename
DROPLET_ID=$1
NEW_NAME=$2

#RENAME the DROPLET
curl -s -X POST "https://api.digitalocean.com/v2/droplets/$DROPLET_ID/actions" \
	-H "Authorization: Bearer $DTOKEN" \
	-H "Content-Type: application/json" \
	-d '{"type":"rename","name":"'$NEW_NAME'"}' \
	| jq .
