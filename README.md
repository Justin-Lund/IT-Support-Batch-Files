# I.T. Support Batch Files

A collection of batch files I've made to streamline troubleshooting processes & every day I.T. administration tasks.


# Prerequisites

Some of the remote scripts require PsTools to be installed on your machine, which you can find here: https://docs.microsoft.com/en-us/sysinternals/downloads/pstools

Unzip the files to System32 or any PATH Environment Variable location.

After installing PsTools, you will have to run the following commands and accept the EULAs when prompted before the commands will work in the scripts:
* PsExec
* PsLoggedOn
* PsService


&nbsp;


# Script Overviews


&nbsp;

## Local Machine Scripts

### User Commands Tools & Admin User Command Tools

*Local troubleshooting tools that can be used by users to troubleshoot with minimal knowledge, or by I.T. professionals to quickly resolve common user issues.*

Funtions:

* Get I.P. address
* Get computer system information *(Displays useful information about the PC)*
* Force group policy update
* Clear cache from Ineternet Explorer, Skype for Business and Credential Manager
* Renew I.P. address & reset TCP/IP
> Runs **ipconfig /release, ipconfig /renew, ipconfig /flushdns, netsh int ip reset, netsh int ipv4 reset,** and **netsh int ipv6 reset**

The **Admin User Command Tools** script must be run with administrator privileges, and can do a couple of things that the **User Command Tools** script can not:

* Restart printer spooler service & clear printer cache
* The *Renew I.P. Address & Reset TCP/IP* option will also run **netsh winsock reset, netsh int tcp reset, nbtstat -R,** and **nbtstat -RR**

*Note that the cache clearing commands are specific to the user account that they are run from. This is fine for users with local administrator privileges, but if a separate admin account is used to run the script, clearing cache will effectively do nothing.*

_______________________


### Deny Shutdown

This script repeatedly runs the **abort shutdown** command.
Useful for countering a virus which tries to shut the computer down, or to block an automatic restart caused by computer updates.

_______________________

&nbsp;

## Remote Machine Scripts

### Server Command Tools

*Remote administration tool designed to be left open throughout the work day to speed up common tasks.*

Functions:

* Find user account information *(Displays information such as when a user's password expires)*
* Unlock user account
* Find computer information *(Displays information about a network PC, including the last reboot time)*
* See who's logged on to a computer
* Ping a computer
* Launch Active Directory, Configuration Manager Remote Control, or CMD

Run this file as administrator.

The options for launching AD, CMRC & CMD are included in this script so that you only need to run one file as an administrator. In environments where administrator privilegs are managed on a secondary account, this saves you the hassle of entering your password to open each of these programs each time you access them.

The path for CMRC may need to be changed depending on where you have it installed.

_______________________


### Remote Troubleshooting Tools

*Commands used for troubleshooting issues on remote computers without directly connecting to them.*

Functions:

* Force a group policy update (only works for computer policy, not user policy)
* Restart printer spooler & clear local printer cache
* Pull a list of all installed programs on a remote computer, and write it to C:\Temp\InstallList.txt on your local computer
* Fix failing SCCM Software Center updates on a user's computer by stopping the services wuauserv & ccmexec, clearing out C:\Windows\SoftwareDistribution and restarting the services

_______________________

### Keep Account Unlocked

This script unlocks the given username every 5 seconds.

This is intended as a temporary solution for accounts that are experiencing repeated lockouts, and can be used to keep the account unlocked until further troubleshooting/investigation is complete.
