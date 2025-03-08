@echo off
setlocal enabledelayedexpansion

echo ========================================
echo GitHub Push Troubleshooter and Fixer
echo ========================================
echo.

REM Check if Git is installed
where git >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
  echo ERROR: Git is not installed or not in your PATH.
  echo Please install Git from https://git-scm.com/downloads
  pause
  exit /b 1
)

echo Step 1: Verifying SSH connection to GitHub...
ssh -T git@github.com
echo.

echo Step 2: Setting up Git identity (required)...
git config --local user.name "HardHatOptional"
git config --local user.email "your.email@example.com"
echo Identity set with placeholder values. Change these later if needed.
echo.

echo Step 3: Checking repository status...
if not exist .git (
  echo Initializing Git repository...
  git init
) else (
  echo Repository already initialized.
)
echo.

echo Step 4: Creating a README file if it doesn't exist...
if not exist README.md (
  echo Creating README.md...
  echo # Dodge Challenge > README.md
  echo A simple game created with HTML and JavaScript. >> README.md
)
echo.

echo Step 5: Staging files...
git add .
echo.

echo Step 6: Creating initial commit...
git commit --allow-empty -m "Initial commit"
echo.

echo Step 7: Setting up remote...
git remote remove origin 2>nul
echo Adding GitHub remote using SSH...
git remote add origin git@github.com:HardHatOptional/DodgeChallenge.git
echo.

echo Step 8: Checking current branch...
for /f "tokens=*" %%a in ('git rev-parse --abbrev-ref HEAD 2^>nul') do set current_branch=%%a
if "!current_branch!"=="" (
  echo Creating main branch...
  git checkout -b main
  set current_branch=main
)
echo Current branch: !current_branch!
echo.

echo Step 9: Force pushing to GitHub...
echo This will overwrite any existing content on GitHub.
echo.
git push -f origin !current_branch!

if %ERRORLEVEL% neq 0 (
  echo.
  echo Push failed. Please check:
  echo 1. Repository exists at https://github.com/HardHatOptional/DodgeChallenge
  echo 2. SSH key is correctly added to GitHub
  echo 3. You have write access to the repository
  echo.
) else (
  echo.
  echo Success! Your code has been pushed to GitHub.
  echo Visit: https://github.com/HardHatOptional/DodgeChallenge
  echo.
)

pause