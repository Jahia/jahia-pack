#!/usr/bin/env bash
# example script to start a bundle using the Module management REST API
DX_DISPLAY_USAGE="Script to start a bundle using the Module management REST API.\n
\nUsage:\n$0 bundleName\n"
source ./setupBundleApi.sh

#start bundle REST call
echo Starting bundle $1...
DATA="target=$2";
START_OUTPUT=`curl $CURL_OPTIONS --data DATA --request POST $DX_REST_URL/$1/_start`
echo "Start result=$START_OUTPUT"