#!/bin/bash

# Cleaning up a dante installation

# get directory where this script resides wherever it is called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "*** Cleaning up docker ressources generated..."
  docker container stop my-lap-container -t 0
  docker container rm my-lap-container
  docker container stop my-mysql -t 0
  docker container rm my-mysql
  docker network   rm dante-network
  docker volume rm my-test-db-volume
echo "DONE cleaning up docker ressources generated"

echo "*** Removing generated directories"
  rm -Rf ${DIR}/volumes
  rm -Rf ${DIR}/conf
echo "DONE removing generated directories"