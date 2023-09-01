#!/bin/bash

echo "*** Making a backup of configuration file"
cp CONF.sh CONF-backup.sh
echo "DONE making a backup of configuration file";

echo "*** Pulling Docker Images from docker hub..."
  docker pull clecap/my-lap
  docker pull clecap/my-mysql
echo "DONE pulling docker images"



# images-my

# ${DIR}/../../my-mysql/bin/run.sh ${DB_SPEC}
# images-lap-bin-run.sh
# ["--db", "my-test-db-volume",  "--dir", "full"]

# docker run
# docker run



echo "*** Building volume"



echo "*** Initializing Database"


echo "*** Loading initial content"


