@echo off
:: Remote Troubleshooting Tools 1.0
:: https://github.com/Justin-Lund/

:Start
cls
title Remote Troubleshooting Tools 1.0


echo 1. Force Group Policy Update
echo 2. Clear Printer Cache
echo 3. Get List of Programs on Computer
echo 4. Exit Remote Troubleshooting Tools
echo.

CHOICE /C 1234 /M "Enter your choice:"

IF ERRORLEVEL 4 GOTO Exit
IF ERRORLEVEL 3 GOTO ListPrograms
IF ERRORLEVEL 2 GOTO PrinterCache
IF ERRORLEVEL 1 GOTO RemoteGPUpdate


:RemoteGPUpdate
cls
title Force Group Policy Update

Set /p Computer Name=Enter Computer Name or I.P. Address:

echo.
echo Running gpupdate /force on %Computer Name%
echo.

psExec 2>nul \\%Computer Name% gpupdate /force

echo.
pause
GOTO Start


:PrinterCache
cls
title Clear Printer Cache

Set /p Computer Name=Enter Computer Name or I.P. Address:

echo.

psService 2>nul \\%Computer Name% stop spooler
psExec 2>nul \\%Computer Name% cmd /c del /f /q %systemroot%\system32\spool\printers\*.*
psService 2>nul \\%Computer Name% start spooler

echo.
pause
GOTO Start


:ListPrograms
cls
title Get List of Programs

Set /p Computer Name=Enter Computer Name or I.P. Address:

echo.
echo The list of programs will be written to C:\Temp\InstallList.txt

del C:\Temp\InstallList.txt 

wmic /node:%Computer Name% /output:C:\Temp\InstallList.txt product get name,version

echo.
pause
GOTO Start


:Exit
exit
