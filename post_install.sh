#!/bin/bash

# update & upgrade 
sudo apt-get -y update
#sudo apt-get -y upgrade
#sudo apt-get -y autoremove

#Install Thai language
#sudo apt-get install -y fonts-thai-tlwg-ttf

#Install gzip
sudo apt-get install -y gzip

#Install NGINX
sudo apt-get install -y nginx

#Install CURL
sudo apt-get install -y curl

#install NodeJS
#sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

#sudo apt-get update
sudo apt-get install nodejs -y

#Install PM2
sudo npm install -y pm2@latest -g

#Install PM2 Log Rotate
pm2 install pm2-logrotate

#Install PM2 Log Rotate - configuration
pm2 set pm2-logrotate:max_size 128M
pm2 set pm2-logrotate:retain 7
pm2 set pm2-logrotate:compress true
pm2 set pm2-logrotate:dateFormat YYYY-MM-DD_HH-mm-ss
pm2 set pm2-logrotate:rotateModule true
pm2 set pm2-logrotate:workerInterval 30
pm2 set pm2-logrotate:rotateInterval '0 0 * * *'

#Install GIT
sudo apt-get install -y git

#Auto clean
apt-get autoclean -y
apt-get autoremove -y
