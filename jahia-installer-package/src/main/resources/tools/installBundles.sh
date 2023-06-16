#!/usr/bin/env bash
# example script to install a bundle using the Module management REST API

DX_DISPLAY_USAGE="Script to install multiple bundles using the Module management REST API.\n
if parameter '-s' or '--start' is specified, the bundles are started\n
optional parameter '--target=<target-name>' to specify cluster node group, or local to deploy to a node individually\n
\nUsage:\n$0 bundleFilePath [bundleFilePathZ ... bundleFilePathN] [ -s | --start ]\n"

source ./setupBundleApi.sh

bundlesParam=
count=0
start=false
target=

while [ "$1" != "" ]; do
    case $1 in
        -s | --start )          start=true
                                ;;
        --target=* )            target="${1#*=}"
                                ;;
        * )                     bundlesParam="$bundlesParam --form bundle=@$1"
                                count=$((count+1))
                                ;;
    esac
    shift
done

# if no bundles display usage
if [ $count -le 0 ]; then
    display_usage
fi

#deploy bundles REST call
echo "Installing $count bundles files ..."
INSTALL_OUTPUT=`curl $CURL_OPTIONS $bundlesParam --form start=$start --form target=$target $DX_REST_URL/`
echo "Install result=$INSTALL_OUTPUT"