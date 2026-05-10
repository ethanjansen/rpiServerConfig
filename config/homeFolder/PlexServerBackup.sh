#!/bin/bash

cd /media/ethan/MediaContent
rsync -avP "/var/lib/plex/Plex Media Server" ./
tar -I "xz -e -T 0" -cpvf "Plex Media Server.tar.xz" "Plex Media Server"
chmod a+w "Plex Media Server.tar.xz"
rm -rfv "Plex Media Server"
