#!/bin/bash

# Backup script goes here
backup=

# Minecraft dir goes here
mcdir=

if [ -z $1 ]
then
        echo "Usage: $0 backup_file"
        exit 0
fi

if [[ ! -x ${backup} ]]
then
        echo "[ERROR]: Backup script not found/executable or \$backup not set"
        exit 0
fi

if [[ ! -e ${mcdir} ]]
then
        echo "[ERROR]: Minecraft dir not found or \$mcdir not set"
        exit 0
fi

if [[ ! -e $1 ]]
then
        echo "[ERROR]: Backup file not found."
        exit 0
fi

# Make a backup, just in case...

echo "[INFO]: Running backup"
${backup}

return_code=$?

if [[ $return_code -eq 0 ]]
then
        echo "[ERROR]: Backup failed. Aborting."
        exit 0
fi

# Run actual restore

echo "[INFO]: Backup suceeded, running restore."

tar -xzf "$1" -C ${mcdir}

tar_exit=$?

if [[ ! $tar_exit -eq 0 ]]
then
        echo "[ERROR]: tar failed, and exited with code $tar_exit."
        exit 0
fi

echo "[OK]: Restore suceeded."
exit 1
