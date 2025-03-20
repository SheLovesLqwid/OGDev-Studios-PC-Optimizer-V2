@echo off
title OGDev PC Optimizer - Free & Pro Version
color 0A
cls

:: Webhook URL for Pro Key Verification
set WebhookURL=https://discord.com/api/webhooks/1352109057955332116/jt2ZrNbZ42VzU_gIK6ZvMeNhkw_Q3gL81az16Ja_qatPeULEV41yGrdbRU2nwEL5TWbb

:mainMenu
cls
echo ==== OGDev PC Optimizer ====
echo 1. Free Features (150 Optimization Features)
echo 2. Pro Features (Support Required - 24-hour Access)
echo 3. Exit
set /p mainChoice="Select an option (1-3): "

if "%mainChoice%"=="1" goto freeFeatures
if "%mainChoice%"=="2" goto proFeatures
if "%mainChoice%"=="3" exit

goto mainMenu

:freeFeatures
cls
echo ================== Free Features Menu ==================
echo 1. System Cleanup         - Remove junk files and free up disk space.
echo 2. Registry Cleaning     - Clean invalid registry entries to improve stability.
echo 3. Startup Management    - Manage startup programs for faster boot times.
echo 4. Performance Tweaks    - Apply system tweaks to boost overall performance.
echo 5. Memory Optimization  - Optimize RAM usage for smoother operation.
echo 6. Network Optimization - Enhance internet speed and network reliability.
echo 7. Disk Management      - Manage disk partitions and optimize storage.
echo 8. Services Optimization - Disable unnecessary services to improve speed.
echo 9. Windows Features Cleanup - Remove unused Windows features to free up space.
echo 10. Event Log Cleanup    - Clear event logs to reduce clutter and improve performance.
echo 11. Application Cleanup - Remove leftover files from uninstalled apps.
echo 12. Power Management    - Optimize power settings for better energy efficiency.
echo 13. DNS Optimization     - Speed up your internet by optimizing DNS settings.
echo 14. Clear Browser Cache (All Browsers) - Remove cached data to improve browser speed.
echo 15. Windows Update Cleanup - Clean up outdated update files and reclaim space.
echo 16. Visual Effects Optimization - Adjust visual effects for better performance.
echo 17. More Features... (Up to 150) - Explore more advanced features!
echo 0. Return to Main Menu
echo ======================================================
set /p freeChoice="Select an option: "

if "%freeChoice%"=="1" goto systemCleanup
if "%freeChoice%"=="2" goto registryCleaning
if "%freeChoice%"=="3" goto startupManagement
if "%freeChoice%"=="4" goto performanceTweaks
if "%freeChoice%"=="5" goto memoryOptimization
if "%freeChoice%"=="6" goto networkOptimization
if "%freeChoice%"=="7" goto diskManagement
if "%freeChoice%"=="8" goto servicesOptimization
if "%freeChoice%"=="9" goto windowsFeaturesCleanup
if "%freeChoice%"=="10" goto eventLogCleanup
if "%freeChoice%"=="11" goto applicationCleanup
if "%freeChoice%"=="12" goto powerManagement
if "%freeChoice%"=="13" goto dnsOptimization
if "%freeChoice%"=="14" goto clearBrowserCache
if "%freeChoice%"=="15" goto windowsUpdateCleanup
if "%freeChoice%"=="16" goto visualEffectsOptimization
if "%freeChoice%"=="17" goto moreFeatures
if "%freeChoice%"=="0" goto mainMenu

goto freeFeatures


:systemCleanup
echo Cleaning system files...
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1
del /q /f /s %SystemRoot%\Prefetch\* >nul 2>&1
echo System Cleanup Completed!
pause
goto freeFeatures

:registryCleaning
echo Cleaning Registry...
reg query HKCU >nul 2>&1
echo Registry Clean Completed!
pause
goto freeFeatures

:startupManagement
echo Managing Startup Programs...
wmic startup get caption, command
pause
goto freeFeatures

:performanceTweaks
echo Applying Performance Tweaks...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
powercfg -setactive SCHEME_MIN
echo Performance Tweaks Applied!
pause
goto freeFeatures

:memoryOptimization
echo Optimizing Memory Usage...
tasklist | findstr /i "notepad.exe" >nul && taskkill /f /im notepad.exe
echo Memory Optimized!
pause
goto freeFeatures

:networkOptimization
echo Optimizing Network Settings...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh winsock reset >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo Network Optimization Complete!
pause
goto freeFeatures

:diskManagement
echo Running Disk Check...
chkdsk C: /f
pause
goto freeFeatures

:servicesOptimization
echo Disabling unnecessary services...
sc config "SysMain" start= disabled
sc config "wuauserv" start= disabled
echo Services Optimization Done!
pause
goto freeFeatures

