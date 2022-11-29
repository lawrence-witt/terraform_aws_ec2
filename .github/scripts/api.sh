#!/bin/bash

sudo apt-get update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt-get update -y
sudo apt-cache policy docker-ce
sudo apt-get install docker-ce -y
sudo docker stop api
sudo docker rm api
sudo docker pull $DOCKER_TARGET
sudo docker run -d --name api -p 80:8080 --restart on-failure $DOCKER_TARGET