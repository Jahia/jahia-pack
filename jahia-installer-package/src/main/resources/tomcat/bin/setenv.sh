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

CATALINA_OPTS="$CATALINA_OPTS -server -Xms$JAHIA_JAVA_XMS -Xmx$JAHIA_JAVA_XMX -Djava.awt.headless=true -verbose:gc -Djava.net.preferIPv4Stack=true -Djavax.el.class-resolution.disableOnLowerCase=true"

# GC setup
CATALINA_OPTS="$CATALINA_OPTS -XX:+UseG1GC -XX:+DisableExplicitGC -XX:+UseStringDeduplication -XX:MaxTenuringThreshold=7"
CATALINA_OPTS="$CATALINA_OPTS -XX:+ParallelRefProcEnabled -XshowSettings:vm -XX:+UnlockDiagnosticVMOptions "
CATALINA_OPTS="$CATALINA_OPTS -XX:GuaranteedSafepointInterval=0 -XX:-UseBiasedLocking -XX:+UseCountedLoopSafepoints -XX:LoopStripMiningIter=100"
CATALINA_OPTS="$CATALINA_OPTS -XX:+SafepointTimeout -XX:SafepointTimeoutDelay=1000"

# Log/debug info
CATALINA_OPTS="$CATALINA_OPTS -Xlog:gc*,gc+ref=debug,gc+heap=debug,gc+age=trace:file=gc-%p-%t.log:tags,uptime,time,level:filecount=10,filesize=20m"
CATALINA_OPTS="$CATALINA_OPTS -Xlog:os+container=debug,pagesize=debug:file=os-container-pagesize-%p-%t.log:tags,uptime,time,level:filecount=10,filesize=20m"
CATALINA_OPTS="$CATALINA_OPTS -Xlog:safepoint*:file=safepoints-%p-%t.log:tags,uptime,time,level:filecount=10,filesize=20m"
CATALINA_OPTS="$CATALINA_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks"

# Support for JAHIA_JAVA_OPTS
CATALINA_OPTS="$CATALINA_OPTS $JAHIA_JAVA_OPTS"

CATALINA_OPTS="$CATALINA_OPTS -Dderby.system.home=%{derby.home.unix}"
CATALINA_OPTS="$CATALINA_OPTS -Dkaraf.handle.sigterm=false"
CATALINA_OPTS="$CATALINA_OPTS -Dlog4j2.formatMsgNoLookups=true"
CATALINA_OPTS="$CATALINA_OPTS -Djavax.xml.validation.SchemaFactory:http://www.w3.org/2001/XMLSchema=com.sun.org.apache.xerces.internal.jaxp.validation.XMLSchemaFactory -Djavax.xml.transform.TransformerFactory=com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl"

# Disable recycling of facade objects (Tomcat will create new facade object for each request.)
CATALINA_OPTS="$CATALINA_OPTS -Dorg.apache.catalina.connector.RECYCLE_FACADES=false"

export CATALINA_OPTS
export CATALINA_PID=$CATALINA_HOME/temp/tomcat.pid

# Module system flags better use JDK_JAVA_OPTIONS (processed at JVM startup)
# Set JVM modules access for some modules specific to Jahia/Karaf/GraalVM/etc...
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-modules=java.se"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-opens=java.base/jdk.internal.loader=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-opens=java.base/java.net=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-opens=java.base/java.lang=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-opens=java.base/java.nio=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-opens=java.base/sun.nio.ch=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-opens=java.management/sun.management=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-opens=jdk.management/com.sun.management.internal=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-exports=java.base/jdk.internal.ref=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-exports=org.graalvm.truffle/com.oracle.truffle.api.nodes=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-exports=org.graalvm.truffle/com.oracle.truffle.api.instrumentation=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-exports=org.graalvm.truffle/com.oracle.truffle.api.dsl=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-exports=org.graalvm.truffle/com.oracle.truffle.api=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-exports=org.graalvm.truffle/com.oracle.truffle.api.exception=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-exports=org.graalvm.truffle/com.oracle.truffle.api.frame=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-exports=org.graalvm.truffle/com.oracle.truffle.api.object=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-exports=org.graalvm.truffle/com.oracle.truffle.api.interop=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-exports=org.graalvm.truffle/com.oracle.truffle.api.strings=ALL-UNNAMED"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} --add-exports=org.graalvm.truffle/com.oracle.truffle.api.library=ALL-UNNAMED"
