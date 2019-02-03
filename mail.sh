#! /bin/bash

if [[ "$1" == "-v" ]]
then
	# verbose
	VERBOSE=1
fi

# sdoigfjas;ldgkja;lsdgja;  fuck cron
PATH="/home/pi/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
EMAIL_TO="Rebecca Turner <637275@gmail.com>"
IP="$(./get_ip.sh)"
IP_FILE="/run/user/$(id -u)/ip.txt"

if [[ ! -e "$IP_FILE" ]]
then
	touch "$IP_FILE"
fi

if [[ ! -z "$(echo "$IP" | diff "$IP_FILE" -)" ]]
then
	# new ip
	echo "$IP" > "$IP_FILE"
	if [[ ! -z "$VERBOSE" ]]
	then
		./info.sh | sendmail -v "$EMAIL_TO"
	else
		./info.sh | sendmail -v "$EMAIL_TO" > /dev/null
	fi
fi
