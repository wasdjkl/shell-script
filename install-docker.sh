#!/usr/bin/env bash

# Uninstall old versions
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# Set up the repository
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker Engine
yum install -y docker-ce docker-ce-cli containerd.io

# Start Docker.
systemctl start docker

# Verify that Docker Engine is installed correctly by running the hello-world image.
docker run hello-world
