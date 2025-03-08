@echo off
echo Setting up Git repository for Dodge Challenge...
echo Working directory: %CD%

REM Check if Git is installed
where git >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
  echo ERROR: Git is not installed or not in your PATH.
  echo.
  echo Please install Git from https://git-scm.com/downloads
  echo During installation, make sure to select the option to "Add Git to PATH"
  echo.
  echo After installing Git, close this window and run the script again.
  echo.
  pause
  exit /b 1
)

REM Set up Git identity
echo Setting up Git identity...
set /p git_name=Enter your name (for Git commits): 
set /p git_email=Enter your email (for Git commits): 
git config user.name "%git_name%"
git config user.email "%git_email%"
echo Identity set as: %git_name% <%git_email%>
echo.

REM Initialize git repository if not already done
IF NOT EXIST .git (
  echo Initializing Git repository...
  git init
) ELSE (
  echo Git repository already initialized.
)

REM Add all files
echo Adding files to Git...
git add .

REM Commit changes
echo Committing files...
set /p commit_message=Enter a commit message (or press Enter for default): 
if "%commit_message%"=="" set commit_message=Update Dodge Challenge game
git commit -m "%commit_message%"

REM Check if remote exists, if not add it
git remote | findstr /C:"origin" >nul
if %errorlevel% neq 0 (
  echo Adding GitHub remote using SSH...
  git remote add origin git@github.com:HardHatOptional/DodgeChallenge.git
  echo Remote added successfully.
)

REM Determine the default branch name
for /f "tokens=*" %%a in ('git symbolic-ref --short HEAD 2^>nul') do set default_branch=%%a
if "%default_branch%"=="" set default_branch=main

REM Push to GitHub
echo Pushing to GitHub using SSH...
echo Your code will be pushed to: https://github.com/HardHatOptional/DodgeChallenge

REM Determine the default branch name
for /f "tokens=*" %%a in ('git symbolic-ref --short HEAD 2^>nul') do set default_branch=%%a
if "%default_branch%"=="" set default_branch=main

echo.
echo Current branch: %default_branch%
echo Using SSH authentication method

REM Check if any commits exist
git rev-parse --verify HEAD >nul 2>&1
if %errorlevel% neq 0 (
  echo.
  echo No commits exist yet. Creating initial commit...
  echo. > README.md
  echo # Dodge Challenge >> README.md
  echo A simple game created with HTML and JavaScript. >> README.md
  git add README.md
  git commit -m "Initial commit with README"
)

REM Create the branch if it doesn't exist
git push -u origin %default_branch%

echo Done! Check your repository at: https://github.com/HardHatOptional/DodgeChallenge
echo After pushing, you can activate GitHub Pages to host your game at: https://HardHatOptional.github.io/DodgeChallenge/

echo.
echo Press any key to exit...
pause > nul