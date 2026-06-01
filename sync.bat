@echo off
cd /d "%~dp0"
echo.
echo [my-edge] Syncing to GitHub...
echo.
git add -A
git diff --cached --stat
echo.
set /p msg="Commit message (or press Enter for 'update'): "
if "%msg%"=="" set msg=update
git commit -m "%msg%"
git push
echo.
echo [my-edge] Done. Live at https://noahsa11.github.io/my-edge/
echo.
pause
