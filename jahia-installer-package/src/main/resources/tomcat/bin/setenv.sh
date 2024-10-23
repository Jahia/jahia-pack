#!/bin/sh

# ---------------------------------------------------------------------------
# Jahia settings
# ---------------------------------------------------------------------------

if [ -z "$JAHIA_JAVA_XMS" ] ; then
    JAHIA_JAVA_XMS="2048m"
fi

if [ -z "$JAHIA_JAVA_XMX" ] ; then
    JAHIA_JAVA_XMX="2048m"
fi

if [ -z "$JAHIA_JAVA_OPTS" ] ; then
    JAHIA_JAVA_OPTS=""
fi

echo "Using JVM options: -Xms$JAHIA_JAVA_XMS -Xmx$JAHIA_JAVA_XMX $JAHIA_JAVA_OPTS"

CATALINA_OPTS="$CATALINA_OPTS -server -Xms$JAHIA_JAVA_XMS -Xmx$JAHIA_JAVA_XMX -Djava.awt.headless=true -verbose:gc -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks -Djava.net.preferIPv4Stack=true -Djavax.el.class-resolution.disableOnLowerCase=true $JAHIA_JAVA_OPTS"
CATALINA_OPTS="$CATALINA_OPTS -Dderby.system.home=%{derby.home.unix}"
CATALINA_OPTS="$CATALINA_OPTS -Dkaraf.handle.sigterm=false"
CATALINA_OPTS="$CATALINA_OPTS -Dlog4j2.formatMsgNoLookups=true"


# Disable recycling of facade objects (Tomcat will create new facade object for each request.)
CATALINA_OPTS="$CATALINA_OPTS -Dorg.apache.catalina.connector.RECYCLE_FACADES=false"

export CATALINA_OPTS
export CATALINA_PID=$CATALINA_HOME/temp/tomcat.pid
