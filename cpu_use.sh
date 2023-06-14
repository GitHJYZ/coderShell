#!/bin/bash
now=`date -u -d"+8 hour" +'%Y-%m-%d %H:%M:%S'`
#cpu使用阈值
cpu_warn='75'
#mem空闲阈值
mem_warn='100'
#disk使用阈值
disk_warn='90'
#---cpu
item_cpu () {
cpu_idle=`top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d "."`
cpu_use=`expr 100 - $cpu_idle`
echo "$now 当前cpu使用率为 $cpu_use" >> /opt/cpu.log
if [ "$cpu_use" -gt "$cpu_warn" ]
    then
        echo "cpu warning!!!"
    else
        echo "cpu ok!!!"
fi
}
#---mem
item_mem () {
#MB为单位
mem_free=`free -m | grep "Mem" | awk '{print $4+$6}'`
echo "$now 当前内存剩余空间为 ${mem_free}MB" >> /opt/mem.log
if [ "$mem_free" -lt "$mem_warn"  ]
    then
        echo "mem warning!!!"
    else
        echo "mem ok!!!"
fi
}
#---disk
item_disk () {
disk_use=`df -P | grep /dev | grep -v -E '(tmp|boot)' | awk '{print $5}' | cut -f 1 -d "%"`
echo "$now 当前磁盘使用率为 $disk_use" >> /opt/disk.log
if [ "$disk_use" -gt "$disk_warn" ]
    then
        echo "disk warning!!!"
    else
        echo "disk ok!!!"
fi
 
 
}
item_cpu
item_mem
item_disk
