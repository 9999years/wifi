#! /bin/bash

INTERFACE="wlan0"

IP="$(./get_ip.sh)"

BOUNDARY="$RANDOM-$RANDOM-$RANDOM"

# evaluates a command and prettily prints its output in email-friendly format
function echo_cmd() {
	echo "<p><b>$@</b><br><pre>"
	eval "$@"
	echo "</pre>"
}

echo "From: Raspberry Pi <637275+rpi@gmail.com>
To: Rebecca Turner <637275@gmail.com>
Subject: Raspberry Pi IP address: $IP
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary=\"$BOUNDARY\"

--$BOUNDARY
Content-Type: text/html; charset=\"utf-8\"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

"

echo_cmd ifconfig wlan0
echo_cmd iwconfig wlan0
echo_cmd wpa_cli "-i$INTERFACE" status verbose
# actual net check
echo_cmd ping google.com -c 1
echo_cmd route

echo ""
echo "--$BOUNDARY--"
