#!/bin/bash

## The original of this file is in dante-wiki-production

# get directory where this script resides wherever it is called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TOP_DIR=${DIR}/..



USER=apache


LAP_CONTAINER=my-lap-container
DUMPFILE=/var/www/html/wiki-dir/initial-contents.xml

echo ""; echo "*** Initial contents copied to volume"
cp ${DIR}/initial-contents.xml ${DIR}/volumes/full/content/wiki-dir/initial-contents.xml

echo ""; echo "*** Initial contents uploaded to wiki"
# CAVE: this must run as user apache
docker exec  --user ${USER} ${LAP_CONTAINER}  php /var/www/html/wiki-dir/maintenance/importDump.php --namespaces '8' --debug ${DUMPFILE}
docker exec  --user ${USER} ${LAP_CONTAINER}  php /var/www/html/wiki-dir/maintenance/importDump.php --namespaces '10' --debug ${DUMPFILE}
docker exec  --user ${USER} ${LAP_CONTAINER}  php /var/www/html/wiki-dir/maintenance/importDump.php --uploads --debug ${DUMPFILE}
echo "DONE uploading initial contents to wiki"

echo ""; echo "*** Running some maintenance commands"
docker exec  --user ${USER} ${LAP_CONTAINER}  php /var/www/html/wiki-dir/maintenance/rebuildrecentchanges.php
docker exec  --user ${USER} ${LAP_CONTAINER} php /var/www/html/wiki-dir/maintenance/initSiteStats.php --update 
echo "DONE running some maintenance commands"