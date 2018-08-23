#! /bin/bash

INTERFACE="wlan0"

IP="$(./get_ip.sh)"

BOUNDARY="$RANDOM-$RANDOM-$RANDOM"

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

echo "</pre><p><b>ifconfig $INTERFACE</b><br><pre>"
ifconfig wlan0
echo "</pre><p><b>iwconfig $INTERFACE</b><br><pre>"
iwconfig wlan0
echo "</pre><p><b>wpa_cli -i$INTERFACE status verbose</b><br><pre>"
wpa_cli "-i$INTERFACE" status verbose
# actual net check
echo "</pre><p><b>ping google.com -c 1</b><br><pre>"
ping google.com -c 1
echo "</pre><p><b>route</b><br><pre>"
route

echo ""
echo "--$BOUNDARY--"
