#!/usr/bin/env bash
# example script to refresh a bundle using the Module management REST API
DX_DISPLAY_USAGE="Script to refresh a bundle using the Module management REST API.\n
\nUsage:\n$0 bundleName\n"
source ./setupBundleApi.sh

#refresh bundle REST call
echo Refreshing bundle $1...
DATA="target=$2";
REFRESH_OUTPUT=`curl $CURL_OPTIONS --data DATA --request POST $DX_REST_URL/$1/_refresh`
echo "Refresh result=$REFRESH_OUTPUT"
