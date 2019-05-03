@echo off
:: User Command Tools 2.2
:: https://github.com/Justin-Lund/

:Start
cls
title User Command Tools 2.2
c:
cd\


echo 1. Get I.P. Address
echo 2. Get Computer System Information
echo 3. Force Group Policy Update
echo 4. Renew I.P. Address ^& Reset TCP/IP
echo 5. Clear Internet Explorer Cache and Cookies
echo 6. Clear Cached Credentials
echo 7. Clear Skype Cache
echo 8. Clear All Cache
echo 9. Clear/Reset Everything
echo.

CHOICE /C 123456789 /M "Enter your choice:"

IF ERRORLEVEL 9 GOTO ClearEverything
IF ERRORLEVEL 8 GOTO ClearAllCache
IF ERRORLEVEL 7 GOTO ClearSkypeCache
IF ERRORLEVEL 6 GOTO ClearCachedCredentials
IF ERRORLEVEL 5 GOTO ClearIECache
IF ERRORLEVEL 4 GOTO IPRenew
IF ERRORLEVEL 3 GOTO GPUpdate
IF ERRORLEVEL 2 GOTO SystemInfo
IF ERRORLEVEL 1 GOTO IPConfig


:IPConfig
cls
title I.P. Configuration
ipconfig|findstr /i /c:"Ethernet" /c:"Wireless" /c:"IPv4"

echo.
pause
GOTO Start


:SystemInfo
cls
title Computer System Information
systeminfo|findstr /i /c:"Host Name" /c:"OS Name" /c:"OS Version" /c:"Original Install Date" /c:"System Boot Time" /c:"System Up Time" /c:"System Manufacturer" /c:"System Model" /c:"System Type" /c:"Total Physical Memory"

echo.
pause
GOTO Start


:GPUpdate
cls
title Forcing Group Policy Update

echo n | gpupdate /force

cls
title Group Policy Update Complete

echo Group Policy Update Complete.
echo Please note that most changes will not take effect until you have rebooted.
echo It is strongly recommended that you reboot now.

echo.
pause
GOTO Start


:IPRenew
cls
title Renewing I.P. Address ^& Resetting TCP/IP

echo Releasing I.P. Address
echo.

ipconfig /release

cls
echo I.P. Address Released

timeout /t 8
cls

echo Renewing I.P. Address
ipconfig /renew

cls
echo I.P. Address Renewed

echo.
echo ************************************************
echo.

echo Flushing DNS

ipconfig /flushdns

echo.
echo ************************************************
echo.

echo Resetting TCP/IP
echo.

netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset
echo.

cls
title I.P. Address Renewed ^& TCP/IP Reset
echo IP Address Renewed ^& TCP/IP Reset

echo.
pause
GOTO Start


:ClearIECache
cls
title Clearing Internet Explorer Cache and Cookies

echo Clearing Internet Explorer Cache and Cookies

RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 

cls
title Internet Explorer Cache and Cookies Cleared

echo Internet Explorer cache and cookies cleared
echo.
pause
GOTO Start


:ClearCachedCredentials
cls
title Clearing Locally Cached Credentials

echo Clearing Locally Cached Credentials

cmdkey.exe /list > "%TEMP%\List.txt"
findstr.exe Target "%TEMP%\List.txt" > "%TEMP%\tokensonly.txt"
FOR /F "tokens=1,2 delims= " %%G IN (%TEMP%\tokensonly.txt) DO cmdkey.exe /delete:%%H
del "%TEMP%\List.txt" /s /f /q
del "%TEMP%\tokensonly.txt" /s /f /q

cls
title Locally Cached Credentials Cleared

echo Credentials cleared

echo.
pause
GOTO Start


:ClearSkypeCache
cls
title Clearing Skype Cache

Set /p Proceed=Proceeding will close Skype and Outlook. Ok to proceed? (Y/N)
if /i "%Proceed%" Neq "Y" GOTO Start

TaskKill /f /im "lync.exe"
TaskKill /f /im "outlook.exe"
cls
echo y | rmdir %localappdata%\Microsoft\Office\13.0\Lync /s
echo y | rmdir %localappdata%\Microsoft\Office\14.0\Lync /s
echo y | rmdir %localappdata%\Microsoft\Office\15.0\Lync /s
echo y | rmdir %localappdata%\Microsoft\Office\16.0\Lync /s

cls
Start lync.exe
cls
title Skype Cache Cleared

echo Skype cache cleared
echo.
pause
GOTO Start


