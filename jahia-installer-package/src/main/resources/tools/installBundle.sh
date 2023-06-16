#!/usr/bin/env bash
# example script to install a bundle using the Module management REST API

DX_DISPLAY_USAGE="Script to install a bundle using the Module management REST API.\n
if the second parameter is set to true, the bundle is started\n
optional third parameter to specify cluster node group, or local to deploy to a node individually. Installs to default cluster node group if left blank\n
\nUsage:\n$0 bundleFilePath  [ true ] [ target ]\n"

source ./setupBundleApi.sh

#deploy bundle REST call
echo Installing bundle file $1...
INSTALL_OUTPUT=`curl $CURL_OPTIONS --form bundle=@$1 --form start=$2 --form target=$3 $DX_REST_URL/`
echo "Install result=$INSTALL_OUTPUT"
