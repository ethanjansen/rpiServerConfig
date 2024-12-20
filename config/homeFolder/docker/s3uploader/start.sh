#!/bin/bash
sudo mount /dev/disk/by-label/BACKUP ./BACKUP
sudo mount /dev/disk/by-label/MACBACKUP ./MACBACKUP
docker compose up -d
