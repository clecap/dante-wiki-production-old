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

If you use a Windows machine you are yourself responsible for this mistake ;-) and, currently, 
should read https://programmerbear.com/why-microsoft-is-evil/ and adapt the bash installation files yourself.

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

# Further Configuration Changes

Right now you can already use DanteWiki through the http protocol. However,
serving it via http instead of https is still a restriction. ***First*** using http makes the system unsafe, as passwords 
and data could be eavesdropped by an attacker. ***Second*** some features of the browser are only available to
web pages which are serverd via https. The automatic window placement on external monitors is just one of several examples.
***Third*** the configuration of DanteWiki web server currently uses a non-trusted certificate, since I cannot know
the domain under which you want to run it. This certificate produces a browser warning when accessing the service via https.

Therefore you will want to make DanteWiki available via https. 

For this, three solutions are available. The optimal solution depends on your use case and your IT skills.

## https Solution: Reverse Proxy

This is the most secure and convenient solution. However, it needs the most IT skills to set up.
Here, you will
* set up a reverse proxy which directs the user to the DanteWiki web server and
* block access to ports 4443 and 8080 on the local machine.

## https Solution: Server Certificate

Here, you will
* buy a web server certificate
* install the certificate into DanteWiki web server and
* change the configuration of DanteWiki web server to make the service available on port 443 and
* change the configuration of DanteWiki web server to redirect an access to port 8080 to port 443

## https Solution: Localhost Certificate

Here, you will
* generate a certificate for localhost using mkcert and
* install the certificate for localhost on DanteWiki web server

## Port Change

We configured DanteWiki web server to use ports 4443 (for https) and 8080 (for http), as these ports most likely are
available on the target machine. However, these ports are not completely standard and require entering the port
number as part of the URL.

You may want to change the port numbers to the standard 443 (for https) and 80 (for http).

## How to Make These Configuration Changes

You can enter the containers for introspection or configuration change by shell commands via

`docker exec -it my-lap-container /bin/ash`
`docker exec -it my-mysql /bin/ash`

There you have an Alpine shell (ash) and can navigate the container Os as needed.

Note, that the changes you make are persistent only as long as the lifetime of the container.

To prevent this, we will provide some automated shell scripts for the standard cases. This still has to be done.



# TEXTGRAB

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



# Backup and Restore of DanteWiki

DanteWiki is TBD


# Updating DanteWiki

DanteWiki is software in development. As it follows the perpetual-beta philosophy of Web 2.0 we will see updates.
For small updates you can execute `update-dante.sh`. 

It is good operational practice to make a backup of data before every update.


# Debugging

We can enter the containers for introspection by shell commands via

`docker exec -it my-lap-container /bin/ash`
`docker exec -it my-mysql /bin/ash`

