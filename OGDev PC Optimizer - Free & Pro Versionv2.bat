@echo off
title OGDev PC Optimizer (Outdated Version)
color 0A
cls

:: =========================
:: DISABLED: webhook (insecure)
:: =========================
:: set WebhookURL=https://discord.com/api/webhooks/...

:mainMenu
cls
echo =========================================
echo        OGDev PC Optimizer (OLD)
echo =========================================
echo  This version is outdated.
echo  Please download the new update.
echo =========================================
echo.
echo 1. Free Features (Limited / Outdated)
echo 2. Pro Features (Disabled)
echo 3. Exit
echo.
set /p mainChoice="Select an option (1-3): "

if "%mainChoice%"=="1" goto freeFeatures
if "%mainChoice%"=="2" goto proFeatures
if "%mainChoice%"=="3" exit
goto mainMenu

:freeFeatures
cls
echo ===== Free Features (Outdated) =====
echo 1. System Cleanup
echo 2. Registry Cleaning
echo 3. Startup Management
echo 4. Performance Tweaks
echo 5. Memory Optimization
echo 6. Network Optimization
echo 7. Disk Management
echo 8. Services Optimization
echo 9. Event Log Cleanup
echo 0. Back
echo.
set /p freeChoice="Select: "

if "%freeChoice%"=="1" goto systemCleanup
if "%freeChoice%"=="2" goto registryCleaning
if "%freeChoice%"=="3" goto startupManagement
if "%freeChoice%"=="4" goto performanceTweaks
if "%freeChoice%"=="5" goto memoryOptimization
if "%freeChoice%"=="6" goto networkOptimization
if "%freeChoice%"=="7" goto diskManagement
if "%freeChoice%"=="8" goto servicesOptimization
if "%freeChoice%"=="9" goto eventLogCleanup
if "%freeChoice%"=="0" goto mainMenu
goto freeFeatures

:systemCleanup
echo Cleaning temp files...
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1

:: disabled (bad tweak)
:: del /q /f /s %SystemRoot%\Prefetch\*

echo Done (kinda)
pause
goto freeFeatures

:registryCleaning
echo Attempting registry cleaning...

:: lame feature
:: reg query HKCU >nul 2>&1

echo yeah this does basically nothing lol
pause
goto freeFeatures

:startupManagement
echo Listing startup programs...
wmic startup get caption, command
echo thats it bro no manager here 😭
pause
goto freeFeatures

:performanceTweaks
echo Applying "performance" tweaks...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f

echo congrats you gained like 1 fps 🔥
pause
goto freeFeatures

:memoryOptimization
echo Optimizing memory...

:: lame / unsafe
:: taskkill /f /im notepad.exe

echo nothing really happened but sounds cool
pause
goto freeFeatures

:networkOptimization
echo Resetting network...

netsh winsock reset >nul
ipconfig /flushdns >nul

:: disabled tweak
:: netsh int tcp set global autotuninglevel=normal

echo internet might feel faster (placebo)
pause
goto freeFeatures

:diskManagement
echo Checking disk...

chkdsk C: /scan

echo yeah this is just a scan lol
pause
goto freeFeatures

:servicesOptimization
echo Optimizing services...

:: dangerous so disabled
:: sc config "SysMain" start= disabled
:: sc config "wuauserv" start= disabled

echo didnt actually change anything 😭
pause
goto freeFeatures

:eventLogCleanup
echo Clearing logs...

for /F "tokens=*" %%G in ('wevtutil el') do wevtutil cl "%%G"

echo logs gone but that doesnt boost fps btw
pause
goto freeFeatures

:: =========================
:: PRO SECTION (DISABLED)
:: =========================

:proFeatures
cls
echo ===== PRO FEATURES =====
echo.

:: disabled insecure key system
:: set /p proKey="Enter key: "
:: if "%proKey%"=="HARDCODEDKEY" goto proMenu

echo Pro system is disabled in this version.
echo please download the new update 💀
pause
goto mainMenu

:proMenu
goto mainMenu

:: =========================
:: lame FEATURES TURNED LAME
:: =========================

:biosTweaks
echo trying to tweak bios...
echo yeah nah you cant do that from a batch file 😭
pause
goto proMenu

:cpuOverclock
echo overclocking cpu...
echo just kidding thats not how this works 💀
pause
goto proMenu

:gpuTuning
echo tuning gpu...
echo go download msi afterburner or something bro
pause
goto proMenu

:advancedPowerManagement
echo setting power plan...
powercfg -setactive SCHEME_MIN
echo ok this one actually did something
pause
goto proMenu

:proNetworkOptimization
echo "advanced" network optimization...
netsh winsock reset
ipconfig /flushdns
echo same thing as free version lol
pause
goto proMenu

:resetProTweaks
echo resetting everything...
powercfg -restoredefaultschemes
netsh winsock reset
ipconfig /flushdns
echo back to normal i guess
pause
goto proMenu
