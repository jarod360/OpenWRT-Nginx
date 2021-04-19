#!/bin/sh
used=`free -m | awk 'NR==2' | awk '{printf("%.0f\n", $3/1024)}'`
free=`free -m | awk 'NR==2' | awk '{printf("%.0f\n", $4/1024)}'`
echo "=====================================" >> /var/log/mem.log
date >> /var/log/mem.log
echo "内存用量|[已使用：${used}MB][空闲：${free}MB]" >> /var/log/mem.log
if [ $free -le 350 ] ; then    ###此处单位为MB，低于24MB将执行内存清理，需要激进一点可将数值改高###
sync && echo 3 > /proc/sys/vm/drop_caches
used=`free -m | awk 'NR==2' | awk '{printf("%.0f\n", $3/1024)}'`
free=`free -m | awk 'NR==2' | awk '{printf("%.0f\n", $4/1024)}'`
echo "内存已整理|[已使用：${used}MB][空闲：${free}MB]" >> /var/log/mem.log
else
echo "暂不需要清理内存." >> /var/log/mem.log
fi
