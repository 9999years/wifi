#! /bin/bash
ifconfig wlan0 | head -2 | tail -1 | awk '{print $2}'
