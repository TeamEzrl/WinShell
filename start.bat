@echo off
title %name% WinShell v0.1 (Beta Release)
color 0a

goto :os

:os
echo Kerlek valassz redszert
echo 1 = Windows 7
echo 2 = Windows 10
echo 3 = Windows 11
echo 4 = Open boot / special boot menu
echo 5 = Kilepes
set/p "os=>"
if %os%== 1 goto :7
if %os%== 2 goto :10
if %os%== 3 goto :11
if %os%== 4 goto :boot
if %os%== 5 exit
cls
goto :os


:11
cls
echo Valasztott operacios rendszer: Windows 11
echo >nul
echo Kerlek valassz!
echo 0 = Python telepitese verzio valtasa
echo 1 = Python telepitese
echo 2 = Win 11 home Frissitese Pro-ra
echo 3 = Gep ujrainditasa azonnal
echo 4 = Microsoft 365 aktivalasa
echo 5 = Vissza
set/p "valaszt11=>"
if %valaszt11%== 0 goto :all11
if %valaszt11%== 1 goto :Pythoninst
if %valaszt11%== 2 goto :11Pro
if %valaszt11%== 3 goto :Restart
if %valaszt11%== 4 goto :ms365
if %valaszt11%== 5 goto :os
cls
goto :11


:10
cls
echo Valasztott operacios rendszer: Windows 10
echo >nul
echo Kerlek valassz!
echo 0 = Python telepitese verzio valtasa
echo 1 = Python telepitese
echo 2 = Win 10 home Frissitese Pro-ra
echo 3 = Gep ujrainditasa azonnal
echo 4 = Microsoft 365 aktivalasa
echo 5 = Vissza
set/p "valaszt10=>"
if %valaszt10%== 0 goto :all10
if %valaszt10%== 1 goto :Pythoninst
if %valaszt10%== 2 goto :10Pro
if %valaszt10%== 3 goto :Restart
if %valaszt10%== 4 goto :ms365
if %valaszt10%== 5 goto :os
cls
goto :10


:7
cls
echo Valasztott operacios rendszer: Windows 7
echo >nul
echo 0 = Home Frissitese Pro-ra
echo 1 = Microsoft 365 aktivalasa
echo 2 = Vissza
echo 3 = Kieles
set/p "valaszt7=>"
if %valaszt7%== 0 goto :7PRO
if %valaszt7%== 1 goto :ms365
if %valaszt7%== 2 goto :os
if %valaszt7%== 3 exit
cls
goto :7
exit






:11Pro
cls
echo Changing Win 11 Home - Win 11 Pro
powershell changepk.exe /productkey VK7JG-NPHTM-C97JM-9MPGT-3V66T
timeout 10
exit

:10Pro
cls
echo Changing Win 10 home - win 10 Pro
powershell changepk.exe /productkey VK7JG-NPHTM-C97JM-9MPGT-3V66T
timeout 10
exit

:7PRO
cls
echo Changing win 7 home - win 7 pro
powershell dism.exe /online /set-edition:Professional /productkey:ABCDE-FGHIJ-KLMNO-PQRST-UVWXY
exit






:Restart
cls
echo Restarting Pc
start C:\Windows\System32\shutdown.exe /s /t 0
exit


:boot
cls
echo Opening boot menu
start C:\Windows\System32\shutdown.exe /r /o /t 1



:all11
cls
echo Starting
goto :Pythoninstall
exit

:all10
cls
echo Starting
goto :Pythoninstall
exit






:Pythoninst
echo Error^: Python not installed
echo Downloading Python 3.7.0...
IF EXIST ".\python-3.7.0.exe" (
  echo Found Installer at ".\python-3.7.0.exe"
) ELSE (
  powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls; Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.7.0/python-3.7.0.exe' -OutFile '.\python-3.7.0.exe';}"
  echo Python download completed.
)

echo Installing Python...
powershell .\python-3.7.0.exe /quiet InstallAllUsers=0 PrependPath=1 Include_test=0 TargetDir=c:\Python\Python370
setx path "%PATH%;C:\Python\Python370\"

timeout /t 30 /nobreak > nul
echo Python Installation completed.
echo Installing python dependencies.
start cmd /k python -m pip install -r requirements.txt
exit



:Pythoninstall
cls
echo Error^: Python not installed
echo Downloading Python 3.7.0...
IF EXIST ".\python-3.7.0.exe" (
  echo Found Installer at ".\python-3.7.0.exe"
) ELSE (
  powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls; Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.7.0/python-3.7.0.exe' -OutFile '.\python-3.7.0.exe';}"
  echo Python download completed.
)

echo Installing Python...
powershell .\python-3.7.0.exe /quiet InstallAllUsers=0 PrependPath=1 Include_test=0 TargetDir=c:\Python\Python370
setx path "%PATH%;C:\Python\Python370\"

timeout /t 30 /nobreak > nul
echo Python Installation completed.
echo Installing python dependencies.
start cmd /k python -m pip install -r requirements.txt
powershell changepk.exe /productkey VK7JG-NPHTM-C97JM-9MPGT-3V66T
exit





:ms365
cls
echo Activating...
cd /d %ProgramFiles%\Microsoft Office\Office16
cscript ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99
cscript ospp.vbs /unpkey:BTDRB >nul
cscript ospp.vbs /unpkey:KHGM9 >nul
cscript ospp.vbs /unpkey:CPQVG >nul
cscript ospp.vbs /act
echo Done!
pause