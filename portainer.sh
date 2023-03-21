#!/bin/sh

# pull
docker pull "portainer/portainer"

# volume
docker volume create "portainer"
ln -s "/var/lib/docker/volumes/portainer" "/data/volume/"

# run
docker run --name "portainer" \
  -p 9000:9000 \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -v "portainer":"/data" \
  --restart=always \
  -d "portainer/portainer"

# start
docker start "portainer"

#

# user: admin
# password: *****
# password: tryportainer

# drop
docker rm -f "portainer"

#
