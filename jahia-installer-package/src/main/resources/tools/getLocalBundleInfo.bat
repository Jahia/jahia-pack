@echo off
@setlocal EnableDelayedExpansion

rem ------------------------------- USAGE -------------------------------------
set DX_USAGE=Usage: %~nx0 ^<bundleKey1^>[ ^<bundleKey2^> ^<bundleKey3^>...]^

^

Retrieves the state information for the specified bundle(s) using DX module management REST API.^

^

    bundleKey1 - is a fully qualified module key or a shortened one (including version),^

                 in case the target module can be detected unambiguously.^

                 In case of multiple bundle keys, separate them with a space.^

                 When passing a single module key, it may be supplied for special values:^

                 ^* - retrieve states of all installed modules^

                 ^<bundleName^>/* - retrieve states of all installed versions of the module identified by the bundleName^

                 Examples: org.jahia.modules/article/2.0.2, article/2.0.2, org.jahia.modules/article/*, article/*, *
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
echo Getting information for bundle(s): %*
echo.

rem replace spaces with commas
set bundleKeys=%*
set bundleKeys=%bundleKeys: =,%

if "%2" == "" (
    %DX_CURL_CMD% %CURL_OPTIONS% %DX_REST_URL%/%1/_localInfo
) else (
    %DX_CURL_CMD% %CURL_OPTIONS% %DX_REST_URL%/^%5B%bundleKeys%^%5D]/_localInfo
)
echo.

:end
@endlocal
exit /b %ERRORLEVEL%