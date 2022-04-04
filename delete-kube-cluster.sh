#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#cluster ID of kubernetes cluster to delete from digitalocean
CLUSTERID=$1

#delete the kubernetes cluster and all associated resources
curl -s -X DELETE "https://api.digitalocean.com/v2/kubernetes/clusters/$CLUSTERID/destroy_with_associated_resources/dangerous" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq .

