#!/usr/bin/env bash
# Example script to get local info about bundles using the Module management REST API

DX_DISPLAY_USAGE="Script to get local info about bundles using the Module management REST API.\n
\n
Usage:\n
$0 bundleKey1 [bundleKey2 ... bundleKeyN]\n
\n
When passing a single bundle key, it may be supplied for special values:\n
* - retrieve info about all installed bundles\n
bundleName/* - retrieve info all installed versions of the bundle identified by the bundleName\n"

source ./setupBundleApi.sh

if [ $# -gt 1 ]; then
    bundleKeys=$(printf ",%s" $@)
    echo Getting local info about bundles $bundleKeys ...
    OUTPUT=`curl $CURL_OPTIONS "$DX_REST_URL/\[$bundleKeys\]/_localInfo"`
else
    echo Getting local info about bundle(s) $1 ...
    OUTPUT=`curl $CURL_OPTIONS $DX_REST_URL/$1/_localInfo`
fi
echo "Info=$OUTPUT"
