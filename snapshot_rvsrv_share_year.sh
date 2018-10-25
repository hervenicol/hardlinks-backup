#!/bin/bash

# shellcheck source=backup_lib.sh
. "$(dirname "$0")"/backup_lib.sh

backup_name=/media/backup_disk/backup_rvsrv/share
snapshot_name="$backup_name"."$(date +%Y)"

[[ -d "$snapshot_name" ]] \
    && echo "Snapshot already existing for year $(date +%Y): $snapshot_name" \
    && exit 1
writemount_backup
cp -al "$backup_name" "$snapshot_name"
readonlymount_backup