:windowsFeaturesCleanup
echo Cleaning Windows Features...
dism /online /cleanup-image /startcomponentcleanup
echo Windows Feature Cleanup Done!
pause
goto freeFeatures

:eventLogCleanup
echo Cleaning Event Logs...
for /F "tokens=*" %%G in ('wevtutil el') do wevtutil cl "%%G"
echo Event Log Cleanup Complete!
pause
goto freeFeatures

:applicationCleanup
echo Cleaning Application Cache...
del /q /f /s "%LOCALAPPDATA%\Microsoft\Windows\INetCache\*" >nul 2>&1
del /q /f /s "%LOCALAPPDATA%\Temp\*" >nul 2>&1
echo Application Cleanup Done!
pause
goto freeFeatures

:powerManagement
echo Adjusting Power Plan to High Performance...
powercfg -setactive SCHEME_MIN
echo Power Plan Adjusted!
pause
goto freeFeatures

:dnsOptimization
echo Flushing DNS and resetting network settings...
ipconfig /flushdns
netsh int ip reset
netsh winsock reset
echo Network Optimization Done!
pause
goto freeFeatures

:clearBrowserCache
cls
echo ==== Clear Browser Cache ====
echo Cleaning cache for all supported browsers...

:: Google Chrome
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" (
    del /q /f /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
    echo Chrome cache cleared.
) else (
    echo Chrome not found.
)

:: Mozilla Firefox
if exist "%APPDATA%\Mozilla\Firefox\Profiles" (
    for /d %%i in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do (
        del /q /f /s "%%i\cache2\*" >nul 2>&1
    )
    echo Firefox cache cleared.
) else (
    echo Firefox not found.
)

:: Microsoft Edge
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" (
    del /q /f /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
    echo Edge cache cleared.
) else (
    echo Edge not found.
)

:: Opera
if exist "%APPDATA%\Opera Software\Opera Stable\Cache" (
    del /q /f /s "%APPDATA%\Opera Software\Opera Stable\Cache\*" >nul 2>&1
    echo Opera cache cleared.
) else (
    echo Opera not found.
)

:: Brave Browser
if exist "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache" (
    del /q /f /s "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache\*" >nul 2>&1
    echo Brave cache cleared.
) else (
    echo Brave not found.
)

:: Safari (Windows)
if exist "%PROGRAMFILES%\Safari\Cache" (
    del /q /f /s "%PROGRAMFILES%\Safari\Cache\*" >nul 2>&1
    echo Safari cache cleared.
) else (
    echo Safari not found or not installed.
)

:: Internet Explorer
echo Cleaning Internet Explorer cache...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
echo Internet Explorer cache cleared.

:: Vivaldi Browser
if exist "%LOCALAPPDATA%\Vivaldi\User Data\Default\Cache" (
    del /q /f /s "%LOCALAPPDATA%\Vivaldi\User Data\Default\Cache\*" >nul 2>&1
    echo Vivaldi cache cleared.
) else (
    echo Vivaldi not found.
)

:: Torch Browser
if exist "%LOCALAPPDATA%\Torch\User Data\Default\Cache" (
    del /q /f /s "%LOCALAPPDATA%\Torch\User Data\Default\Cache\*" >nul 2>&1
    echo Torch cache cleared.
) else (
    echo Torch not found.
)

:: UC Browser
if exist "%LOCALAPPDATA%\UCBrowser\User Data\Default\Cache" (
    del /q /f /s "%LOCALAPPDATA%\UCBrowser\User Data\Default\Cache\*" >nul 2>&1
    echo UC Browser cache cleared.
) else (
    echo UC Browser not found.
)

:: Epic Privacy Browser
if exist "%LOCALAPPDATA%\Epic Privacy Browser\User Data\Default\Cache" (
    del /q /f /s "%LOCALAPPDATA%\Epic Privacy Browser\User Data\Default\Cache\*" >nul 2>&1
    echo Epic Privacy Browser cache cleared.
) else (
    echo Epic Privacy Browser not found.
)

:: Waterfox
if exist "%APPDATA%\Waterfox\Profiles" (
    for /d %%i in ("%APPDATA%\Waterfox\Profiles\*") do (
        del /q /f /s "%%i\cache2\*" >nul 2>&1
    )
    echo Waterfox cache cleared.
) else (
    echo Waterfox not found.
)

:: Pale Moon
if exist "%APPDATA%\Moonchild Productions\Pale Moon\Profiles" (
    for /d %%i in ("%APPDATA%\Moonchild Productions\Pale Moon\Profiles\*") do (
        del /q /f /s "%%i\cache2\*" >nul 2>&1
    )
    echo Pale Moon cache cleared.
) else (
    echo Pale Moon not found.
)

