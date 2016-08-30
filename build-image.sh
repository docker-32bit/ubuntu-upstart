#!/bin/bash -x
### Build a 32bit image for ubuntu-upstart, based on '32bit/ubuntu'
### and using the scripts from:
### https://github.com/tianon/dockerfiles/tree/master/sbin-init/ubuntu/upstart

### go to the script directory
cd $(dirname $0)

### build the image
docker build -t 32bit/ubuntu-upstart:14.04-armhf .

# ### push image to Docker Hub
# docker push 32bit/ubuntu-upstart:14.04-armhf

