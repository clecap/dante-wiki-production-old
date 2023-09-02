#!/bin/bash

#
# Driver function which initializes the MediaWiki database and generates a local settings file
#

source ./script-library.sh


MW_SITE_NAME=$1
MW_SITE_SERVER=$2
SITE_ACRONYM=$3
WK_PASS=$4

MOUNT="/var/www/html"
VOLUME_PATH=wiki-dir
LAP_CONTAINER=my-lap-container
DB_CONTAINER=my-mysql

DB_USER=user${SITE_ACRONYM}
DB_NAME=DB_${SITE_ACRONYM}
DB_PASS=`openssl rand -base64 14`

addDatabase ${DB_NAME} ${DB_USER} ${DB_PASS}

removeLocalSettings ${LAP_CONTAINER} ${MOUNT} ${VOLUME_PATH}

runMWInstallScript ${MW_SITE_NAME} ${MW_SITE_SERVER} ${SITE_ACRONYM} ${WK_PASS}

addingReferenceToDante ${MOUNT} ${VOLUME_PATH} ${LAP_CONTAINER}

