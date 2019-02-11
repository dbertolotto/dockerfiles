#!/bin/bash

### extras for WSL
if [ ! -f ~/.bash_profile ]; then
	echo "source ~/.bashrc" >> ~/.bash_profile
fi
echo "export DOCKER_HOST=tcp://0.0.0.0:2375" >> ~/.bash_profile && source ~/.bash_profile
# run once right now
sudo mkdir /c
sudo mount --bind /mnt/c /c
# fix it for future shells
sudo bash -c "echo '[automount]' >> /etc/wsl.conf"
sudo bash -c "echo 'root = /' >> /etc/wsl.conf"
sudo bash -c "echo 'options = \"metadata\" ' >> /etc/wsl.conf"

