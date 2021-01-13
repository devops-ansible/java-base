#!/usr/bin/env bash

###
## Install OpenJDK
###

apt-get update
apt-get remove --auto-remove openjdk* openjdk-11-jre-headless
apt-get install -y openjdk-8-jdk ca-certificates-java
rm /usr/bin/java
# Dockerfile:
# ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ln -s ${JAVA_HOME}jre/bin/java /usr/bin/java

export JAVA_HOME


###
## install additional tools
###

apt-get install -y gosu


###
## cleanup APT cache
###
#
apt-get -y clean
apt-get -y autoclean
apt-get -y autoremove
rm -r /var/lib/apt/lists/*


###
## install Java MySQL connector
###

tmpfolder=$(mktemp -d)
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz -O $tmpfolder/mysql-connector.tar.gz
tar -zxvf $tmpfolder/mysql-connector.tar.gz -C $tmpfolder
mkdir -p /usr/share/java/
cp $tmpfolder/mysql-connector-java-*/mysql-connector-java-*bin.jar /usr/share/java/mysql-connector-java.jar
rm -rf $tmpfolder


###
## Install AWS Certificates
###

# RDS Frankfurt Version DEPRECATED
wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem -P /usr/share/ca-certificates
chmod 0755 /usr/share/ca-certificates/rds-combined-ca-bundle.pem
echo "rds-combined-ca-bundle.pem" >> /etc/ca-certificates.conf

# RDS Frankfurt Version 2019
wget https://s3.amazonaws.com/rds-downloads/rds-ca-2019-eu-central-1.pem -P /usr/share/ca-certificates
chmod 0755 /usr/share/ca-certificates/rds-ca-2019-eu-central-1.pem
echo "rds-ca-2019-eu-central-1.pem" >> /etc/ca-certificates.conf


###
## Install it-economics RootCA – this will be removed later
###

wget http://ca.it-economics.de/it-economics_CA.crt -P /usr/share/ca-certificates
chmod 0755 /usr/share/ca-certificates/it-economics_CA.crt
echo "it-economics_CA.crt" >> /etc/ca-certificates.conf


###
## update CA certificates
###

update-ca-certificates


###
## prepare /boot.d directory
###

chmod a+x /boot.sh
