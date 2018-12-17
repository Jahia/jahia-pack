rem ---------------------------------------------------------------------------
rem Digital Experience Manager settings
rem ---------------------------------------------------------------------------

if "x%JAHIA_JAVA_OPTS%" == "x" (
    set JAHIA_JAVA_OPTS=-Xms2048m -Xmx2048m
    echo JAHIA_JAVA_OPTS environment variable is not set. Using default options: %JAHIA_JAVA_OPTS%
)

set CATALINA_OPTS=%CATALINA_OPTS% -Dsun.io.useCanonCaches=false -server -verbose:gc -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks -Djava.net.preferIPv4Stack=true %JAHIA_JAVA_OPTS%
set CATALINA_OPTS=%CATALINA_OPTS% -Dderby.system.home="%{derby.home.win}"
