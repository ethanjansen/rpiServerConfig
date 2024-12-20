#!/bin/bash
docker compose down
docker image rm s3uploader-s3uploader:latest
sudo umount ./BACKUP
sudo umount ./MACBACKUP
