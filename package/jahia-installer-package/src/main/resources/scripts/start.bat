@echo off
if "%OS%" == "Windows_NT" setlocal
echo ---------------------------------------------------------------------------
echo Starting Digital Experience Manager Server
echo ---------------------------------------------------------------------------

if "x%JAVA_HOME%" == "x" (
    echo JAVA_HOME environment variable is not defined. It is required for running the Digital Experience Manager Server.
	echo Please set JAVA_HOME environment variable to point to the directory with the your Java SE Development Kit.
	goto exit
) else (
  if not exist "%JAVA_HOME%" (
    echo JAVA_HOME "%JAVA_HOME%" path doesn't exist
	echo Please set JAVA_HOME environment variable to point to the directory with the your Java SE Development Kit.
    goto exit
  )
)

cd /d %~dp0\tomcat\bin

call startup.bat

goto end

:exit
if "x%DF_SOURCE_INSTALLER%" == "x" (
    pause
)
exit /b 1

:end
exit /b 0
