#!/bin/bash

SOURCE="/var/log"
DEST="/backup"
LOGFILE="/var/log/backup.log"
DATE=$(date +%F-%H-%M)
FILE="backup-$DATE.tar.gz"

mkdir -p $DEST

echo "[$DATE] Backup started" >> $LOGFILE

tar -czf "$DEST/$FILE" "$SOURCE"

if [ $? -eq 0 ]; then
    echo "[$DATE] Backup successful: $FILE" >> $LOGFILE
else
    echo "[$DATE] Backup failed!" >> $LOGFILE
    exit 1
fi

# Delete backups older than 7 days
find $DEST -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

echo "[$DATE] Old backups cleaned" >> $LOGFILE
