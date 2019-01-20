#!/usr/bin/env bash
#编译+部署order站点
#需要配置如下参数
# 输入你的环境上tomcat的全路径
# export TOMCAT_APP_PATH=tomcat在部署机器上的路径
# 停tomcat
cd /home/admin/apache-tomcat-8.5.31/bin/
sh shutdown.sh
# 删除原有工程
rm -rf /home/admin/apache-tomcat-8.5.31/webapps/order
rm -f /home/admin/apache-tomcat-8.5.31/webapps/order.war
cp /home/admin/app/order.war /home/admin/apache-tomcat-8.5.31/webapps/
# cd /home/admin/apache-tomcat-8.5.31/webapps/
# mv order.war ROOT.war
# 启动Tomcat
cd /home/admin/apache-tomcat-8.5.31/bin/
sh startup.sh