#!/bin/bash

echo "Downloading DDLC"
wget -O "DDLC.zip" http://drive.sereno.kick.sh/drive/games/ddlc-win.zip -q --show-progress
echo "Downloading RPATool"
wget -O "rpatool.py" https://raw.githubusercontent.com/shizmob/rpatool/master/rpatool -q --show-progress
echo "Unpacking DDLC"
unzip DDLC.zip # Unpack the game
mv DDLC-1.1.1-pc DDLC

echo "Extracting DDLC"
python3 ./rpatool.py -x ./DDLC/game/fonts.rpa -o ./DDLC/game/
echo "Extracted fonts.rpa"
python3 ./rpatool.py -x ./DDLC/game/scripts.rpa -o ./DDLC/game/
echo "Extracted scripts.rpa"
python3 ./rpatool.py -x ./DDLC/game/audio.rpa -o ./DDLC/game/
echo "Extracted audio.rpa"
python3 ./rpatool.py -x ./DDLC/game/images.rpa -o ./DDLC/game/
echo "Extracted images.rpa"

echo "Creating mod folder"
mkdir mod
echo "Put the mod's files inside of the mod folder then hit enter"
read -r

mkdir DDLCModded
cp -r DDLC/* DDLCModded/
cp -r mod/* DDLCModded/game/
echo "Installed modded game in 'DDLCModded'"

chmod -R 777 DDLCModded
rm rpatool.py
rm DDLC.zip
rm -rf DDLC
rm -rf mod
echo "Install is complete!"
echo "Modded game is in the "DDLCModded" folder"
