rem ---------------------------------------------------------------------------
rem Jahia settings
rem ---------------------------------------------------------------------------

if "x%JAHIA_JAVA_XMS%" == "x" (
    set JAHIA_JAVA_XMS=2048m
)

if "x%JAHIA_JAVA_XMX%" == "x" (
    set JAHIA_JAVA_XMX=2048m
)

if "x%JAHIA_JAVA_OPTS%" == "x" (
    set JAHIA_JAVA_OPTS=
)

echo Using JVM options: "-Xms%JAHIA_JAVA_XMS% -Xmx%JAHIA_JAVA_XMX% %JAHIA_JAVA_OPTS%"

set CATALINA_OPTS=%CATALINA_OPTS% -Dsun.io.useCanonCaches=false -server -Xms%JAHIA_JAVA_XMS% -Xmx%JAHIA_JAVA_XMX% -verbose:gc -Djava.net.preferIPv4Stack=true -Djavax.el.class-resolution.disableOnLowerCase=true

:: GC settings
set CATALINA_OPTS=%CATALINA_OPTS% -XX:+UseG1GC -XX:+DisableExplicitGC -XX:+UseStringDeduplication -XX:MaxTenuringThreshold=7
set CATALINA_OPTS=%CATALINA_OPTS% -XX:+ParallelRefProcEnabled -XshowSettings:vm -XX:+UnlockDiagnosticVMOptions 
set CATALINA_OPTS=%CATALINA_OPTS% -XX:GuaranteedSafepointInterval=0 -XX:-UseBiasedLocking -XX:+UseCountedLoopSafepoints -XX:LoopStripMiningIter=100
set CATALINA_OPTS=%CATALINA_OPTS% -XX:+SafepointTimeout -XX:SafepointTimeoutDelay=1000

:: Log/debug info
set CATALINA_OPTS=%CATALINA_OPTS% -Xlog:gc*,gc+ref=debug,gc+heap=debug,gc+age=trace:file=gc-%%p-%%t.log:tags,uptime,time,level:filecount=10,filesize=20m
set CATALINA_OPTS=%CATALINA_OPTS% -Xlog:os+container=debug,pagesize=debug:file=os-container-pagesize-%%p-%%t.log:tags,uptime,time,level:filecount=10,filesize=20m
set CATALINA_OPTS=%CATALINA_OPTS% -Xlog:safepoint*:file=safepoints-%%p-%%t.log:tags,uptime,time,level:filecount=10,filesize=20m
set CATALINA_OPTS=%CATALINA_OPTS% -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks

:: Support for JAHIA_JAVA_OPTS
set CATALINA_OPTS=%CATALINA_OPTS% %JAHIA_JAVA_OPTS%

set CATALINA_OPTS=%CATALINA_OPTS% -Dderby.system.home="%{derby.home.win}"
set CATALINA_OPTS=%CATALINA_OPTS% -Dlog4j2.formatMsgNoLookups=true
set CATALINA_OPTS=%CATALINA_OPTS% -Djavax.xml.validation.SchemaFactory:http://www.w3.org/2001/XMLSchema=com.sun.org.apache.xerces.internal.jaxp.validation.XMLSchemaFactory -Djavax.xml.transform.TransformerFactory=com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl

:: Disable recycling of facade objects (Tomcat will create new facade object for each request.)
set CATALINA_OPTS=%CATALINA_OPTS% -Dorg.apache.catalina.connector.RECYCLE_FACADES=false

:: Module system flags better use JDK_JAVA_OPTIONS (processed at JVM startup)
:: Set JVM modules access for some modules specific to Jahia/Karaf/GraalVM/etc...
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-modules=java.se
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-opens=java.base/jdk.internal.loader=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-opens=java.base/java.net=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-opens=java.base/java.lang=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-opens=java.base/java.nio=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-opens=java.base/sun.nio.ch=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-opens=java.management/sun.management=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-opens=jdk.management/com.sun.management.internal=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-exports=java.base/jdk.internal.ref=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-exports=org.graalvm.truffle/com.oracle.truffle.api.nodes=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-exports=org.graalvm.truffle/com.oracle.truffle.api.instrumentation=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-exports=org.graalvm.truffle/com.oracle.truffle.api.dsl=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-exports=org.graalvm.truffle/com.oracle.truffle.api=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-exports=org.graalvm.truffle/com.oracle.truffle.api.exception=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-exports=org.graalvm.truffle/com.oracle.truffle.api.frame=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-exports=org.graalvm.truffle/com.oracle.truffle.api.object=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-exports=org.graalvm.truffle/com.oracle.truffle.api.interop=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-exports=org.graalvm.truffle/com.oracle.truffle.api.strings=ALL-UNNAMED
set JDK_JAVA_OPTIONS=%JDK_JAVA_OPTIONS% --add-exports=org.graalvm.truffle/com.oracle.truffle.api.library=ALL-UNNAMED
