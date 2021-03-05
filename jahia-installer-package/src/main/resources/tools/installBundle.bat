@echo off
@setlocal EnableDelayedExpansion

rem ------------------------------- USAGE -------------------------------------
set DX_USAGE=Usage: %~nx0 ^<file^> [^<doStart^>]^

^

Installs the specified file using DX module management REST API.^

^

    file    - is a path to a file to be installed^

    doStart - "true" if the installed bundle should be also started or "false" in case it should be only installed.^

              This parameter is optional. If omitted, the value "false" is used.
rem ---------------------------------------------------------------------------

set "CURRENT_DIR=%~dp0%"
if exist "%CURRENT_DIR%setupBundleApi.bat" (
    call %CURRENT_DIR%setupBundleApi.bat %*
)

if not %ERRORLEVEL% == 0 (
    if %ERRORLEVEL% == 999 (
        rem we printed out the usage and can stop here
        @endlocal
        exit /b 0
    )
    goto end
)


echo.
echo Installing file: %1
echo.
%DX_CURL_CMD% %CURL_OPTIONS% --request POST --form bundle=@%1 --form start=%2 %DX_REST_URL%
echo.

:end
@endlocal
exit /b %ERRORLEVEL%