#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)
KUBE_CLUSTER_ID=$1
#list all kubernetes clusters with their full config
curl -s -X GET "https://api.digitalocean.com/v2/kubernetes/clusters/$KUBE_CLUSTER_ID" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq .


