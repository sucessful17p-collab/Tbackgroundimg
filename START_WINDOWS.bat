@echo off
setlocal
cd /d "%~dp0"
echo ==========================================
echo Local Background Remover - U2NET
echo This launcher uses this folder automatically.
echo ==========================================

where py >nul 2>nul
if errorlevel 1 (
  echo ERROR: Python launcher "py" was not found.
  echo Install 64-bit Python 3.12 and enable "Add Python to PATH".
  pause
  exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
  echo Creating a Python 3.12 virtual environment...
  py -3.12 -m venv .venv
  if errorlevel 1 (
    echo ERROR: Could not create the virtual environment.
    echo Check that Python 3.12 is installed: py -0p
    pause
    exit /b 1
  )
)

echo Installing/checking required packages...
".venv\Scripts\python.exe" -m pip install -r "%~dp0requirements.txt"
if errorlevel 1 (
  echo ERROR: Dependency installation failed. Read the error above.
  pause
  exit /b 1
)

echo Starting the app...
".venv\Scripts\python.exe" -m streamlit run "%~dp0app.py"
if errorlevel 1 (
  echo ERROR: App stopped. Read the error above.
  pause
  exit /b 1
)
pause
