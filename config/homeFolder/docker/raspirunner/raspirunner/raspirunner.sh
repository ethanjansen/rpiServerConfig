#!/bin/bash

# loop forever
while true; do
	# wait
	sleep 1

	# download
	/opt/raspirunner/dropbox_uploader.sh -q download /Raspi_Commands /

	# execute files and remove
	files=$(ls "/Raspi_Commands/")
	check=$(ls "/Raspi_Commands/" | wc -l)
	if [[ $check == 0 ]]; then
		continue
	fi
	for i in $files; do
		chmod +x "/Raspi_Commands/$i"
		"/Raspi_Commands/$i" > /dev/null 2>&1
		rm "/Raspi_Commands/$i"
		/opt/raspirunner/dropbox_uploader.sh delete "/Raspi_Commands/$i"
	done
done
