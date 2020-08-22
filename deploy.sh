#!/bin/bash

cd  /var/jenkins_home/workspace/vue-jenkins-demo

echo $PATH
echo 'pwd'
node -v
npm -v


npm config set registry http://registry.npm.taobao.org/

npm install

rm -rf ./dist/*

npm run build

cd ./dist

tar -zcvf jenkins_vue.tar.gz *

# scp -r ./dist root@cumthyb.site:/root/apps/tomcat/webapps

scp ./jenkins_vue.tar.gz  root@cumthyb.site:/root/apps/tomcat/webapps

tar -xf root@cumthyb.site:/root/apps/tomcat/webapps/jenkins_vue.tar.gz root@cumthyb.site:/root/apps/tomcat/webapps/jenkins_vue

