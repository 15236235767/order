#!/usr/bin/env bash
#编译+部署order站点
#需要配置如下参数
# 项目路径, 在Execute Shell中配置项目路径, pwd 就可以获得该项目路径
# export PROJ_PATH=这个jenkins任务在部署机器上的路径
# 输入你的环境上tomcat的全路径
# export TOMCAT_APP_PATH=tomcat在部署机器上的路径
### base 函数
killTomcat(){
    pid=`ps -ef|grep tomcat|grep java|awk '{print $2}'`
    echo "tomcat Id list :$pid"
    if [ "$pid" = "" ]
    then
      echo "no tomcat pid alive"
    else
      kill -9 $pid
    fi
}
# cd $PROJ_PATH/order
# mvn clean install
# 停tomcat
killTomcat
# 删除原有工程
rm -rf /home/admin/apache-tomcat-8.5.31/webapps/order
rm -f /home/admin/apache-tomcat-8.5.31/webapps/order.war
cp /home/admin/app/order.war /home/admin/apache-tomcat-8.5.31/webapps/
# cd /home/admin/apache-tomcat-8.5.31/webapps/
# mv order.war ROOT.war
# 启动Tomcat
cd /home/admin/apache-tomcat-8.5.31/bin/
sh startup.sh



