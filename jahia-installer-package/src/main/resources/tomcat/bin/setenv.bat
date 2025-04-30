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

set CATALINA_OPTS=%CATALINA_OPTS% -Dsun.io.useCanonCaches=false -server -Xms%JAHIA_JAVA_XMS% -Xmx%JAHIA_JAVA_XMX% -verbose:gc -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks -Djava.net.preferIPv4Stack=true -Djavax.el.class-resolution.disableOnLowerCase=true %JAHIA_JAVA_OPTS%
set CATALINA_OPTS=%CATALINA_OPTS% -Dderby.system.home="%{derby.home.win}"
set CATALINA_OPTS=%CATALINA_OPTS% -Dlog4j2.formatMsgNoLookups=true

:: Disable recycling of facade objects (Tomcat will create new facade object for each request.)
set CATALINA_OPTS=%CATALINA_OPTS% -Dorg.apache.catalina.connector.RECYCLE_FACADES=false
