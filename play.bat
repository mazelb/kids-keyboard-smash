@echo off
setlocal

set "GAME_PATH=%~dp0index.html"
set "AHK_SCRIPT=%~dp0block_keys.ahk"
set "AHK_EXE=C:\Program Files\AutoHotkey\v2\AutoHotkey.exe"
set "KIOSK_PROFILE=%~dp0kiosk_profile"

:: Find browser
set "BROWSER="
if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    set "BROWSER=C:\Program Files\Google\Chrome\Application\chrome.exe"
) else if exist "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" (
    set "BROWSER=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
) else (
    echo ERROR: Chrome or Edge not found.
    pause
    exit /b 1
)

:: Launch AutoHotkey key blocker
if exist "%AHK_EXE%" (
    echo Starting key blocker...
    start "AHK" /min "%AHK_EXE%" "%AHK_SCRIPT%"
    timeout /t 1 /nobreak >nul
    echo Key blocker started.
) else (
    echo WARNING: AutoHotkey not found at %AHK_EXE%
    echo Windows/Alt keys won't be blocked.
)

:: Launch browser in kiosk mode with separate profile so flags are not ignored
echo Launching game...
start "" /wait "%BROWSER%" --kiosk --disable-pinch --overscroll-history-navigation=0 --no-first-run --disable-translate --user-data-dir="%KIOSK_PROFILE%" "file:///%GAME_PATH:\=/%"

:: Kill AHK script when browser closes
taskkill /f /im AutoHotkey.exe >nul 2>&1
taskkill /f /im AutoHotkey32.exe >nul 2>&1
taskkill /f /im AutoHotkey64.exe >nul 2>&1
echo Key blocker stopped.

echo Game closed.
endlocal
