@echo off
chcp 936 >nul 2>nul
title MoodLog - local preview
cd /d "%~dp0"

set "PY="
python -c "import sys;assert sys.version_info>=(3,8)" >nul 2>&1 && set "PY=python"
if not defined PY py -3 -c "import sys;assert sys.version_info>=(3,8)" >nul 2>&1 && set "PY=py -3"
if not defined PY py -3 -c "import sys;assert sys.version_info>=(3,8)" >nul 2>&1 && set "PY=py -3"
if not defined PY for %%P in ("D:\python\python.exe" "%ProgramData%\Anaconda3\python.exe" "%USERPROFILE%\anaconda3\python.exe") do if not defined PY if exist "%%~fP" set "PY=%%~fP"

if not defined PY (
    echo  Python not found. Install Python 3, or just open index.html directly.
    pause
    exit /b 1
)

echo.
echo  Serving this folder at:  http://127.0.0.1:8080
echo  Press Ctrl+C to stop.
echo.
start "" http://127.0.0.1:8080/index.html
%PY% -m http.server 8080 --bind 127.0.0.1
pause
