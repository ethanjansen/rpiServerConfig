## RPI-Server Setup/Configs

* Install Raspberry Pi OS slim from Raspberry tool
    * Enable SSH, create user, set static IP, and set hostname
* Remove NOPASSWD from /etc/sudoers.d/010_pi
* Import SSH public key
* Generate SSH ed25519 and rsa keys
* Configure SSH Server:
    * Change default port
    * Disable root login (if not already)
    * Disable password authentication
* Configure Auto Update:
    * Copy [autoUpdate.sh](./config/homeFolder/autoUpdate.sh) to home directory. Ensure it is executable
    * Copy [autoUpdate service files](./config/systemd) to /etc/systemd/system/
    * Enable autoUpdate.service, and enable/start autoUpdate.timer
* Install Software
    * Remove any existing docker packages: `for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done`
    * Add docker GPG key to keyring:
    ```
    sudo apt-get Update
    sudo apt-et install ca-certificates
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    ```
    * Add docker repository [file](./config/apt/sources.list.d/docker.list) to /etc/apt/sources.list.d/
    * Install packages:
    ```
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin git gpg htop rsync screen
    ```
* Import (and trust) GPG key to use with s3uploader
* Docker setup:
    * Add user to docker group
    * Copy [docker folder](./config/homeFolder/docker) to home folder
    * Add credentials as needed to all docker subfolders
    * Add raspirunner commands and private ssh key
    * Import pihole settings, lists, and hostnames
    * Configure unifi
    * Configure wireguard
* On router:
    * Set DHCP DNS to pihole
    * port forware to wireguard
* Start docker containers: pihole, raspirunner, unifi, watchtower, wireguard
    * `cd` to respective docker directories and run `docker compose up -d`
