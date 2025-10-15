#! /bin/bash

WARNING=15
CRITICAL=20

EMAIL="gopichand.pantala@pennywisesolutions.com"

DISK=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [ "$DISK" -ge "$CRITICAL" ]; then
    echo "Root disk usage at $DISK%" | mail -s "Disk Space Alert: CRITICAL" $EMAIL
elif [ "$DISK" -ge "$WARNING" ]; then
    echo "Root disk usage at $DISK%" | mail -s "Disk Space Alert: WARNING" $EMAIL
else
    echo "Root disk usage at $DISK%" | mail -s "Disk Space Alert: OK" $EMAIL
fi

