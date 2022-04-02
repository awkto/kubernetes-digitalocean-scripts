#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)
CLUSTERID=$1

#authenticate
curl -s -X DELETE "https://api.digitalocean.com/v2/kubernetes/clusters/$CLUSTERID/destroy_with_associated_resources/dangerous" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq .


