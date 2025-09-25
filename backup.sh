#!/usr/bin/bash

toBackup="/home/anhgelus/Documents/"
backup="/home/anhgelus/cloud.anhgelus.world/Documents/Laptop/"

if [ -d "$backup" ]; then
    echo "cloud.anhgelus.world already mounted"
else
    mount -t davfs "https://cdn.anhgelus.world/private"
fi

rsync -az --exclude={'**/.git', '**/*.o'} "$toBackup" "$backup"

echo "$toBackup was backuped in $backup"
