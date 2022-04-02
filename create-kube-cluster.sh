#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)
PAYLOAD=$1

#authenticate
curl -s -X POST "https://api.digitalocean.com/v2/kubernetes/clusters" \
	-H "Authorization: Bearer $DTOKEN" \
	-H "Content-Type: application/json" \
	-d @$PAYLOAD \
	| jq .


