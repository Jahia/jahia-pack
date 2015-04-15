#!/bin/sh

# ---------------------------------------------------------------------------
# Digital Factory settings
# ---------------------------------------------------------------------------

CATALINA_OPTS="$CATALINA_OPTS -server -Xms2048m -Xmx2048m -XX:MaxPermSize=384m -Djava.awt.headless=true -verbose:gc -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks -Djava.net.preferIPv4Stack=true"
CATALINA_OPTS="$CATALINA_OPTS -Dderby.system.home=%{derby.home.unix}"
export CATALINA_OPTS
export CATALINA_PID=$CATALINA_HOME/temp/tomcat.pid
