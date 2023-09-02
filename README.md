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

The instructions here are meant for a Linux or a MacOS machine.

If you use a Windows machine you are yourself responsible for this mistake ;-) and can adapt the files yourself.
Note, however, that the install files are written in bash.

## Description of Installation

1. Navigate into a directory which shall contain the installation directory.
2. Download the zip archive at https://github.com/clecap/dante-wiki-production/archive/refs/heads/main.zip into directory `dante`.
3. Unzip file `main.zip`
4. Navigate into the newly generated directory `dante-wiki-production-main`
4. Edit the configuration file `CONF.sh`. The data required in the configuration file is described by comments directly in this file. 
5. Run DanteWIki installation script `dante-sh` (this may take several minutes).

## Commands for Installation

```
wget https://github.com/clecap/dante-wiki-production/archive/refs/heads/main.zip
unzip main.zip
cd dante-wiki-production-main
```

Edit using your favorite editor, for example: ```vi CONF.sh                                   ```

```./install-dante.sh```

## First Test

DanteWiki should now be up and running on the target machine. 

For a first test of the connectivity try to access the webserver at 
http://localhost:8080/wiki-dir/FAQ via `browser`, `wget` or `curl`.
The DanteWiki should be accessible at http://localhost:8080/wiki-dir/index.php

# Further Configuration

Right now you can already use DanteWiki locally (i.e. on the installation machine) using the http protocol. However,
there are still two restrictions.

**Local use only:** You have to be logged on to the installation machine in order to use DanteWiki. This is not a problem if you want to
use DanteWiki only for your own purposes. You will still be able to download documents from other DanteWikis but you
will not be able to use all features of DanteWiki for distributing, publishing and sharing your documents with others.

* The access via http is not secure. So long as you use 




## Solution: Reverse Proxy


## Solution: Full Fledged Server


## Solution: Localhost Certificate



There now remain two problems you might want to solve. For a person with some IT skills, they are pretty easy to solve
and others may contact us in the future for some setup service and support.




* https://localhost:4443/wiki-dir/FAQ


http://DOCKER_IP_ADDRESS:8080/wiki-dir/FAQ
https://DOCKER_OWN_IP_ADDRESS:4443/wiki-dir/FAQ

Where DOCKER_IP_ADDRESS is the .1 IP in the class C network 
of docker0

netstat -rn produces the line 
  172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0

Then we can reach the server on 172.17.0.1

From any other machine via
* http://ANY_OWN_IP_ADDRESS:8080/wiki-dir/FAQ
* https://ANY_OWN_IP_ADDRESS:4443/wiki-dir/FAQ





# Running DanteWiki

## Local Installation Only


## Network-based Installation


# Backup and Restore of DanteWiki

DanteWiki is TBD



# Updating DanteWiki

DanteWiki is software in development. As it follows the perpetual-beta philosophy of Web 2.0 we will see updates.
For small updates you can execute ùpdate-dante.sh`. 

It is good operational practice to make a backup of data before every update.
