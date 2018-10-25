#!/bin/bash

# shellcheck source=backup_lib.sh
. "$(dirname "$0")"/backup_lib.sh

backup_name=/media/backup_disk/backup_rvsrv/share
snapshot_name="${backup_name}".month."$(date +%b)"

# fails after 1 year
#[[ -d "$snapshot_name" ]] && echo "Snapshot already existing for month $(date +%b): $snapshot_name" && exit 1


writemount_backup

[[ -d "$snapshot_name" ]] && rm -rf "$snapshot_name"

# To be tested before activating - waiting for 3 months before that ;)
#find $(dirname $backup_name) -name $backup_name.month.* --depth 1 --ctime +100 --exec rm {} \;

cp -al "$backup_name" "$snapshot_name"
readonlymount_backup

