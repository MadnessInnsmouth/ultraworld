@echo off
title Ultra World Server
echo ============================================
echo       Ultra World - Server Launcher
echo ============================================
echo.
echo Starting server on port 6200...
echo Share your IP address with friends so they
echo can connect to your server.
echo.
echo Close this window to stop the server.
echo ============================================
echo.
cd /D "%~dp0server"
"%~dp0server\uwserver.exe"
