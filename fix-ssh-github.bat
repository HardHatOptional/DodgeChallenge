@echo off
echo ===================================
echo GitHub SSH Key Troubleshooter
echo ===================================
echo.

REM Check if SSH keys exist
if not exist "%USERPROFILE%\.ssh\id_ed25519.pub" (
  echo ERROR: No SSH key found at %USERPROFILE%\.ssh\id_ed25519.pub
  echo Please run setup-ssh-github.bat first to generate an SSH key.
  echo.
  pause
  exit /b 1
)

echo 1. Making sure ssh-agent is running...
echo.
start /b ssh-agent 

echo 2. Adding your SSH key to ssh-agent...
echo.
ssh-add "%USERPROFILE%\.ssh\id_ed25519"

echo.
echo 3. Your public SSH key is:
echo -----------------------------------
type "%USERPROFILE%\.ssh\id_ed25519.pub"
echo -----------------------------------
echo.
echo IMPORTANT: Verify that this EXACT key is added to your GitHub account.
echo.

echo 4. Testing SSH connection to GitHub with verbose output...
echo.
ssh -vT git@github.com

echo.
echo If you're still seeing "Permission denied (publickey)" above, follow these steps:
echo.
echo - Double-check that the key shown above matches EXACTLY what's in your GitHub account
echo - Make sure you've added the key to the correct GitHub account
echo - Try creating a new SSH key with setup-ssh-github.bat if needed
echo.
echo Would you like to open GitHub SSH settings to verify your key?
set /p open_browser=Type 'yes' to open browser or press Enter to skip: 

if "%open_browser%"=="yes" (
  start https://github.com/settings/keys
)

echo.
echo Press any key to exit...
pause > nul