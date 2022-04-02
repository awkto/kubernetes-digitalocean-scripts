#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#authenticate
curl -s -X GET "https://api.digitalocean.com/v2/kubernetes/clusters" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq -r '.kubernetes_clusters[] | "\(.id) \(.name) \(.status)"'


