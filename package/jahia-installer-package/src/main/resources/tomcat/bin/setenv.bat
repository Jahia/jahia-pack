rem ---------------------------------------------------------------------------
rem Digital Factory settings
rem ---------------------------------------------------------------------------

set CATALINA_OPTS=%CATALINA_OPTS% -Dsun.io.useCanonCaches=false -Xms2g -Xmx2g -XX:MaxPermSize=384m -server -verbose:gc -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks -Djava.net.preferIPv4Stack=true
set CATALINA_OPTS=%CATALINA_OPTS% -Dderby.system.home="%{derby.home.win}"
