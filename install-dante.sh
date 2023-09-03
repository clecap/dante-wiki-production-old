#!/bin/bash

## The original of this file is in dante-wiki-production

# get directory where this script resides wherever it is called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TOP_DIR=${DIR}/..

set -e

rm ${TOP_DIR}/main.zip

echo ""; "*** Making a backup of the configuration file CONF.sh"
cp ${DIR}/CONF.sh ${DIR}/CONF-backup.sh
echo "DONE making a backup of the configuration file CONF.sh";

echo ""; echo "*** Building volume"
mkdir -p ${DIR}/volumes/full/content/wiki-dir
tar --no-same-owner -xzvf ${DIR}/dante-deploy.tar.gz  -C ${DIR}/volumes/full/content > ${DIR}/tar-extraction-log
echo "DONE building volume"

echo ""; echo "*** Pulling Docker Images from docker hub..."
  docker pull clecap/lap:latest
  docker pull clecap/my-mysql:latest
echo "DONE pulling docker images"

echo ""; echo "*** Retagging docker images into local names for install mechanisms..."
  docker tag clecap/lap:latest lap
  docker tag clecap/my-mysql:latest my-mysql
echo "DONE "

echo ""; echo "*** Starting containers..."
${DIR}/images/lap/bin/both.sh --db my-test-db-volume --dir full
echo "DONE starting containers"


echo ""; echo "*** Generating configuration file directory"
mkdir -p ${DIR}/conf
source ${DIR}/CONF.sh

MWP=${DIR}/conf/mediawiki-PRIVATE.php
rm -f ${MWP}
echo  "<?php "   > ${MWP}
echo "\$wgPasswordSender='${SMTP_SENDER_ADDRESS}';          // address of the sending email account                            " >> ${MWP}
echo "\$wgSMTP = [                                                                                                             " >> ${MWP}
echo  "  'host'     => '${SMTP_HOSTNAME}',                 // hostname of the smtp server of the email account  " >> ${MWP}
echo  "  'IDHost'   => 'localhost',                        // sub(domain) of your wiki                                             " >> ${MWP}
echo  "  'port'     => ${SMTP_PORT},                       // SMTP port to be used      " >> ${MWP}
echo  "  'username' => '${SMTP_USERNAME}',                 // username of the email account   " >> ${MWP}
echo  "  'password' => '${SMTP_PASSWORD}',                 // password of the email account   " >> ${MWP}
echo  "  'auth'     => true                                // shall authentisation be used    " >> ${MWP}
echo "]; ?>  " >> ${MWP}

cp ${MWP} ${DIR}/volumes/full/content/wiki-dir

CUS=${DIR}/conf/customize-PRIVATE.sh
rm -f ${CUS}
echo "MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}"        > ${CUS}
echo "MYSQL_DUMP_USER=${MYSQL_DUMP_USER}"                >> ${CUS}
echo "MYSQL_DUMP_PASSWORD=${MYSQL_DUMP_PASSWORD}"        >> ${CUS}
echo "DEFAULT_DB_VOLUME_NAME=${DEFAULT_DB_VOLUME_NAME}"  >> ${CUS}
echo "MW_SITE_SERVER=${MW_SITE-SERVER}"                  >> ${CUS}
echo "MW_SITE_NAME='${MW_SITE_NAME}'"                    >> ${CUS}

echo "DONE generating configuration file directory"



MYSQL_CONTAINER=my-mysql



echo ""; echo "*** Waiting for database to come up..."
echo "" ;echo "   PLEASE WAIT AT LEAST 1 MINUTE UNTIL NO ERRORS ARE SHOWING UP ANY LONGER"; echo ""
# while ! docker exec ${MYSQL_CONTAINER} mysql --user=root --password=${MYSQL_ROOT_PASSWORD} -e "SELECT 1" >/dev/null 2>&1; do
while ! docker exec ${MYSQL_CONTAINER} mysql --user=root --password=${MYSQL_ROOT_PASSWORD} -e "SELECT 1"; do
  sleep 1
  echo "   Still waiting for database to come up..."
done

echo ""; echo "*** Initializing Database"

# volumes/full/spec/wiki-db-local-initialize.sh mysite https://localhost:4443 acro adminpassword sqlpassword

${DIR}/volumes/full/spec/wiki-db-local-initialize.sh mysite https://192.168.168.250:4443 acro adminpassword sqlpassword

echo ""; echo "*** Installer install-dante.sh completed"

echo ""; echo "*** Installer now calling inital.content"
${DIR}/initial-content.sh



echo ""; echo "";
echo "*** DanteWiki should now be available locally at ${DANTE_WIKI_URL}/wiki-dir/index.php"

