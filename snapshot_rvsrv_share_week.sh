#!/bin/bash

# shellcheck source=backup_lib.sh
. "$(dirname "$0")"/backup_lib.sh

backup_name=/media/backup_disk/backup_rvsrv/share

writemount_backup
rm -rf "$backup_name".week.4
for iteration in {4..2}; do
	mv "$backup_name.week.$(( "$iteration"-1 ))" "$backup_name.week.$iteration"
done
cp -al "$backup_name" "$backup_name".week.1
readonlymount_backup

