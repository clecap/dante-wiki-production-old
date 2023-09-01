#!/bin/bash

echo "*** Making a backup of the configuration file CONF.sh"
cp CONF.sh CONF-backup.sh
echo "DONE making a backup of the configuration file CONF.sh";

echo "*** Pulling Docker Images from docker hub..."
  docker pull clecap/my-lap:latest
  docker pull clecap/my-mysql:latest
echo "DONE pulling docker images"

echo "*** Starting containers..."
images/lap/bin/both.sh --db my-test-db-volume --dir full
echo "DONE starting containers"

echo "*** Building volume"
mkdir -p volumes/full/content/wiki-dir
tar -xzvf dante-deploy.tar.gz  -C volumes/full/content/wiki-dir
echo "DONE building volume"

echo "*** Generating configuration file directory"
mkdir -p conf
source CONF.sh

MWP=conf/mediawiki-PRIVATE.php

rm -f ${MWP}
echo  "<?php \n"   > ${MWP}
echo "$wgPasswordSender='${SMTP_SENDER_ADDRESS}';          // address of the sending email account                            " >> ${MWP}
echo "$wgSMTP = [                                                                                                             " >> ${MWP}
echo  "  'host'     => '${SMTP_HOSTNAME}',                 // hostname of the smtp server of the email account  " >> ${MWP}
echo  "  'IDHost'   => 'localhost',                        // sub(domain) of your wiki                                             " >> ${MWP}
echo  "  'port'     => ${SMTP_PORT},                       // SMTP port to be used      " >> ${MWP}
echo  "  'username' => '${SMTP_USERNAME}',                 // username of the email account   " >> ${MWP}
echo  "  'password' => '${SMTP_PASSWORD}',                 // password of the email account   " >> ${MWP}
echo  "  'auth'     => true                                // shall authentisation be used    " >> ${MWP}
echo "]; ?>  " >> ${MWP}

echo "*** Initializing Database"

echo "*** Loading initial content"