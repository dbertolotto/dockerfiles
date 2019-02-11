#!/bin/bash

### test installation
sudo docker run hello-world

### extra stuff
echo "let your user run docker without root privileges by running:"
echo "sudo usermod -aG docker $USER"
