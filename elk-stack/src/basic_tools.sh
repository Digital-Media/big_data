#!/bin/bash
echo "## Installing zip, unzip, curl, net-tools, ... ##"
apt update
apt install apt-utils software-properties-common
apt-get -y install apt-transport-https curl git gnupg2 iputils-ping less nano net-tools telnet vim wget
