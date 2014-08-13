rem ---------------------------------------------------------------------------
rem Digital Factory settings
rem ---------------------------------------------------------------------------

set CATALINA_OPTS=%CATALINA_OPTS% -Dsun.io.useCanonCaches=false -Xms1152m -Xmx1152m -XX:MaxPermSize=256m -server -verbose:gc -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks -Djava.net.preferIPv4Stack=true
set CATALINA_OPTS=%CATALINA_OPTS% -Dderby.system.home="%{derby.home.win}"
