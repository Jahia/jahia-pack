#!/bin/sh

# ---------------------------------------------------------------------------
# Jahia settings
# ---------------------------------------------------------------------------

if [ -z "$JAHIA_JAVA_XMS" ]; then
  JAHIA_JAVA_XMS="2048m"
fi

if [ -z "$JAHIA_JAVA_XMX" ]; then
  JAHIA_JAVA_XMX="2048m"
fi

if [ -z "$JAHIA_JAVA_OPTS" ]; then
  JAHIA_JAVA_OPTS=""
fi

echo "Using JVM options: -Xms$JAHIA_JAVA_XMS -Xmx$JAHIA_JAVA_XMX $JAHIA_JAVA_OPTS"

CATALINA_OPTS="$CATALINA_OPTS -server -Xms$JAHIA_JAVA_XMS -Xmx$JAHIA_JAVA_XMX -Djava.awt.headless=true -verbose:gc -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks -Djava.net.preferIPv4Stack=true -Djavax.el.class-resolution.disableOnLowerCase=true $JAHIA_JAVA_OPTS"
CATALINA_OPTS="$CATALINA_OPTS -Dderby.system.home=%{derby.home.unix}"
CATALINA_OPTS="$CATALINA_OPTS -Dkaraf.handle.sigterm=false"
CATALINA_OPTS="$CATALINA_OPTS -Dlog4j2.formatMsgNoLookups=true"
CATALINA_OPTS="$CATALINA_OPTS -Djavax.xml.validation.SchemaFactory:http://www.w3.org/2001/XMLSchema=com.sun.org.apache.xerces.internal.jaxp.validation.XMLSchemaFactory -Djavax.xml.transform.TransformerFactory=com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl"
export CATALINA_OPTS
export CATALINA_PID=$CATALINA_HOME/temp/tomcat.pid
export JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS --add-opens=java.base/java.net=ALL-UNNAMED  --add-exports org.graalvm.truffle/com.oracle.truffle.api.nodes=ALL-UNNAMED --add-exports org.graalvm.truffle/com.oracle.truffle.api.instrumentation=ALL-UNNAMED --add-exports org.graalvm.truffle/com.oracle.truffle.api.dsl=ALL-UNNAMED --add-exports org.graalvm.truffle/com.oracle.truffle.api=ALL-UNNAMED --add-exports org.graalvm.truffle/com.oracle.truffle.api.exception=ALL-UNNAMED --add-exports org.graalvm.truffle/com.oracle.truffle.api.frame=ALL-UNNAMED --add-exports org.graalvm.truffle/com.oracle.truffle.api.object=ALL-UNNAMED --add-exports org.graalvm.truffle/com.oracle.truffle.api.interop=ALL-UNNAMED --add-exports org.graalvm.truffle/com.oracle.truffle.api.strings=ALL-UNNAMED --add-exports org.graalvm.truffle/com.oracle.truffle.api.library=ALL-UNNAMED"
