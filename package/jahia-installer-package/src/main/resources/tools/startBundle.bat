@echo off
@setlocal EnableDelayedExpansion

rem ------------------------------- USAGE -------------------------------------
set DX_USAGE=Usage: %~nx0 ^<bundleKey^>^

^

Starts the specified bundle using DX module management REST API.^

^

    bundleKey - is a fully qualified module key or a shortened one, in case the target module can be detected unambiguously.^

                Examples: org.jahia.modules/article/2.0.2, article/2.0.2, article
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
echo Starting bundle: %1
echo.
%DX_CURL_CMD% %CURL_OPTIONS% --request POST --data "" %DX_REST_URL%/%1/_start
echo.

:end
@endlocal
exit /b %ERRORLEVEL%