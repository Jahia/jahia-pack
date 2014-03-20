#!/bin/sh
echo ---------------------------------------------------------------------------
echo Starting Digital Factory Server
echo ---------------------------------------------------------------------------

cd tomcat/bin
./startup.sh
tail -f ../logs/catalina.out