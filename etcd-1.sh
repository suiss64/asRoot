#!/bin/bash
## chmod +x ....

# create bucket s3 :

bucketName=$(echo etcd-backup-eu-central-1-$(date +"%Y%m%d%H%M%S"))

#aws s3 mb s3://$(echo $bucketName)

# add cron job :
echo "* * * * * /opt/app-root/src/etcd-2.sh" >> /etc/crontab

# start crontab
crond

#
/opt/app-root/src/etcd-2.sh
