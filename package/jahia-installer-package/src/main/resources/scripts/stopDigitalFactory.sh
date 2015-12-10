#!/bin/sh
echo ---------------------------------------------------------------------------
echo Stopping Digital Experience Manager Server
echo ---------------------------------------------------------------------------

cd tomcat/bin
./shutdown.sh 60 -force