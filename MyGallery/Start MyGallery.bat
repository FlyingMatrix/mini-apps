@echo off
rem ------------------------------------------------------------------
rem  Starts Chrome with local folder reading enabled and opens
rem  MyGallery.html (must be in the same folder as this .bat file).
rem  A separate Chrome profile is used so the switch only applies to
rem  this gallery window, not to your normal browsing.
rem ------------------------------------------------------------------
setlocal
set "HTML=%~dp0MyGallery.html"
set "PROFILE=%LOCALAPPDATA%\MyGalleryChrome"
set "CHROME="

if exist "%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe" set "CHROME=%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe"
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"

if not defined CHROME (
  echo Chrome was not found in the usual install folders.
  echo Please edit this .bat file and set the CHROME path manually.
  pause
  exit /b 1
)

if not exist "%HTML%" (
  echo MyGallery.html was not found next to this .bat file.
  pause
  exit /b 1
)

start "" "%CHROME%" --allow-file-access-from-files --user-data-dir="%PROFILE%" --no-first-run --start-maximized "%HTML%"
endlocal