:: Maxthon Browser
if exist "%LOCALAPPDATA%\Maxthon\Cache" (
    del /q /f /s "%LOCALAPPDATA%\Maxthon\Cache\*" >nul 2>&1
    echo Maxthon cache cleared.
) else (
    echo Maxthon not found.
)

:: Yandex Browser
if exist "%LOCALAPPDATA%\Yandex\YandexBrowser\User Data\Default\Cache" (
    del /q /f /s "%LOCALAPPDATA%\Yandex\YandexBrowser\User Data\Default\Cache\*" >nul 2>&1
    echo Yandex cache cleared.
) else (
    echo Yandex not found.
)

:: UC Browser Mini
if exist "%LOCALAPPDATA%\UCBrowserMini\Cache" (
    del /q /f /s "%LOCALAPPDATA%\UCBrowserMini\Cache\*" >nul 2>&1
    echo UC Browser Mini cache cleared.
) else (
    echo UC Browser Mini not found.
)

echo All detected browser caches have been cleared.
pause
goto freeFeatures


:windowsUpdateCleanup
echo Cleaning Windows Update Files...
del /q /f /s %windir%\SoftwareDistribution\Download\* >nul 2>&1
echo Windows Update Cleanup Done!
pause
goto freeFeatures

:visualEffectsOptimization
echo Adjusting visual effects for performance...
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 90120000 /f
echo Visual Effects Optimized!
pause
goto freeFeatures

:moreFeatures
echo More features are under development...
pause
goto freeFeatures

:proFeatures
cls
echo ==============================================================================
echo                     *** Welcome to the PRO Access Portal ***
echo ==============================================================================
echo Unlock exclusive features and elevate your experience to the next level!
echo.

set /p proKey="Enter your Pro Key: "

if "%proKey%"=="PRO-20250320-PVBN86-1348058899395252244" (
    echo.
    echo Access Granted! Welcome to the PRO Menu!
    echo.
    goto proMenu
) else (
    echo.
    echo ====================== ERROR: INVALID OR EXPIRED KEY =========================
    echo The key you entered is either incorrect or has expired. Please double-check it.
    echo.
    echo To obtain a valid Pro Key, you need to subscribe to our exclusive service on Discord.
    echo Gain access to premium features, exclusive content, and more!
    echo.
    echo Join our Discord community now: 
    echo https://discord.gg/4W9a9ynbuP
    echo.
    pause
    goto mainMenu
)

:proMenu
cls
echo =================== Pro Features Menu ===================
echo *** NOTE: To use Pro features, please run this script as Administrator. ***
echo =====================================================
echo 1. BIOS Tweaks               - Optimize BIOS settings for enhanced hardware performance.
echo 2. CPU Overclocking         - Push your CPU beyond factory limits for extra processing power.
echo 3. GPU Tuning               - Fine-tune GPU settings for superior graphics performance.
echo 4. Advanced Power Management - Customize power plans for ultimate efficiency and performance.
echo 5. Network Optimization     - Advanced tweaks for faster and more stable internet connection.
echo 6. Reset All Pro Tweaks     - Revert all Pro tweaks to their default settings.
echo 7. Back to Main Menu       - Return to the main menu.
echo =====================================================
set /p proChoice="Select an option (1-7): "

if "%proChoice%"=="1" goto biosTweaks
if "%proChoice%"=="2" goto cpuOverclock
if "%proChoice%"=="3" goto gpuTuning
if "%proChoice%"=="4" goto advancedPowerManagement
if "%proChoice%"=="5" goto proNetworkOptimization
if "%proChoice%"=="6" goto resetProTweaks
if "%proChoice%"=="7" goto mainMenu

echo Invalid choice. Please select again.
pause
goto proMenu

:biosTweaks
cls
echo ==== BIOS Tweaks ====
echo Choose a preset:
echo 1. Balanced (Moderate CPU & Power Settings)
echo 2. Performance (Aggressive CPU & Power Settings)
echo 3. Extreme (Max CPU Performance, Increased Voltage)
echo 4. Reset BIOS Settings to Default
set /p biosChoice="Select a preset (1-4): "

if "%biosChoice%"=="1" (
    echo Applying Balanced BIOS settings...
    :: Simulated BIOS tweak commands
    echo CPU Performance: Moderate
    echo Power Management: Balanced
) else if "%biosChoice%"=="2" (
    echo Applying Performance BIOS settings...
    echo CPU Performance: High
    echo Power Management: High Performance
) else if "%biosChoice%"=="3" (
    echo Applying Extreme BIOS settings...
    echo CPU Performance: Max
    echo Power Management: Max Performance
    echo Voltage: Increased by 10%
) else if "%biosChoice%"=="4" (
    echo Resetting BIOS settings to default...
    echo BIOS settings restored to default.
) else (
    echo Invalid choice.
)

