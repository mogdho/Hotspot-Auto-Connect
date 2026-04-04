@echo off
:: Changing code page to UTF-8 for safe ASCII rendering
chcp 65001 >nul
title Hotspot Auto-Connect
mode con: cols=100 lines=30
color 07

:: =====================================================================
:: USER CONFIGURATION SECTION - PLEASE UPDATE THIS VARIABLE
:: =====================================================================
:: Replace "Nothing Phone (2a)_7232" with your exact Wi-Fi/Hotspot name
set "WIFI_NAME=Nothing Phone (2a)_7232"
:: =====================================================================

:: Step 1: Disconnect any existing Wi-Fi connection
echo [INFO] Disconnecting from current network...
netsh wlan disconnect >nul 2>&1

:: Step 2: Connection Loop
:connect_loop
:: The screen clears only during the retry phase to prevent spamming the console
cls
echo.
echo  ================================================================================
echo  [WAIT] Searching and connecting to %WIFI_NAME%...
echo  ================================================================================
echo.
netsh wlan connect name="%WIFI_NAME%" >nul 2>&1

:: Check connection status
timeout /t 2 /nobreak >nul
netsh wlan show interfaces | findstr /C:"%WIFI_NAME%" >nul
if %errorlevel% neq 0 (
    echo [RETRY] Hotspot not found. Retrying in 3 seconds...
    timeout /t 3 >nul
    goto connect_loop
)

:: Step 3: Success Screen with Safe UTF-8 Block Font (Centered)
:: 'cls' has been removed so previous actions remain visible
color 0A
echo.
echo             ██████╗ ██████╗ ███╗   ██╗███╗   ██╗███████╗ ██████╗████████╗███████╗██████╗ 
echo            ██╔════╝██╔═══██╗████╗  ██║████╗  ██║██╔════╝██╔════╝╚══██╔══╝██╔════╝██╔══██╗
echo            ██║     ██║   ██║██╔██╗ ██║██╔██╗ ██║█████╗  ██║        ██║   █████╗  ██║  ██║
echo            ██║     ██║   ██║██║╚██╗██║██║╚██╗██║██╔══╝  ██║        ██║   ██╔══╝  ██║  ██║
echo            ╚██████╗╚██████╔╝██║ ╚████║██║ ╚████║███████╗╚██████╗   ██║   ███████╗██████╔╝
echo             ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═╝   ╚══════╝╚═════╝ 
echo.
echo                                 [ STATUS: CONNECTED ]
echo.
timeout /t 2 /nobreak >nul
exit
