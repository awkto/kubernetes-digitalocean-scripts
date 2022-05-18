#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)
KUBE_CLUSTER_ID=$1

#fetch the kubeconfig for a given kubernetes cluster
curl -s -X GET "https://api.digitalocean.com/v2/kubernetes/clusters/$KUBE_CLUSTER_ID/kubeconfig" \
	-H "Authorization: Bearer $DTOKEN" \
	-H "Content-Type: application/yaml" \
	| tee .kubeconfig | tee ~/.kube/config

