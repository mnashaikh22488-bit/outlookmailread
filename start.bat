@echo off
title Outlook Multi-Monitor Professional
cd /d "%~dp0"

echo.
echo ========================================
echo   Outlook Multi-Monitor Professional
echo ========================================
echo.

python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH.
    echo Download from https://www.python.org/downloads/
    echo IMPORTANT: Check "Add python.exe to PATH"
    pause
    exit /b 1
)

echo Installing required libraries...
python -m pip install --quiet flask requests
echo.
echo Starting server...
echo.
echo   Open your browser:
echo   http://127.0.0.1:5000
echo.
echo   Keep this window open.
echo ========================================
echo.

python app.py
pause
