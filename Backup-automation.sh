#!/bin/bash

# Source and destination
SOURCE="/var/log"
DEST="/backup"

# Create destination if not exists
mkdir -p $DEST

# Timestamp
DATE=$(date +%F-%H-%M)

# Backup file name
FILE="backup-$DATE.tar.gz"

echo "Starting backup..."

tar -czvf "$DEST/$FILE" "$SOURCE"

if [ $? -eq 0 ]; then
    echo "Backup successful: $DEST/$FILE"
else
    echo "Backup failed!"
fi
