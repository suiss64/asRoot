#!/bin/bash
## chmod +x ....

# create bucket s3 :

export bucketName=$(echo etcd-backup-eu-central-1-$(date +"%Y%m%d%H%M%S"))

aws2 --endpoint-url=http://10.128.1.24:4572 s3 mb s3://$(echo $bucketName)

# add cron job :
echo "* * * * * root /opt/app-root/src/etcd-2.sh" >> /etc/crontab 

# Test :
# echo "* * * * * root /opt/app-root/src/etcd-2.sh > /dev/pts/0" >> /etc/crontab

# start crontab
crond

#
/opt/app-root/src/etcd-2.sh
