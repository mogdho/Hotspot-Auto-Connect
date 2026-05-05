@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title Hotspot Auto-Connect
mode con: cols=100 lines=35
color 07

:: ========================================================================
:: USER CONFIGURATION - PLEASE UPDATE THIS VARIABLE
:: ========================================================================
:: Replace "Nothing Phone (2a)_7232" with your exact Wi-Fi/Hotspot name
set "WIFI_NAME=Nothing Phone (2a)_7232"
:: ========================================================================

:: Step 0: Check if already connected
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interfaces ^| findstr /C:"State"') do (
    set "wifiState=%%a"
    set "wifiState=!wifiState: =!"
    if /i "!wifiState!"=="connected" (
        echo [INFO] Already connected to a network. Exiting...
        timeout /t 3 >nul
        exit
    )
)

:: Step 1: Disconnect
echo [INFO] Disconnecting from current network...
netsh wlan disconnect >nul 2>&1

:: Step 2: Connection Loop
:connect_loop
cls
echo.
echo  ================================================================================
echo  [WAIT] Searching and connecting to !WIFI_NAME!...
echo  ================================================================================
echo.
netsh wlan connect name="!WIFI_NAME!" >nul 2>&1

timeout /t 3 /nobreak >nul
netsh wlan show interfaces | findstr /C:"!WIFI_NAME!" >nul
if %errorlevel% neq 0 (
    echo [RETRY] Hotspot not found. Retrying in 4 seconds...
    timeout /t 4 >nul
    goto connect_loop
)

:: Step 3: Success Screen
color 0A
echo.
echo           ██████╗ ██████╗ ███╗   ██╗███╗   ██╗███████╗ ██████╗████████╗███████╗██████╗ 
echo          ██╔════╝██╔═══██╗████╗  ██║████╗  ██║██╔════╝██╔════╝╚══██╔══╝██╔════╝██╔══██╗
echo          ██║     ██║   ██║██╔██╗ ██║██╔██╗ ██║█████╗  ██║        ██║   █████╗  ██║  ██║
echo          ██║     ██║   ██║██║╚██╗██║██║╚██╗██║██╔══╝  ██║        ██║   ██╔══╝  ██║  ██║
echo          ╚██████╗╚██████╔╝██║ ╚████║██║ ╚████║███████╗╚██████╗   ██║   ███████╗██████╔╝
echo           ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═╝   ╚══════╝╚═════╝ 
echo.
echo                                 [ STATUS: 200 OK ]
echo.

:: Step 4: Show connection details
echo  ────────────────────────────────────────────────────────────────────────────────
echo                                CONNECTION DETAILS
echo  ────────────────────────────────────────────────────────────────────────────────
echo.

:: Wait for DHCP to assign IP
echo    [SYSTEM] Fetching network configuration...
timeout /t 2 /nobreak >nul

for /f "tokens=2 delims=:" %%a in ('netsh wlan show interfaces ^| findstr /C:"Signal"') do echo    Signal Strength :%%a

:: Fetch public IP + geolocation via ip-api.com (plain text format)
set "PUB_IP=Unavailable" & set "CITY=—" & set "REGION=—" & set "COUNTRY=—" & set "ISP=—" & set "TZ=—"
set "counter=0"
for /f "delims=" %%a in ('curl.exe -s --max-time 5 "http://ip-api.com/line/?fields=query,city,regionName,country,isp,timezone" 2^>nul') do (
    set /a counter+=1
    if !counter!==1 set "PUB_IP=%%a"
    if !counter!==2 set "CITY=%%a"
    if !counter!==3 set "REGION=%%a"
    if !counter!==4 set "COUNTRY=%%a"
    if !counter!==5 set "ISP=%%a"
    if !counter!==6 set "TZ=%%a"
)
echo    Public IP       : !TZ!
echo    Location        : !CITY!, !REGION!
echo    ISP             : !ISP!

echo.
echo  ────────────────────────────────────────────────────────────────────────────────
echo.
echo  Press any key to exit...
pause >nul
exit
