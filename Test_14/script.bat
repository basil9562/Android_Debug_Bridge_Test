@echo off
:: Create a timestamp variable using date and time
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set mm=%%a
    set dd=%%b
    set yyyy=%%c
)
for /f "tokens=1-2 delims=: " %%i in ("%time%") do (
    set hh=%%i
    set min=%%j
)
:: Remove whitespace and format properly
set hh=%hh: =0%
set logtime=%yyyy%-%mm%-%dd%_%hh%-%min%

:: Create filename using timestamp
set filename=logcat_%logtime%.txt

:: Save logs to file
adb logcat -d > %filename%

echo Log saved to %filename%
pause
