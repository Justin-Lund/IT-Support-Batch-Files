@echo off
:: Deny Shutdown
:: https://github.com/Justin-Lund/

title Deny Shutdown

:Start
shutdown -a
echo.

GOTO Start
