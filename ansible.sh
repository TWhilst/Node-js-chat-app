#!/bin/bash
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt -y install ansible 
cd /home/ubuntu
sudo apt install default-jdk -y
sudo apt -y install git
sudo git clone -b ansible https://github.com/TWhilst/Node-js-chat-app.git