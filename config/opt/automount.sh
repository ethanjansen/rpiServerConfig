#!/bin/bash

############## VARS ##############
# Parallel arrays
MOUNT_POINTS=("/media/ethan/MediaContent")
CHECK_PATHS=("Movies") # within MOUNT_POINT
DEVS=("/dev/disk/by-uuid/6965fde5-b372-4b48-9c32-f90426ef5a8c")
MOUNT_OPTS=("defaults,noatime")

############## Main ##############
for i in "${!MOUNT_POINTS[@]}"; do
	mount_point="${MOUNT_POINTS[$i]}"
	check_path="${CHECK_PATHS[$i]}"
	dev="${DEVS[$i]}"
	opts="${MOUNT_OPTS[$i]}"

	# check device exists
	if [[ ! -e "$dev" ]]; then
		echo "Device does not exist: $dev"
		exit 1
	fi

	# check if directory exists
	if [[ ! -d "$mount_point" ]]; then
		echo "Mount point does not exist: $mount_point"
		exit 1
	fi

	# check if already mounted
	if mountpoint -q "$mount_point"; then
		if [[ -e "$mount_point/$check_path" ]]; then
			echo "Already mounted: $mount_point"
			continue
		fi

		# check_path didn't exit will try to unmount and mount again
		echo "Missing check path, will unmount and try again: $mount_point/$check_path"
		umount "$mount_point"
	fi

	# Mount (assuming mount_point already exists)
	echo "Mounting: $mount_point"
	mount -o "$opts" "$dev" "$mount_point"
	echo
done
