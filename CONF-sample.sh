#!/bin/bash

# The root password to be used for the MYSQL database
#
MYSQL_ROOT_PASSWORD=password

# User entitled to do a dump of the entire mysql installation
MYSQL_DUMP_USER=username
MYSQL_DUMP_PASSWORD=otherpassword

DEFAULT_DB_VOLUME_NAME=my-mysql-data-volume

MW_SITE_SERVER=https://www.clemenscap.de

MW_SITE_NAME="MatheWiki"

#
# SMTP Settings
#
# If you want to enable dante-wiki to send an email to you, you must provide some credentials
# to dante-wiki to an SMTP service from which it can send emails.
# Doing so is useful for a number of reasons, one of which is password recovery for your wiki.
#

# the email address which will be used as sender address of the emails
SMTP_SENDER_ADDRESS="sender@domain.de"

# hostname of an smtp server for the email account
SMTP_HOSTNAME='FILLIN',                      

# the port number on which the SMTP server offers its service
SMTP_PORT=587

# the username for logging in into the SMTP account
SMTP_USERNAME='usernamesamplexx'

# the password for logging in into the SMTP account
SMTP_PASSWORD='password'









