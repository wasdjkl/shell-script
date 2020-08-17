#!/usr/bin/env bash

# Uninstall old versions
echo -e "\033[33m Uninstall old versions \033[0m"
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# Set up the repository
echo -e "\033[33m Set up the repository \033[0m"
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker Engine
echo -e "\033[33m Install Docker Engine \033[0m"
yum install -y docker-ce docker-ce-cli containerd.io

# Start Docker.
echo -e "\033[33m Start Docker \033[0m"
systemctl start docker

# Verify that Docker Engine is installed correctly by running the hello-world image.
echo -e "\033[33m Verify that Docker Engine is installed correctly by running the hello-world image. \033[0m"
docker run hello-world

# Install Compose
echo -e "\033[33m Install Compose \033[0m"
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
