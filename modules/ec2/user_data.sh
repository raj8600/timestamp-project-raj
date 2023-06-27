#!/bin/bash

sudo su -
yum update -y

yum install httpd -y
yum install wget -y

cd /

# Import index.html file in EC2

wget https://raw.githubusercontent.com/raj8600/webapp/main/index.html

cp index.html /var/www/html/

systemctl enable httpd 
systemctl start httpd
