#! /bin/bash

WARNING=35
CRITICAL=50

EMAIL="gopichand.pantala@gmail.com"

MEMORY=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')


if [ "$MEMORY" -ge "$CRITICAL" ]; then
    echo "Memory at $MEMORY%" | mail -s "Memory Alert: CRITICAL" $EMAIL
elif [ "$MEMORY" -ge "$WARNING" ]; then
    echo "Memory at $MEMORY%" | mail -s "Memory Alert: WARNING" $EMAIL
else
    echo "Memory at $MEMORY%" | mail -s "Memory Alert: OK" $EMAIL
fi
