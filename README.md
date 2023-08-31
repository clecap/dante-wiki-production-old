# dante-wiki-production

This repository is for an end user wanting to install DanteWiki.

# Requirements for DanteWiki

DanteWiki is based on two Docker images, so you need a possibility to run Docker images. A traditional
docker server is fine, but DanteWiki will also run on a medium-sized laptop. It consists of a web-server,
a PHP application process, which is a MediaWiki modification, and a number of latex processes. 
It uses extensive caching. It is not a microservice architecture and can make use of several CPUs
for speeding up reaction time.

We currently run the system on our development machine with 8 vCPUs, 8 GB Memory and 20 GB Disc and we are
studying performance to cut down on this which probably is massive overprovisioning.

**CPU:**  minimum 2 vCPUs, recommended 4 vCPUs
**MEMORY:** minimum 6GB, recommended 8 GB
**DISK:** 8-10 GB recommended

# Installation

## Description of Installation

1. Make a suitable local directory `dante`.
2. Download the zip archive at https://github.com/clecap/dante-wiki-production/archive/refs/heads/main.zip into directory `dante`.
3. Unzip file `main.zip` into the top-level directory `dante`
4. Edit the configuration file `CONF.sh`. The data required in the configuration file is described by comments directly in this file. There is a backup 
of the original configuration file in `CONF-sample.sh`.
5. Run DanteWIki installation script `dante-sh` (this may take several minutes).

## Commands for Installation

```
mkdir dante
cd dante
wget https://github.com/clecap/dante-wiki-production/archive/refs/heads/main.zip
unzip -j main.zip
```

# Running DanteWiki

## Local Installation Only


## Network-based Installation


# Backup and Restore of DanteWiki

DanteWiki is TBD



# Updating DanteWiki

DanteWiki is software in development. As it follows the perpetual-beta philosophy of Web 2.0 we will see updates.
For small updates you can execute ùpdate-dante.sh`. 

It is good operational practice to make a backup of data before every update.
