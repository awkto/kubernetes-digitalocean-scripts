#!/bin/bash

#NOTE THIS SCRIPT IS NOT WORKING YET FOR SOME REASON

#fetch token from local file
DTOKEN=$(cat .apikey)
DOMAIN_NAME=$(cat .defaultdomain|grep -v \#)
DNS_NAME=$1
DNS_VALUE=$2
DNS_TYPE="A"

#get DNS record ID
DNS_RECORD_ID=$( \
	curl -s -X GET "https://api.digitalocean.com/v2/domains/$DOMAIN_NAME/records?name=$1.dnsif.ca" \
        -H "Authorization: Bearer $DTOKEN" \
	| jq .domain_records[0].id \
)

#echo "DNS RECORD ID or IDS is : $DNS_RECORD_ID"

#replace DNS host record with new IP address
curl -s -X PUT "https://api.digitalocean.com/v2/domains/$DOMAIN_NAME/records/$DNS_RECORD_ID" \
	-H "Authorization: Bearer $DTOKEN" \
	-d '{"type":"'$DNS_TYPE'","name":"'$DNS_NAME'","data":"'$DNS_VALUE'"}' \
	| jq .
