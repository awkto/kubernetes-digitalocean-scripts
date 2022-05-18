#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)
PAYLOAD=$1

#create the kubernetes cluster based on the PAYLOAD json file for specs
curl -s -X POST "https://api.digitalocean.com/v2/kubernetes/clusters" \
	-H "Authorization: Bearer $DTOKEN" \
	-H "Content-Type: application/json" \
	-d @$PAYLOAD \
	| jq . | tee .kube-cluster-json | jq .

echo "Cluster ID is : "$(cat .kube-cluster-json | jq .kubernetes_cluster.id | tee .kube-cluster-id)


