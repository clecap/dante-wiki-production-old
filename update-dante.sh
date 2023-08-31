#!/bin/bash

wget https://github.com/clecap/dante-wiki-production/archive/refs/heads/main.zip
unzip -j main.zip
cp -f CONF-backup.sh CONF.sh