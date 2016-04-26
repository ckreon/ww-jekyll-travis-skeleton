#!/bin/bash
set -x

####################################################
#
# TRAVIS CI SETTINGS
#
####################################################

# Branch you want to deploy:
JTS_DBRANCH="master"

# Server IP:
JTS_SERV_IP="123.123.123.123"

# Server deploy path:
JTS_SERV_DP="/var/www/SITE_FOLDER"

# Username for Travis deploy:
JTS_TRV_USR="deploy"

# Filename of Travis key:
JTS_KEYNAME="jts_deploy_key"

# Gmail user (DO NOT ADD '@gmail.com'):
JTS_GML_USE="user"

####################################################
#
# You need to generate and encrypt an SSH key for
# Travis to connect to your server with:
# https://docs.travis-ci.com/user/encrypting-files/
#
# Update the 1_install.sh file, replacing the '@@@'
# symbols with the proper hash value.
#
####################################################