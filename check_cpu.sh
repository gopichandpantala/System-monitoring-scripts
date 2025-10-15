#! /bin/bash

WARNING=80
CRITICAL=90

EMAIL="gopichand.pantala@gmail.com"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')    #runs top as batch job and prints only 1 iteration then print cpu idle value and minus from the 100

CPU_INT=${CPU%.*} #convert to integer and removes numbers after decimal

if
	[ "$CPU_INT" -ge "$CRITICAL" ]; then
	echo "CPU is reached $CPU_INT%" | mail -s "CPU Alert: CRITICAL" $EMAIL
elif
	[ "$CPU_INT" -ge "$WARNING" ]; then
	echo "CPU is reached $CPU_INT%" | mail -s "CPU Alert: WARNING" $EMAIL
else
	echo "CPU is at $CPU_INT%" | mail -s "CPU Alert: OK" $EMAIL
fi 

