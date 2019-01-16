#!/bin/sh

# ---------------------------------------------------------------------------
# Digital Experience Manager settings
# ---------------------------------------------------------------------------

CATALINA_OPTS="$CATALINA_OPTS -server -Xms2048m -Xmx2048m -Djava.awt.headless=true -verbose:gc -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks -Djava.net.preferIPv4Stack=true"
CATALINA_OPTS="$CATALINA_OPTS -Dderby.system.home=%{derby.home.unix}"
CATALINA_OPTS="$CATALINA_OPTS -Dkaraf.handle.sigterm=false"
export CATALINA_OPTS
export CATALINA_PID=$CATALINA_HOME/temp/tomcat.pid
