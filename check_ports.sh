#! /bin/bash

MAIL="gopichand.pantala@pennywisesolutions.com"

PORTS=$(sudo netstat -tnlp | grep LISTEN)

echo "$PORTS" | mail -s "Listening ports List" $MAIL



