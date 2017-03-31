@echo off
echo ---------------------------------------------------------------------------
echo   Digital Experience Manager - Module Management
echo ---------------------------------------------------------------------------
if ""%1"" == """"  goto printUsage
if ""%1"" == ""--help""  goto printUsage
if ""%1"" == ""-h""  goto printUsage

set DX_CURL_CMD=curl.exe

if not exist "%DX_CURL_CMD%" (
    for %%X in ("%DX_CURL_CMD%") do (set DX_CURL_CMD_FOUND=%%~$PATH:X)
    if not defined DX_CURL_CMD_FOUND (
        echo.
        echo [ERROR] Unable to find the curl.exe executable.
        echo Please either add the path to curl.exe into your PATH environment variable or modify the %~nx0 script and set the DX_CURL_CMD to point to the curl.exe executable.
        exit /b 1
    )
)

set DX_REST_URL=http://localhost:%{tomcat.httpPort}%{jahia.war.contextPath}/modules/api/bundles
set DX_USERNAME=root
set CURL_OPTIONS=-s --user %DX_USERNAME%

echo.
echo Using DX_CURL_CMD: "%DX_CURL_CMD%"
echo Using DX_REST_URL: "%DX_REST_URL%"
echo Using DX_USERNAME: "%DX_USERNAME%"

goto end

:printUsage
if not "!DX_USAGE!" == "" (
    echo !DX_USAGE!
    exit /b 999
)

:end
exit /b 0

