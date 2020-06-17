@echo off
rem build with Wine: wine cmd /c build.bat
echo Make smpstest.bin
tools\asm68k.exe /k /p /o ae- build.68k, smps.bin >error.txt, , smps.lst
if %ERRORLEVEL% neq 0 goto error
echo All done!
goto eof
:error
type error.txt
pause
:eof
