#!/bin/bash
now=$(date)
service=mysqld

i=`ps -eaf | grep -i $service |sed '/^$/d' | wc -l`
echo $i
if [[ $i > 1 ]]
then
  echo $service" service is running"
else
  echo $service" service not running"
  /usr/sbin/service $service restart
  echo "Mysql was not running @ "$HOSTNAME" at "$now | mail -s "ALERT - Mysql was not running @ "$HOSTNAME noc@
fi  


