#!/bin/bash -x
### Build a 32bit image for ubuntu-upstart, based on '32bit/ubuntu'
### and using the scripts from:
### https://github.com/tianon/dockerfiles/tree/master/sbin-init/ubuntu/upstart

### go to the script directory
cd $(dirname $0)

### get the ubuntu version from the first parameter
tag=${1:-14.04}

### get the Dockerfile etc. from github 
wget https://github.com/tianon/dockerfiles/raw/master/sbin-init/ubuntu/upstart/$tag/Dockerfile
wget https://github.com/tianon/dockerfiles/raw/master/sbin-init/ubuntu/upstart/$tag/init-fake.conf
wget https://github.com/tianon/dockerfiles/raw/master/sbin-init/ubuntu/upstart/$tag/aliases

### replace the base image on Dockerfile
sed -i Dockerfile -e "/^FROM/ c FROM 32bit/ubuntu:$tag"

### build the image
docker build -t 32bit/ubuntu-upstart:$tag .

# ### push image to Docker Hub
# docker push 32bit/ubuntu-upstart:$tag

# ### cleanup
# rm Dockerfile init-fake.conf aliases
