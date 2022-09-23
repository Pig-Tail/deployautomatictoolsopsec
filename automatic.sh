#!/bin/bash
echo "###################################################################"
echo "###################################################################"
echo "###################################################################"
echo "##############AUTOMATIC DEPLOY SOME INTERESTING TOOLS##############"
echo "###################################################################"
echo "###################################################################"
echo "###################################################################"
echo "##########################Update and upgrade ###############################"
apt-get update
apt-get upgrade
apt --fix-broken install
echo "##########################Install pip3##########################"
apt install python3-pip
echo "##########################Install nmap##########################"
apt install nmap
echo "##########################Install tor##########################"
apt install tor
echo "##########################Install proxychains##########################"
apt install proxychains
echo "##########################Install Updog. Allows uploading and downloading via HTTP/S, can set ad hoc SSL certificates and use http basic auth##########################"
pip3 install updog
echo "##########################Install impacket##########################"
python3 -m pip install impacket
echo "##########################Install apache2##########################"
apt-get install apache2 
echo "##########################Snap install core for certbot##########################"
snap install core; sudo snap refresh core
echo "##########################Install Certbot##########################"
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
certbot --apache
echo "##########################Automatic renewal###############################"
certbot renew --dry-run
echo "##########################Descargando el chisel###############################"
wget https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_amd64.gz
gzip -d chisel_1.7.7_linux_amd64.gz
rm chisel_1.7.7_linux_amd64.gz
chmod +x chisel_1.7.7_linux_amd64
mv chisel_1.7.7_linux_amd64 /usr/bin
echo "##########################Poniendo al Apache Rocoso###############################"
sh ./rocoso.sh
