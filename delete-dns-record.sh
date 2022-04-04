#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)
DOMAIN_NAME=$(cat .defaultdomain|grep -v \#)
DNS_NAME=$1

#get DNS record ID
DNS_RECORD_ID_LIST=$( \
	curl -s -X GET "https://api.digitalocean.com/v2/domains/$DOMAIN_NAME/records?name=$1.dnsif.ca" \
        -H "Authorization: Bearer $DTOKEN" \
	| jq .domain_records[].id \
)

#echo $DNS_RECORD_ID_LIST | jq .

#delete DNS Records iteratively (when multiple A records exist, for example)
for DNS_RECORD_ID in $DNS_RECORD_ID_LIST; do \
	curl -s -X DELETE "https://api.digitalocean.com/v2/domains/$DOMAIN_NAME/records/$DNS_RECORD_ID" \
	-H "Authorization: Bearer $DTOKEN" \
	| jq . ; \
done

