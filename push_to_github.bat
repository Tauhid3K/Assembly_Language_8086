@echo off
REM =============================
REM Git Auto-Push Script for Windows (with prompts)
REM =============================

REM Ask for GitHub repository URL
set /p REPO_URL=Enter the GitHub repository URL: 

REM Ask for commit message
set /p COMMIT_MSG=Enter commit message: 

REM Go to the folder where this script is saved
cd /d %~dp0

REM Initialize Git if not already initialized
git init

REM Add all files
git add .

REM Commit changes
git commit -m "%COMMIT_MSG%"

REM Set remote (update if remote already exists)
git remote remove origin 2>nul
git remote add origin %REPO_URL%

REM Ensure branch is main
git branch -M main

REM Push to GitHub
git push -u origin main

echo.
echo ===== DONE! Your files are pushed to GitHub =====
pause
