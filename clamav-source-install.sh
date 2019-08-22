#!/bin/bash
#This script will download, compile, and install Clam Anti Virus from source.

echo Do you want to install the optional packages for clamav-milter and testing[y/N]?
read optional

#Install developer tools
sudo dnf groupinstall -y "Development Tools"

#Install dependencies
sudo dnf install -y openssl openssl-devel libcurl-devel zlib-devel libpng-devel libxml2-devel json-c-devel bzip2-devel pcre2-devel ncurses-devel

#Optional tools for clamav
case $optional in
	[yY]) sudo dnf install -y sendmail sendmail-devel valgrind check;;
esac

#Download clamav source
cd ~/Downloads
wget https://www.clamav.net/downloads/production/clamav-0.101.4.tar.gz #https://www.clamav.net/downloads/production/clamav-0.101.4.tar.gz.sig
tar -xzf *.tar.gz && rm -rf *.gz
cd clam*
./configure --enable-check

#Compilation and testing
make -j2
make check

#Installation
make install
