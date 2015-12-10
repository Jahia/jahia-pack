@echo off
if "%OS%" == "Windows_NT" setlocal
echo ---------------------------------------------------------------------------
echo Stopping Digital Experience Manager Server
echo ---------------------------------------------------------------------------

cd /d %~dp0\tomcat\bin
call shutdown.bat
exit /b 0