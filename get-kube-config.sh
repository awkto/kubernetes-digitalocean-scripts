#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#cluster ID of cluster for which to fetch kube config
CLUSTERID=$1

#grab the kube config file and save it on local user's home folder
curl -s -X GET "https://api.digitalocean.com/v2/kubernetes/clusters/$CLUSTERID/kubeconfig" \
	-H "Authorization: Bearer $DTOKEN" \
	| tee ~/.kube/config



