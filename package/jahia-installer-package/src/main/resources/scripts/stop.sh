#!/bin/sh
echo ---------------------------------------------------------------------------
echo Stopping Jahia Server
echo ---------------------------------------------------------------------------

cd tomcat/bin
./shutdown.sh 60 -force