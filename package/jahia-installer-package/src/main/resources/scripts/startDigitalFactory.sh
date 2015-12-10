#!/bin/sh
echo ---------------------------------------------------------------------------
echo Starting Digital Experience Manager Server
echo ---------------------------------------------------------------------------

cd tomcat/bin
nohup ./startup.sh
tail -f ../logs/catalina.out