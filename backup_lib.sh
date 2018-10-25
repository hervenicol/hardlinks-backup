#!/bin/bash

mount_flag_basename=/tmp/mount_flag
my_mount_flag_filename=$mount_flag_basename.$$
backup_part=/media/backup_disk

function set_mount_flag
{
	touch $my_mount_flag_filename
#        echo "mount flag set"
}

function is_mount_flag_set
{
	if ls /tmp/mount_flag* >/dev/null 2>&1; then
#		echo "Mount flag is set"
		return 0
	fi
	return 1
}

function unset_mount_flag
{
	rm $my_mount_flag_filename
	is_mount_flag_set && return 1
#	echo mount flag unset
	return 0
}

function writemount_backup
{
	is_mount_flag_set || mount -o remount,rw $backup_part
	set_mount_flag
}

function readonlymount_backup
{
	unset_mount_flag && mount -o remount,ro $backup_part
}
