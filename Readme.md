**注意：**

   1. Mysql_backup.sh 为 mysql 自动备份 脚本，配合 crontab命令 用来管理需要周期性执行任务
   2. Web_backup.sh   为 web文件 自动备份 脚本，配合 crontab命令 用来管理需要周期性执行任务
  
 ``` 
 Mysql_backup.sh 里：
  
* 把 username 替换为mysql的用户名；
* 把 password 替换为mysql的密码； 
* 把 DatabaseName 替换为需要备份的数据库名；

```

使用时添加可执行权限：
```
chmod u+x Mysql_backup.sh 
```
或
```
chmod u+x Web_backup.sh
```

此脚本利用mysqldump命令，mysqldump命令是mysql数据库中备份工具，用于将MySQL服务器中的数据库以标准的sql语言的方式导出，并保存到文件中。


## 知识扩展 


### mysqldump(选项)
```
--add-drop-table：在每个创建数据库表语句前添加删除数据库表的语句；
--add-locks：备份数据库表时锁定数据库表；
--all-databases：备份MySQL服务器上的所有数据库；
--comments：添加注释信息；
--compact：压缩模式，产生更少的输出；
--complete-insert：输出完成的插入语句；
--databases：指定要备份的数据库；
--default-character-set：指定默认字符集；
--force：当出现错误时仍然继续备份操作；
--host：指定要备份数据库的服务器；
--lock-tables：备份前，锁定所有数据库表；
--no-create-db：禁止生成创建数据库语句；
--no-create-info：禁止生成创建数据库库表语句；
--password：连接MySQL服务器的密码；
--port：MySQL服务器的端口号；
--user：连接MySQL服务器的用户名。

```
**实例**

**导出整个数据库**
```
语法：
mysqldump -u 用户名 -p 数据库名 > 导出的文件名
例：
mysqldump -u linuxde -p apps_linux > linux.sql

```
**导出一个表**
```
语法：
mysqldump -u 用户名 -p 数据库名 表名 > 导出的文件名
例：
mysqldump -u linuxde -p apps_linux users > linux_users.sql
```
**导出一个数据库结构** 
```
例：
mysqldump -u linuxde -p -d --add-drop-table apps_linux > linux_db.sqle_db.sql
```

## crontab(选项)(参数)

crontab文件：指定包含待执行任务的crontab文件,选项:
```
-e：编辑该用户的计时器设置；
-l：列出该用户的计时器设置；
-r：删除该用户的计时器设置；
-u<用户名称>：指定要设定计时器的用户名称。
```
用户所建立的crontab文件中，每一行都代表一项任务，每行的每个字段代表一项设置，它的格式共分为六个字段，前五段是时间设定段，第六段是要执行的命令段，格式如下：
```
minute   hour   day   month   week   command     顺序：分 时 日 月 周
```
其中：
```
minute： 表示分钟，可以是从0到59之间的任何整数。
hour：表示小时，可以是从0到23之间的任何整数。
day：表示日期，可以是从1到31之间的任何整数。
month：表示月份，可以是从1到12之间的任何整数。
week：表示星期几，可以是从0到7之间的任何整数，这里的0或7代表星期日。
command：要执行的命令，可以是系统命令，也可以是自己编写的脚本文件。
```
在以上各个字段中，还可以使用以下特殊字符：

* 星号（*）：代表所有可能的值，例如month字段如果是星号，则表示在满足其它字段的制约条件后每月都执行该命令操作。
* 逗号（,）：可以用逗号隔开的值指定一个列表范围，例如，“1,2,5,7,8,9”
* 中杠（-）：可以用整数之间的中杠表示一个整数范围，例如“2-6”表示“2,3,4,5,6”
* 正斜线（/）：可以用正斜线指定时间的间隔频率，例如“0-23/2”表示每两小时执行一次。同时正斜线可以和星号一起使用，例如*/10，如果用在minute字段，表示每十分钟执行一次。

**实例**
每1分钟执行一次command
```
* * * * * command
```

每小时的第3和第15分钟执行
```
3,15 * * * * command
```

请结合实际修改shell即可使用~
