#!/bin/sh

# ---------------------------------------------------------------------------
# Digital Experience Manager settings
# ---------------------------------------------------------------------------

if [ -z "$JAHIA_JAVA_OPTS" ] ; then
    JAHIA_JAVA_OPTS="-Xms2048m -Xmx2048m"
    echo "JAHIA_JAVA_OPTS environment variable is not set. Using default options: $JAHIA_JAVA_OPTS"
fi

CATALINA_OPTS="$CATALINA_OPTS -server -Djava.awt.headless=true -verbose:gc -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks -Djava.net.preferIPv4Stack=true $JAHIA_JAVA_OPTS"
CATALINA_OPTS="$CATALINA_OPTS -Dderby.system.home=%{derby.home.unix}"
export CATALINA_OPTS
export CATALINA_PID=$CATALINA_HOME/temp/tomcat.pid
