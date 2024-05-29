@echo off
git status
echo.
echo Will automatically execute the following commands
echo.
echo Step 1: git add --all
echo Step 2: git commit
echo Step 3: git push
echo.
set /p action=Do you want to continue(y/n):
if "%action%"=="y" (
git add --all
git commit
git push
)
echo.
echo Done
pause