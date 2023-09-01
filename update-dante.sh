#!/bin/bash

echo "*** Getting fresh source..."
rm -f main.zip
wget https://github.com/clecap/dante-wiki-production/archive/refs/heads/main.zip
echo "DONE getting fresh source"

echo "*** Unzipping source..."
unzip -j main.zip
echo "DONE unzipping fresh source"

echo "*** Copying in preserved old configuration..."
cp -f CONF-backup.sh CONF.sh
echo "DONE copying in preserved old configuration"

echo "*** Running installer again..."
source ./install-dante.sh
echo "DONE running installer again"
