#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#list all kubernetes clusters with their full config
curl -s -X GET "https://api.digitalocean.com/v2/kubernetes/clusters" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq .


