@ECHO OFF
REM BFCPEOPTIONSTART
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=0.1.0.0
REM BFCPEVERPRODUCT=ROOK Repair Module
REM BFCPEVERDESC=Repair Module
REM BFCPEVERCOMPANY=Keissler Labs
REM BFCPEVERCOPYRIGHT=Copyright (c) 2021
REM BFCPEOPTIONEND
@ECHO ON
@echo off
echo ROOK repair module v.0.1.5
echo NOTE: Run this script with administrator privileges to enable CHKDSK and SFC!
timeout 2
echo Initiating Windows Update...
echo Initiating Windows Feature Update...
wuauclt.exe /updatenow
echo Initiating Windows Defender maintenance chain...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1
echo Initiating Error Disk Check...
chkdsk
echo Initiating System File Checker utility...
sfc /scannow
echo Script done.
pause