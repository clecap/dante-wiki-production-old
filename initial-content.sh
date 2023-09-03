#!/bin/bash

## The original of this file is in dante-wiki-production

# get directory where this script resides wherever it is called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TOP_DIR=${DIR}/..


LAP_CONTAINER=my-lap-container
DUMPFILE=/var/www/html/wiki-dir/initial-contents.xml

cp ${DIR}/initial-contents.xml ${DIR}/volumes/wiki-dir/initial-contents.xml

docker exec ${LAP_CONTAINER}  php /var/www/html/wiki-dir/maintenance/importDump.php --namespaces '8' --debug < ${DUMPFILE}
docker exec ${LAP_CONTAINER}  php /var/www/html/wiki-dir/maintenance/importDump.php --namespaces '10' --debug < ${DUMPFILE}
docker exec ${LAP_CONTAINER}  php /var/www/html/wiki-dir/maintenance/importDump.php --uploads --debug < ${DUMPFILE}
docker exec ${LAP_CONTAINER}  php /var/www/html/wiki-dir/maintenance/rebuildrecentchanges.php
docker exec ${LAP_CONTAINER}  php /var/www/html/wiki-dir/maintenance/initSiteStats.php --update 
