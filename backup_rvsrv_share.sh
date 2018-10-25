#!/bin/bash

# shellcheck source=backup_lib.sh
. "$(dirname "$0")"/backup_lib.sh

writemount_backup
rsync -a --delete /home/share/ /media/backup_disk/backup_rvsrv/share/
readonlymount_backup

