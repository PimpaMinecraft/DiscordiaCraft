#!/bin/bash

# Minecraft directory goes here
mcdir=~/useless_dir

# Backup directory goes here
bkdir=~/backup_dir

if [[ ! -e $mcdir ]]
then
	echo "[ERROR]: minecraft directory not found or mcdir variable not defined."
	exit 0
fi

if [[ ! -e $bkdir ]]
then
        echo "[ERROR]: backup directory not found or bkdir variable not defined."
        exit 0
fi

time=`date +%F_%H-%M`

cd $bkdir
tar -czf "minecraft-${time}.tar.gz" ${mcdir}/*

return_code=$?

if [[ ! return_code -eq 0 ]]
then
	echo "[ERROR]: tar failed, and exited with code $return_code."
	exit 0
fi

echo "[OK] Backup suceeded. Data saved in $bkdir/minecraft-${time}.tar.gz"
exit 1
