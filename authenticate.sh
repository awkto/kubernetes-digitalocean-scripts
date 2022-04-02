#!/bin/bash

#fetch token from local file
DTOKEN=$(cat .apikey)

#authenticate
curl -X "https://api.digitalocean.com/v2/$OBJECT" \
	$HTTP_METHOD \
	-H "Authorization: Bearer $DTOKEN"


