#! /bin/bash

DATE=$(date +%d-%m-%Y) 

DATABASE="gopidb"
BACKUP_DIR=/opt/mysqlbackup

BACKUP_FILE="$BACKUP_DIR/${DATABASE}_$DATE.sql.gz"

mkdir -p "$BACKUP_DIR"

mysqldump $DATABASE | gzip > "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "MySQL backup saved to $BACKUP_FILE"
else
    echo "MySQL backup FAILED!"
fi


