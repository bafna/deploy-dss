#!/bin/bash -xe

#Must have userdata.txt and machines.txt in the folder 

# Provisions machines mentioned in machines.txt file.
filename=machines.txt 
while read -r p; do
 echo "Provisioning $p"
 ssh obj_team@$p "sudo apt-get update " < /dev/null || true
 ssh obj_team@$p "sudo apt-get upgrade -y --force-yes" < /dev/null
 echo "done"
done < $filename 
