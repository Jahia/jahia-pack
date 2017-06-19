@echo off
@setlocal EnableDelayedExpansion

rem ------------------------------- USAGE -------------------------------------
set DX_USAGE=Usage: %~nx0 ^<file1^> [^<file2^> ... ^<fileN^>]^ [-s ^| --start]^

^

Installs the specified files using DX module management REST API.^

^

    file1 ... fileN - paths to files to be installed^

    If parameter '-s' or '--start' is specified, the bundles will be started after installing, otherwise they will only be installed.
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

set "bundlesParam="
set "count=0"
set "start=false"

for %%p in (%*) do (
    if "%%p" == "-s" (
        set "start=true"
    ) else if "%%p" == "--start" (
        set "start=true"
    ) else (
        set "bundlesParam=!bundlesParam! --form bundle=@%%p"
        set /A "count+=1"
    )
)

echo.
echo Installing %count% files
echo.
%DX_CURL_CMD% %CURL_OPTIONS% --request POST %bundlesParam% --form start=%start% %DX_REST_URL%
echo.

:end
@endlocal
exit /b %ERRORLEVEL%