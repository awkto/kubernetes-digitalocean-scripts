#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#take in JSON payload template filename from arg
PAYLOAD=$1

#take in content of JSON payload template
PAYLOAD_IN=$(cat $1)

#this string should match the placeholder string in the template,
#we use this to dynamically place the SSH-KEY-ID into the JSON before we POST it
SSH_ID_HOOK="SSHKEYVAR"

#this is the actual SSH-ID key which is in a dotfile (excluded from GIT to keep code general)
SSH_KEY_ID=$(cat .sshkeyid | grep -v \#)

#finally, we generate a PAYLOAD with the explicit SSH-KEY added in
PAYLOAD_OUT=$(echo $PAYLOAD_IN | sed "s/$SSH_ID_HOOK/$SSH_KEY_ID/g")

#this creates the DROPLET
curl -s -X POST "https://api.digitalocean.com/v2/droplets" \
	-H "Authorization: Bearer $DTOKEN" \
	-H "Content-Type: application/json" \
	-d @$PAYLOAD \
	| jq .

