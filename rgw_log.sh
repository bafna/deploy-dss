#!/bin/bash -xe

consul members status | grep -e 'alive.*server' | awk  '{print $2}'  | awk -F':' '{print $1}' | tee rgw

filename=rgw
count=0
while read -r p; do
 echo "Provisioning $p"
 scp obj_team@$p:/var/log/ceph/radosgw.log radosgw${count}.log < /dev/null || true
 ((count+=1)) 
 echo "done"
done < $filename
cat radosgw*.log > rgw.log 
