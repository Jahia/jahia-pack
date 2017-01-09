#!/usr/bin/env bash
# example script to install a bundle using the Module management REST API

DX_DISPLAY_USAGE="Script to install a bundle using the Module management REST API.\n
if the second parameter is set to true, the bundle is started\n
\nUsage:\n$0 bundleFilePath  [ true ]\n"

source ./setupBundleApi.sh

#deploy bundle REST call
echo Installing bundle file $1...
INSTALL_OUTPUT=`curl $CURL_OPTIONS --form bundle=@$1 --form start=$2 $DX_REST_URL/`
echo "Install result=$INSTALL_OUTPUT"
