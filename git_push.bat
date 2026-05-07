@echo off

cd /d "C:\AIProjects\Claude\Assist decomission"

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