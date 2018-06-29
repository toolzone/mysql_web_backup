**注意：**

   1. Mysql_backup.sh 为 mysql 自动备份 脚本，配合 crontab命令 用来管理需要周期性执行任务
   2. Web_backup.sh   为 web文件 自动备份 脚本，配合 crontab命令 用来管理需要周期性执行任务
  
 ``` Mysql_backup.sh 里：
  
* 把 username 替换为实际的用户名；
* 把 password 替换为实际的密码； 
* 把 DatabaseName 替换为实际的数据库名；

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


* 选项

**mysqldump(选项)**
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
### > 实例
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

请结合实际修改shell即可使用~