:ClearAllCache
cls
title Clearing All Cache

Set /p Proceed=Proceeding will close Skype and Outlook. Ok to proceed? (Y/N)
if /i "%Proceed%" Neq "Y" GOTO Start

TaskKill /f /im "lync.exe"
TaskKill /f /im "outlook.exe"
cls
echo y | rmdir %localappdata%\Microsoft\Office\13.0\Lync /s
echo y | rmdir %localappdata%\Microsoft\Office\14.0\Lync /s
echo y | rmdir %localappdata%\Microsoft\Office\15.0\Lync /s
echo y | rmdir %localappdata%\Microsoft\Office\16.0\Lync /s

cls

echo ************************************************
echo.
echo Skype cache cleared
echo.
echo ************************************************

echo.

echo Clearing Internet Explorer Cache and Cookies
echo.
echo ************************************************
echo.

RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 

echo Cache and Cookies Cleared

echo.
echo ************************************************
echo.
echo Clearing Local Cache
echo.
echo ************************************************
echo.

cmdkey.exe /list > "%TEMP%\List.txt"
findstr.exe Target "%TEMP%\List.txt" > "%TEMP%\tokensonly.txt"
FOR /F "tokens=1,2 delims= " %%G IN (%TEMP%\tokensonly.txt) DO cmdkey.exe /delete:%%H
del "%TEMP%\List.txt" /s /f /q
del "%TEMP%\tokensonly.txt" /s /f /q

cls
title All Cache Cleared

echo ************************************************
echo.
echo Credentials cleared
echo.
echo ************************************************

echo.
pause
GOTO Start


:ClearEverything

cls
title Clearing Everything

Set /p Proceed=Proceeding will close Skype and Outlook. Ok to proceed? (Y/N)
if /i "%Proceed%" Neq "Y" GOTO Start

TaskKill /f /im "lync.exe"
TaskKill /f /im "outlook.exe"
cls
echo y | rmdir %localappdata%\Microsoft\Office\13.0\Lync /s
echo y | rmdir %localappdata%\Microsoft\Office\14.0\Lync /s
echo y | rmdir %localappdata%\Microsoft\Office\15.0\Lync /s
echo y | rmdir %localappdata%\Microsoft\Office\16.0\Lync /s

cls

echo ************************************************
echo.
echo Skype cache cleared
echo.
echo ************************************************

echo.

echo Clearing Internet Explorer Cache and Cookies
echo.
echo ************************************************
echo.

RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 

echo Cache and Cookies Cleared
echo.
echo ************************************************
echo.
echo Clearing Local Cache
echo.
echo ************************************************
echo.

cmdkey.exe /list > "%TEMP%\List.txt"
findstr.exe Target "%TEMP%\List.txt" > "%TEMP%\tokensonly.txt"
FOR /F "tokens=1,2 delims= " %%G IN (%TEMP%\tokensonly.txt) DO cmdkey.exe /delete:%%H
del "%TEMP%\List.txt" /s /f /q
del "%TEMP%\tokensonly.txt" /s /f /q

cls
Start lync.exe

echo ************************************************
echo.
echo Credentials cleared
echo.
echo ************************************************

echo.

echo Releasing I.P. Address
echo.
echo ************************************************

ipconfig /release
echo.

cls

echo ************************************************
echo.
echo I.P. Address Released
echo.
echo ************************************************

echo.
timeout /t 8
cls

echo ************************************************
echo.
echo Renewing I.P. Address
echo.
echo ************************************************

ipconfig /renew
echo.

cls

echo ************************************************
echo.
echo IP Address Renewed
echo.
echo ************************************************
echo.

echo Flushing DNS
echo.
echo ************************************************

ipconfig /flushdns

echo.
echo ************************************************
echo.
echo DNS Flushed
echo.
echo ************************************************

echo.

echo Resetting TCP/IP
echo.
echo ************************************************
echo.

netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset

cls

echo ************************************************
echo.
echo TCP/IP Reset
echo.
echo ************************************************

echo.

echo Forcing Group Policy Update
echo.
echo ************************************************
echo.

echo n|gpupdate /force

echo.
echo ************************************************
echo.
echo Group Policy Update Completed
echo.
echo ************************************************

Start lync.exe

cls
title Everything Cleared

echo It is highly recommended that you reboot your computer now.
echo.
Set /p Proceed=Would you like to reboot now? (Y/N)
if /i "%Proceed%" Neq "Y" GOTO Start

timeout /t 5
shutdown -f -r -t 0

echo.
pause
exit
