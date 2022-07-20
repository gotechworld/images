#!/bin/bash

echo "What would you like to do in terms of running golang image in docker (images, build, remove)? "
read answer

case "$answer" in

	images)
		echo "You've chosen to list all the docker images"
		docker images
		;;
	build)
		echo "You've chosen to build the golang docker image"
		docker build . -t golang-1.17.8:alpine3.15
		;;
	remove)
		echo "You've chosen to remove/delete the golang docker image"
		docker ps -a -q | xargs docker rm -f
		docker images -q | xargs docker rmi -f
		;;
	*)
		echo "I'm not sure what you want to do!"
		echo "Please, try again!"
		;;
esac

