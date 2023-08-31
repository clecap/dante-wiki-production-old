#!/bin/bash


echo "*** Making a backup of configuration file"
cp CONF.sh CONF-backup.sh

echo "*** Pulling Docker Images from docker hub..."
  docker pull clecap/my-lap-container
  docker pull clecap/my-mysql
echo "DONE pulling docker images"


# docker run
# docker run



echo "*** Building volume"



echo "*** Initializing Database"


echo "*** Loading initial content"


