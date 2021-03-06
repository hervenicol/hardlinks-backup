# Create rsync backups
#### Keep old versions using hard links

Interesting info/help:
http://www.mikerubel.org/computers/rsync_snapshots/


## Policy:
###### Keep a version per year. 
- Name: [backup_name].year.[YYYY]
- Done during december. Not 31/12, too late in case of problem. Let's say 10/12.
- command: cp -al [current] [YYYY backup]
- Check if dir exists before

###### Keep 3 last months (01 of month)
- Name: [backup_name].month.[month_name]
- command: find path -name [backup_name].month.* --depth 1 --ctime +100 --exec rm {} \; && cp -al [current] [backup_name].month.[month_name]

###### Keep 4 last weeks (monday)
- Name: [backup_name].week.{4..1}
- command: delete 4, move 3 to 4 ... 1 to 2, cp -al [backup_name] to 1

###### Update current backup every day.
- Name: [backup_name]



## Notes:

###### create lock system for mount ro/rw:
- each process that asks for rw puts a lock with its PID
- each process that asks for ro removes its lock
- when there the last lock is removed, we can effectively remount ro
=> create functions / a lib to handle this.

Don't forget checks for dir [ -d xxx ] before trying to overwrite / cp / mv ...


## Sanity checks
* Semaphore: [![Build Status](https://semaphoreci.com/api/v1/hervenicol/hardlinks-backup/branches/master/badge.svg)](https://semaphoreci.com/hervenicol/hardlinks-backup)
* Semaphore 2.0: see https://herve.semaphoreci.com/projects/hardlinks-backup
* Travis: [![Build Status](https://travis-ci.com/hervenicol/hardlinks-backup.svg?branch=master)](https://travis-ci.com/hervenicol/hardlinks-backup)
