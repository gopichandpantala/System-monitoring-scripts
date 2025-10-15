#! /bin/bash

SERVICE="apache2"
EMAIL="gopichand.pantala@gmail.com"

#if systemctl is-active --quiet $SERVICE; then
#	echo "$SERVICE is running" \
#    	| mail -s "ALERT: $SERVICE is UP" $EMAIL
#fi

if ! systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE is not running" \
        | mail -s "ALERT: $SERVICE is Down" $EMAIL
fi
