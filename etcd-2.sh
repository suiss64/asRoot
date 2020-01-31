#!/bin/bash


backupControl ()
{
if [ $(aws2 --endpoint-url=http://10.128.1.24:4572 s3 ls s3://$(echo $bucketName)/ --recursive | wc -l) != "5" ]
  then
   aws2 --endpoint-url=http://10.128.1.24:4572 s3 rm $(echo $bucketName)/$fileName
   echo $(aws2 --endpoint-url=http://10.128.1.24:4572 s3 ls s3://$(echo $bucketName)/ --recursive | wc -l)
fi
}

# create snapshot :
#endpoints="https://etcd-0.myperosnalocp.sandbox132.opentlc.com:2379"
endpoints="https://etcd-0.crc.testing:2379"
# snapshot=$(echo snapshot-$(date +"%Y%m%d%H%M%S")) --> remplacer 's3://$(echo $bucketName)/snapshot.db' par 's3://$(echo $bucketName)/$(echo $snapshot)'

#ETCDCTL_API=3 etcdctl --endpoints $(echo $endpoints) --cacert=/etc/ssl/etcd/ca.crt --key=/etc/ssl/etcd/system\:etcd-peer\:etcd-0.myperosnalocp.sandbox132.opentlc.com.key --cert=/etc/ssl/etcd/system\:etcd-peer\:etcd-0.myperosnalocp.sandbox132.opentlc.com.crt snapshot save /tmp/snapshots/snapshot.db && aws s3 cp /tmp/snapshots/snapshot.db s3://$(echo $bucketName)/snapshot.db && rm /tmp/snapshots/snapshot.db && fileName=$(aws s3 ls s3://$(echo $bucketName) --recursive | sort | head -1 | awk '{print $4;}') && backupControl
ETCDCTL_API=3 etcdctl --endpoints $(echo $endpoints) --cacert=/etc/ssl/etcd/ca.crt --key=/etc/ssl/etcd/system\:etcd-peer\:etcd-0.crc.testing.key --cert=/etc/ssl/etcd/system\:etcd-peer\:etcd-0.crc.testing.crt snapshot save /tmp/snapshots/snapshot.db && aws s3 cp /tmp/snapshots/snapshot.db s3://$(echo $bucketName)/snapshot.db && rm /tmp/snapshots/snapshot.db && fileName=$(aws s3 ls s3://$(echo $bucketName) --recursive | sort | head -1 | awk '{print $4;}') && backupControl

#echo "resultat :" && backupControl
echo $bucketName
echo bonjour !
