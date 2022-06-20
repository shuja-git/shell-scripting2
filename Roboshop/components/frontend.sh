#!/bin/bash

#set -e

# yum install nginx -y
# systemctl enable nginx
# systemctl start nginx
#Let's download the HTML content that serves the RoboSHop Project UI and deploy under the Nginx path.

# curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
#Deploy in Nginx Default Location.

# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-master static README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf
#Finally restart the service once to effect the changes.

# systemctl restart nginx
#-----------------------------

LOG_FILE=/tmp/roboshop.log
rm -f ${LOG_FILE}

STAT_CHECK(){
if [ $1 -ne 0 ]; then
  echo -e "\e[1;31m${2} - Failed\e[0m"
  exit 1
else
  echo -e "\e[1;32m${2}- Success\e[0m"
fi

}

yum install nginx -y >>${LOG_FILE}
STAT_CHECK $? "Nginx install"
curl  -f -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>${LOG_FILE}
STAT_CHECK $? "Download nginx"
rm -rf /usr/share/nginx/html/*
#rm -rf *
STAT_CHECK $? "Remove Old HTML pages"

#unzip /tmp/frontend.zip
#mv frontend-main/* .
#mv static/* .
cd /tmp && unzip -o /tmp/frontend.zip &>>${LOG_FILE}
STAT_CHECK $? "Extracting frontend content"

#rm -rf frontend-master static README.md

cd /tmp/frontend-main/static/ && cp -r * /usr/share/nginx/html/
STAT_CHECK $? "copying frontend content"

#mv localhost.conf /etc/nginx/default.d/roboshop.conf
cp /tmp/frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf
STAT_CHECK $? "Update Nginx config file"
systemctl enable nginx &>>${LOG_FILE} && systemctl restart nginx
STAT_CHECK $? "Restart Nginx"

