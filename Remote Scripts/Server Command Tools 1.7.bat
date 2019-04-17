@echo off
:: Server Command Tools 1.7
:: https://github.com/Justin-Lund/

:Start
cls
title Server Command Tools 1.7


echo 1. Find User Account Information
echo 2. Unlock User Account
echo 3. Find Computer Information
echo 4. See Who's Logged On to a Computer
echo 5. Ping a Computer
echo 6. Launch Active Directory
echo 7. Launch CMRC
echo 8. Launch CMD
echo 9. Launch PowerShell
echo.

CHOICE /C 123456789 /M "Enter your choice:"

IF ERRORLEVEL 9 GOTO LaunchPowerShell
IF ERRORLEVEL 8 GOTO CMD
IF ERRORLEVEL 7 GOTO CMRC
IF ERRORLEVEL 6 GOTO ActiveDirectory
IF ERRORLEVEL 5 GOTO Ping
IF ERRORLEVEL 4 GOTO CheckLogon
IF ERRORLEVEL 3 GOTO Computer
IF ERRORLEVEL 2 GOTO Unlock
IF ERRORLEVEL 1 GOTO User


:User
cls
title User Account Information

Set /p User ID=Enter User ID:

echo.

net user %User ID% /domain|findstr /i /c:"User name" /c:"Full Name" /c:"Comment" /c:"Account Active" /c:"Account Expires" /c:"Password Last Set" /c:"Password Expires" /c:"Password changeable" /c:"Last logon"

echo.
pause
GOTO Start


:Unlock
cls
title Unlock User Account

Set /p User ID=Enter User ID:

echo.

net user %User ID% /domain /active:YES

echo.
pause
GOTO Start


:Computer
cls
title Computer Information

Set /p Computer Name=Enter Computer Name or I.P. Address:

echo.

systeminfo /s %Computer Name%|findstr /i /c:"Host Name" /c:"OS Name" /c:"OS Version" /c:"Original Install Date" /c:"System Boot Time" /c:"System Up Time" /c:"System Manufacturer" /c:"System Model" /c:"System Type" /c:"Total Physical Memory"

echo.
pause
GOTO Start


:CheckLogon
cls
title Log On Info
Set /p Computer Name=Enter Computer Name or I.P. Address:

echo.

psloggedon \\%Computer Name% 2>nul | findstr /i /c:"Users" /c:"unknown time" /c:"TECKCOMINCO" /c:"NT Service" 

echo.
pause
GOTO Start


:Ping
cls
title Ping
Set /p Ping Name=Enter Computer Name or I.P. Address:
ping %Ping Name%

echo.
pause
GOTO Start


:ActiveDirectory
cls
title Launching Active Directory
start C:\Windows\System32\dsa.msc

GOTO Start


:CMRC
cls
title Launching CMRC
start "" "C:\SCCM 2012 - Remote Control App\CmRcViewer.exe"

GOTO Start


:CMD
cls
title Launching CMD
start cmd /k "doskey ls=dir & doskey clear=cls"

GOTO Start


:LaunchPowerShell
cls
title Launching PowerShell
start PowerShell

GOTO Start
