#!/bin/bash

# Minecraft directory goes here
mcdir=

# Backup directory goes here
bkdir=

# User script will be run with
user=

if [[ ! -e $mcdir ]]
then
        echo "[ERROR]: minecraft directory not found or mcdir variable not set."
        exit 0
fi

if [[ ! -e $bkdir ]]
then
    echo "[ERROR]: backup directory not found or bkdir variable not set."
    exit 0
fi

time=`date +%F_%H-%M`

cd $mcdir
sudo -H -u $user tar -czf "${bkdir}/minecraft_discordia-${time}.tar.gz" ./*

return_code=$?

if [[ ! return_code -eq 0 ]]
then
        echo "[ERROR]: tar failed, and exited with code $return_code."
        exit 0
fi

echo "[OK] Backup suceeded. Data saved in $bkdir/minecraft_discordia-${time}.tar.gz"
exit 1
