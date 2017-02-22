#!/usr/bin/env bash
# Example script to get local info about bundles using the Module management REST API

DX_DISPLAY_USAGE="Script to get local info about bundles using the Module management REST API.\n
\n
Usage:\n
$0 bundleKey1 [bundleKey2 ... bundleKeyN]\n"

source ./setupBundleApi.sh

if [ $# -gt 1 ]; then
    bundleKeys=$(printf ",%s" $@)
    echo Gettng local info about bundles $bundleKeys ...
    OUTPUT=`curl $CURL_OPTIONS "$DX_REST_URL/\[$bundleKeys\]/_localInfo"`
else
    echo Gettng local info about bundle $1 ...
    OUTPUT=`curl $CURL_OPTIONS $DX_REST_URL/$1/_localInfo`
fi
echo "Info=$OUTPUT"

