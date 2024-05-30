@echo off

echo Creating "mod" folder
mkdir mod
echo Put the mod's files inside of the mod folder then hit enter
pause
echo Downloading DDLC
powershell -Command "Invoke-WebRequest -Uri https://himeko.sereno.ftp.sh/f/ddlc-win.zip -OutFile DDLC.zip"
echo Downloading rpatool
powershell -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/shizmob/rpatool/master/rpatool -OutFile rpatool.py"
echo Unpacking DDLC
powershell -Command "Expand-Archive DDLC.zip"
ren DDLC-1.1.1-pc DDLC

echo Extracting DDLC
python ./rpatool.py -x ./DDLC/game/fonts.rpa -o ./DDLC/game/
echo Extracted fonts.rpa
python ./rpatool.py -x ./DDLC/game/scripts.rpa -o ./DDLC/game/
echo Extracted scripts.rpa
python ./rpatool.py -x ./DDLC/game/audio.rpa -o ./DDLC/game/
echo Extracted audio.rpa
python ./rpatool.py -x ./DDLC/game/images.rpa -o ./DDLC/game/
echo Extracted images.rpa

mkdir DDLCModded
xcopy DDLC DDLCModded /E /I
xcopy mod\*.* DDLCModded\game /E /I
echo Installed modded game in "DDLCModded"

del DDLC.zip
rmdir /S /Q DDLC
echo Finished!
