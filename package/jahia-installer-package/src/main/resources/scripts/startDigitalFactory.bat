@echo off
if "%OS%" == "Windows_NT" setlocal
echo ---------------------------------------------------------------------------
echo Starting Digital Factory Server
echo ---------------------------------------------------------------------------

cd /d %~dp0\tomcat\bin
call startup.bat
exit /b 0
