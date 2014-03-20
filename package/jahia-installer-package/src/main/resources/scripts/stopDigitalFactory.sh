#!/bin/sh
echo ---------------------------------------------------------------------------
echo Stopping Digital Factory Server
echo ---------------------------------------------------------------------------

cd tomcat/bin
./shutdown.sh 60 -force