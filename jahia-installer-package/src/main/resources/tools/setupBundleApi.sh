#!/usr/bin/env bash
DX_REST_URL=http://localhost:%{tomcat.httpPort}%{jahia.war.contextPath}/modules/api/bundles
DX_USERNAME=root
CURL_OPTIONS="-s --user $DX_USERNAME"

display_usage() {
    echo -e $DX_DISPLAY_USAGE
}

if [  $# -le 0 ]
then
	display_usage
	exit 1
fi

if [[ ( $# == "--help") ||  $# == "-h" ]]
then
	display_usage
	exit 0
fi
