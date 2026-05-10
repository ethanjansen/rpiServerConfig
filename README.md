## RPI-Server Setup/Configs

* Using Arch Linux on Arm
    * Enable SSH, set static IP, and set hostname
    * User creation: ethan, movies (user home set to /media/ethan/MediaContent - used as read only copy sftp copy user)
    * Installed software:
        * base
        * base-devel
        * bat
        * dhcpcd
        * dialog
        * docker
        * docker-buildx
        * docker-compose
        * ex-vi-compat
        * firmware-raspberrypi
        * git
        * htop
        * linux-firmware
        * linux-rpi-16k
        * nano
        * neovim
        * net-tools
        * netctl
        * openssh
        * raspberrpi-bootloader
        * rpi5-eeprom
        * rsync
        * screen
        * sudo
        * vim
        * which
        * wireless-regdb
        * wireless_tools
        * wpa_supplicant
* Import SSH public keys
* Configure SSH Server:
    * Change default port
    * Disable root login (if not already)
    * Disable password authentication
        * Allow password authentication for movies user
            ```
            PasswordAuthentication no
            AuthenticationMethods publickey
            Match User movies
            PasswordAuthentication yes
            AuthenticationMethods any
            Match all
            ```
* Configure Auto Update:
    * Use [archAutoUpdate](https://github.com/ethanjansen/archAutoUpdate)
    * Set timer for every Sunday at 02:00
* Configure Auto Mount:
    * Use script in [opt](./config/opt)
    * Use systemd timer and service in [systemd](./config/systemd)
* Docker setup:
    * Add ethan user to docker group
    * Copy [docker folder](./config/homeFolder/docker) to home folder
    * Add credentials as needed to all docker subfolders
    * Create folders corresponding to docker volumes as needed
    * Import pihole settings, lists, and hostnames
* On router:
    * Set DHCP DNS to pihole
    * port forware to wireguard and plex
* Start docker containers: noip, pihole, plex, watchtower, wireguard
    * `cd` to respective docker directories and run `docker compose up -d`
