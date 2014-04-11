#!/bin/sh
echo ---------------------------------------------------------------------------
echo Starting Digital Factory Server
echo ---------------------------------------------------------------------------

cd tomcat/bin
nohup ./startup.sh
tail -f ../logs/catalina.out