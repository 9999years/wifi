#! /bin/bash

# sdoigfjas;ldgkja;lsdgja;  fuck cron
PATH="/home/pi/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
EMAIL_TO="Rebecca Turner <637275@gmail.com>"
IP="$(./get_ip.sh)"
if [[ ! -z "$(echo "$IP" | diff .ip -)" ]]
then
	# new ip
	echo "$IP" > .ip
	./info.sh | sendmail -v "$EMAIL_TO" > /dev/null
fi
