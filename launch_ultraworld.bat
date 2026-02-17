@echo off
title Ultra World Launcher
echo ============================================
echo        Ultra World - Game Launcher
echo ============================================
echo.
echo Starting Ultra World Server...
start "" /D "%~dp0server" "%~dp0server\uwserver.exe"
echo Server started successfully.
echo.
echo Starting Ultra World Client...
echo Connect to localhost to play on your local server,
echo or use the default server to play online.
echo.
start "" /D "%~dp0client" "%~dp0client\uw.exe"
echo.
echo ============================================
echo Both server and client are now running.
echo Share your IP address with friends so they
echo can connect to your server.
echo ============================================
echo.
echo Press any key to exit this launcher window...
pause >nul
