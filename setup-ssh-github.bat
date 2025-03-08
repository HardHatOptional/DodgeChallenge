@echo off
echo ===================================
echo GitHub SSH Key Setup Helper
echo ===================================
echo.
echo This script will help you set up SSH keys for GitHub.
echo.

REM Check if Git is installed
where git >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
  echo ERROR: Git is not installed or not in your PATH.
  echo Please install Git first from https://git-scm.com/downloads
  echo.
  pause
  exit /b 1
)

REM Check if SSH keys already exist
if exist "%USERPROFILE%\.ssh\id_ed25519" (
  echo SSH key already exists at: %USERPROFILE%\.ssh\id_ed25519
  echo If you want to create a new key, please backup or remove the existing one first.
) else (
  echo Generating a new SSH key...
  echo.
  set /p email=Enter your GitHub email address: 
  
  echo.
  echo Creating SSH key with email: %email%
  echo When prompted, just press Enter to use the default file location
  echo You can set a passphrase for extra security or leave it empty
  echo.
  
  ssh-keygen -t ed25519 -C "%email%"
)

echo.
echo Your public SSH key is:
echo -----------------------------------
type "%USERPROFILE%\.ssh\id_ed25519.pub"
echo -----------------------------------
echo.
echo Copy the above key (including ssh-ed25519 and your email)

echo.
echo Next steps:
echo 1. Go to GitHub.com and log in
echo 2. Click on your profile picture → Settings
echo 3. Select "SSH and GPG keys" from the sidebar
echo 4. Click "New SSH key" button
echo 5. Give it a title (e.g., "My Computer")
echo 6. Paste your key in the "Key" field
echo 7. Click "Add SSH key"
echo.

echo Would you like to open GitHub SSH settings page now?
set /p open_browser=Type 'yes' to open browser or press Enter to skip: 

if "%open_browser%"=="yes" (
  start https://github.com/settings/ssh/new
)

echo.
echo To test your SSH connection, run: ssh -T git@github.com
echo If successful, you'll see a message like: "Hi username! You've successfully authenticated..."
echo.

echo Press any key to exit...
pause > nul