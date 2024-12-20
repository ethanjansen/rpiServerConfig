#!/bin/bash

if [ "$(docker container inspect --format '{{.State.Status}}' s3uploader-s3uploader-1 2>&1)" == "running" ]; then
	echo "s3uploader running, skipping update..."
else
	apt-get autoclean -y
	apt-get update
	apt autoremove --purge
	apt-get upgrade -y
fi
