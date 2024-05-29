@echo off
git pull
echo.
setlocal enabledelayedexpansion
set dir=articles/
set /a num=0
echo The following folders are located in content/articles/
echo.
for /d %%d in (content/%dir%*) do (
set /a num+=1
echo !num!. %%d
set dir[!num!]=%%d
)
echo.
set /p action=Select folder(1/%num%):
set ndir=%dir%!dir[%action%]!/
set kind=!dir[%action%]!
echo.
echo Selected !dir[%action%]!
echo.
set /a num=0
for /R %%f in (content/%ndir%*) do (
set /a num+=1
)
set action=%num%
set /p action=Input article number(1/%num%,default:%num%):
echo.
set file=%ndir%%action%.md
echo selected %file%
echo.
if not exist %file% (hugo new %file% -k %kind%)
start content/%file%