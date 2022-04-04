#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)
DOMAIN_NAME=$(cat .defaultdomain|grep -v \#)
DNS_NAME=$1
DNS_TYPE=$2
DNS_VALUE=$3

#create DNS Record
curl -s -X POST "https://api.digitalocean.com/v2/domains/$DOMAIN_NAME/records" \
	-H "Authorization: Bearer $DTOKEN" \
	-d '{"type":"'$DNS_TYPE'","name":"'$DNS_NAME'","data":"'$DNS_VALUE'"}' \
	| jq .
