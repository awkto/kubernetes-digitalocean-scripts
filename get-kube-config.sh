#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)
CLUSTERID=$1

#authenticate
curl -s -X GET "https://api.digitalocean.com/v2/kubernetes/clusters/$CLUSTERID/kubeconfig" \
	-H "Authorization: Bearer $DTOKEN" \
	| tee ~/.kube/config



