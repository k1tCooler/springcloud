#!/bin/sh
#微服务启动程序命令
cp /dev/null nohup.out

PROCESS_NAME="config-server-1.0.0.jar"
PROCESS=`ps -ef|grep ${PROCESS_NAME}|grep -v grep|grep -v PPID|awk '{print $2"|"$10$11$12}'`
for i in $PROCESS
do
 pid=`echo $i|cut -d"|" -f1`
 kill -9 ${pid}
done

echo 'step 3:start process'
java -jar config-server-1.0.0.jar --spring.profiles.active=subversion  --spring.profiles.include=$1


>/dev/null 2>&1




