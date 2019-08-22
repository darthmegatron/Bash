#!/bin/bash

#This script will download, compile, and install Clam Anti Virus from source.

echo Do you want to install the optional packages for clamav-milter and testing[y/N]?
read optional

#Install developer tools
dnf groupinstall "Development Tools"

#Install dependencies
dnf install openssl openssl-devel libcurl-devel zlib-devel libpng-devel libxml2-devel json-c-devel bzip2-devel pcre2-devel ncurses-devel

#Optional tools for clamav
case $optional in
	[yY]) dnf install sendmail sendmail-devel valgrind check;;
esac

#Create clamav directory in opt
mkdir /opt/clamav && cd /opt/clamav

#Download clamav source 
wget https://www.clamav.net/downloads/production/clamav-0.101.4.tar.gz #https://www.clamav.net/downloads/production/clamav-0.101.4.tar.gz.sig

tar -xzf *.tar.gz && rm -rf *.tar.gz


