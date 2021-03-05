#!/usr/bin/env bash
# example script to update a bundle using the Module management REST API
DX_DISPLAY_USAGE="Script to update a bundle using the Module management REST API.\n
\nUsage:\n$0 bundleName\n"
source ./setupBundleApi.sh

#update bundle REST call
echo Updating bundle $1...
DATA="target=$2";
UPDATE_OUTPUT=`curl $CURL_OPTIONS --data DATA --request POST $DX_REST_URL/$1/_update`
echo "Update result=$UPDATE_OUTPUT"
