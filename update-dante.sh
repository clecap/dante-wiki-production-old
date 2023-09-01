#!/bin/bash


# get directory where this script resides wherever it is called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TOP_DIR=${DIR}/..

cd ${TOP_DIR}

echo "*** Getting fresh source..."
rm -f ${TOPD_DIR}/main.zip
wget https://github.com/clecap/dante-wiki-production/archive/refs/heads/main.zip
echo "DONE getting fresh source"

echo "*** Unzipping source..."
unzip -o main.zip
echo "DONE unzipping fresh source"

echo "*** Copying in preserved old configuration..."
cp -f ${DIR}/CONF-backup.sh ${DIR}/CONF.sh
echo "DONE copying in preserved old configuration"

echo "*** Running installer again..."
source ${DIR}/install-dante.sh
echo "DONE running installer again"
