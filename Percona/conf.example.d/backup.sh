#!/usr/bin/env bash

datetime=$(date -u "+%Y%m%d%H")
mysqlPassword=Ch@nGeMe

xtrabackup \
	--user=root \
	--host=127.0.0.1 \
	--port=3306 \
	--password=$mysqlPassword \
	--target-dir=/data/"$datetime" \
	--backup

# transfer
rsync -avz --progress -e 'ssh -p 22' /data/"$datetime" root@10.211.55.10:/data/
rsync -avz --progress -e 'ssh -p 22' /data/"$datetime" root@10.211.55.11:/data/

# restore
# datetime=2023080916
xtrabackup --prepare --target-dir=/data/"$datetime"
mv /var/lib/mysql /var/lib/mysql.old && mv /data/"$datetime" /var/lib/mysql

# clean up
# datetime=2023080916
rm -rf /var/lib/mysql.old

# MySQL replication
GRANT REPLICATION SLAVE ON *.* TO 'replication'@'10.211.55.10' IDENTIFIED BY 'chanageme';
GRANT REPLICATION SLAVE ON *.* TO 'replication'@'10.211.55.11' IDENTIFIED BY 'chanageme';
GRANT REPLICATION SLAVE ON *.* TO 'replication'@'10.211.55.12' IDENTIFIED BY 'chanageme';
FLUSH PRIVILEGES;

mysql -p $mysqlPassword
CHANGE MASTER TO MASTER_HOST='10.211.55.11', MASTER_LOG_FILE='mysql-bin.000005', MASTER_LOG_POS=154, MASTER_USER='replication', MASTER_PASSWORD='chanageme', MASTER_PORT=3306;
CHANGE MASTER TO MASTER_HOST='10.211.55.12', MASTER_LOG_FILE='mysql-bin.000004', MASTER_LOG_POS=154, MASTER_DELAY=1800, MASTER_USER='replication', MASTER_PASSWORD='chanageme', MASTER_PORT=3306;
START SLAVE;
