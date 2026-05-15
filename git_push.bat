@echo off

cd /d "C:\CLD_AI_project\assist-decommission-master"

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo ERROR: Not a git repository
    pause
    exit /b
)

git add -A

set /p msg="Enter commit message: "

git commit -m "%msg%"

git push origin master

pause