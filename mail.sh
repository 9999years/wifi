#! /bin/bash

EMAIL_TO="Rebecca Turner <637275@gmail.com>"
IP="$(./get_ip.sh)"
if [[ ! -z "$(echo "$IP" | diff .ip -)" ]]
then
	# new ip
	echo "$IP" > .ip
	./info.sh | sendmail -v "$EMAIL_TO" > /dev/null
fi
