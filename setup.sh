#!/bin/sh

# pull
docker pull "portainer/portainer"

# volume
docker volume create "portainer"
ln -s "/var/lib/docker/volumes/portainer" "/data/volume/"

# create
docker run --name "portainer" \
	-p 9000:9000 \
	-v "/var/run/docker.sock:/var/run/docker.sock" \
	-v "portainer":"/data" \
	--restart=always \
	-d "portainer/portainer"

# start
docker start "portainer"

# access
> user: portainer
> password: ***

# drop

docker rm -f "portainer"
docker rmi --force "portainer" ;
docker volume rm --force "portainer" ;

rm -rfv "/var/lib/docker/volumes/portainer" ;
rm -rfv "/data/volume/portainer" ;

#