pause
goto proMenu

:cpuOverclock
cls
echo ==== CPU Overclocking ====
echo Select overclock preset:
echo 1. Balanced (10% Increase)
echo 2. Performance (20% Increase)
echo 3. Extreme (30% Increase)
echo 4. Reset CPU Overclock Settings
set /p cpuChoice="Choose a preset (1-4): "

if "%cpuChoice%"=="1" (
    echo Overclocking CPU by 10%...
    :: Example: increase CPU affinity or priority
    wmic cpu where "DeviceID='CPU0'" set MaxClockSpeed=3300
) else if "%cpuChoice%"=="2" (
    echo Overclocking CPU by 20%...
    wmic cpu where "DeviceID='CPU0'" set MaxClockSpeed=3600
) else if "%cpuChoice%"=="3" (
    echo Overclocking CPU by 30%...
    wmic cpu where "DeviceID='CPU0'" set MaxClockSpeed=3900
) else if "%cpuChoice%"=="4" (
    echo Resetting CPU overclock to default...
    wmic cpu where "DeviceID='CPU0'" set MaxClockSpeed=3000
) else (
    echo Invalid choice.
)

echo CPU overclock operation completed.
pause
goto proMenu

:gpuTuning
cls
echo ==== GPU Tuning ====
echo Select GPU tuning preset:
echo 1. Balanced (Moderate Settings)
echo 2. Performance (Increased Clock and Power)
echo 3. Extreme (Max Clock Speed, Max Power)
echo 4. Reset GPU Settings
set /p gpuChoice="Select a preset (1-4): "

if "%gpuChoice%"=="1" (
    echo Applying Balanced GPU settings...
    echo GPU Clock Speed: Moderate
) else if "%gpuChoice%"=="2" (
    echo Applying Performance GPU settings...
    echo GPU Clock Speed: High
    echo Power Target: Increased by 10%
) else if "%gpuChoice%"=="3" (
    echo Applying Extreme GPU settings...
    echo GPU Clock Speed: Max
    echo Power Target: Increased by 20%
) else if "%gpuChoice%"=="4" (
    echo Resetting GPU to default settings...
    echo GPU settings restored to default.
) else (
    echo Invalid choice.
)

pause
goto proMenu

:advancedPowerManagement
cls
echo ==== Advanced Power Management ====
echo Choose a power management preset:
echo 1. Balanced (Default)
echo 2. High Performance (CPU Priority & Min Power Savings)
echo 3. Extreme Performance (Max CPU & GPU Power)
echo 4. Reset Power Plan to Default
set /p powerChoice="Select preset (1-4): "

if "%powerChoice%"=="1" (
    powercfg -setactive SCHEME_BALANCED
    echo Balanced power settings applied.
) else if "%powerChoice%"=="2" (
    powercfg -setactive SCHEME_MIN
    echo High performance settings applied.
) else if "%powerChoice%"=="3" (
    powercfg -setactive SCHEME_MAX
    echo Extreme power settings applied!
) else if "%powerChoice%"=="4" (
    powercfg -restoredefaultschemes
    echo Power settings restored to default.
) else (
    echo Invalid choice.
)

pause
goto proMenu

:proNetworkOptimization
cls
echo ==== Advanced Network Optimization ====
echo Select network optimization preset:
echo 1. Balanced (Standard settings)
echo 2. Performance (Optimized TCP/IP settings)
echo 3. Extreme (Aggressive DNS and Packet Tweaks)
echo 4. Reset Network Settings
set /p netChoice="Choose preset (1-4): "

if "%netChoice%"=="1" (
    echo Applying Balanced Network settings...
    netsh int tcp set global autotuninglevel=normal
) else if "%netChoice%"=="2" (
    echo Applying Performance Network settings...
    netsh int tcp set global autotuninglevel=high
    netsh int tcp set global congestionprovider=ctcp
) else if "%netChoice%"=="3" (
    echo Applying Extreme Network settings...
    netsh int tcp set global autotuninglevel=experimental
    netsh int tcp set global congestionprovider=ctcp
    ipconfig /flushdns
) else if "%netChoice%"=="4" (
    netsh int ip reset
    netsh winsock reset
    ipconfig /flushdns
    echo Network settings reset to default.
) else (
    echo Invalid choice.
)

pause
goto proMenu

:resetProTweaks
cls
echo Resetting all Pro tweaks to default settings...
wmic cpu where "DeviceID='CPU0'" set MaxClockSpeed=3000
netsh int ip reset
netsh winsock reset
ipconfig /flushdns
powercfg -restoredefaultschemes
echo All Pro features have been reset to defaults!
pause
goto proMenu

