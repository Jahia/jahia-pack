@echo off
if "%OS%" == "Windows_NT" setlocal
echo ---------------------------------------------------------------------------
echo Stopping Digital Factory Server
echo ---------------------------------------------------------------------------

cd /d %~dp0\tomcat\bin
call shutdown.bat
exit /b 0