@echo off
:: Keep Account Unlocked
:: https://github.com/Justin-Lund/

title Keep Account Unlocked

:Start
Set /p User ID=Enter User ID to Keep Unlocked: 

title Keep Account Unlocked: %User ID%
cls

:Unlock
echo Unlocking account: %User ID%
echo.
net user %User ID% /domain /active:YES

timeout /t 5
cls

GOTO Unlock
