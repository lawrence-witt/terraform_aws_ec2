#!/bin/bash

export VOLUME_DIRECTORY=/volume DOCKER_NAME=db
# install dependencies
sudo apt-get update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt-get update -y
sudo apt-cache policy docker-ce
sudo apt-get install docker-ce -y
# format EBS volume (if required)
sudo blkid -t TYPE=ext4 $VOLUME_DEVICE_NAME || sudo mkfs -t ext4 $VOLUME_DEVICE_NAME
# mount EBS volume
sudo mkdir $VOLUME_DIRECTORY
sudo mount $VOLUME_DEVICE_NAME $VOLUME_DIRECTORY
# mount EBS volume on reboot (if required)
sudo cp /etc/fstab /etc/fstab.bak
grep $VOLUME_DEVICE_NAME /etc/fstab || echo "$VOLUME_DEVICE_NAME $VOLUME_DIRECTORY ext4 defaults,nofail 0 0" | sudo tee -a /etc/fstab
# start container
sudo docker stop $DOCKER_NAME
sudo docker rm $DOCKER_NAME
sudo docker pull $DOCKER_SOURCE
sudo docker run -d --name $DOCKER_NAME -v $VOLUME_DIRECTORY/data:/var/lib/postgresql/data -p 5432:5432 --restart unless-stopped $DOCKER_SOURCE