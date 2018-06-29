#!/bin/bash
#自动备份脚本

#定义所需变量
WEB_PATH="/var/www/html/"				#需要备份的网站目录
BAKE_PATH="/opt"						#备份后存放目录
LOG_PATH="/var/apache_backup.log"		#备份日志存放目录及日志名称
filename="`date '+%F'`-apache.tar.gz"	#备份存放文件名称
to_file="$BAKE_PATH/$filename"
#备份失败退出
ERR_QUIT=1

#自动删除删除超期文件
#保留30多少天前的文件
OVERTIME=30
#删除超期文件
find $BAKE_PATH -ctime +$OVERTIME -a -name "*apache.tar.gz" -exec rm -f {} \;
if [ $? -eq 0 ];then
        echo -e "`date '+%F-%M-%S'`\t删除过期文件成功">>$LOG_PATH
#调试时输出日志信息
#       tail -1 $LOG_PATH
fi

#进行备份操作
tar zcf $to_file $WEB_PATH &> /dev/null
#echo $?

#判断是否备份成功
if [ $? -eq 0 ]; then
        echo -e "`date '+%F-%M-%S'`\t备份成功">>$LOG_PATH
else
        echo -e "`date '+%F-%M-%S'`\t备份失败">>$LOG_PATH

        exit $ERR_QUIT
fi

#空间占用百分比
percent=$(df $BAKE_PATH |awk '/dev/{print $5}')
echo -e "当前空间的占用百分比：$percent">>$LOG_PATH
#输出日志信息
tail -2 $LOG_PATH
