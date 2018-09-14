Scripts to email me when the IP address changes; useful on my Raspberry PI on a
network where IPs change frequently (college).

My email address is hard-coded into all of these so watch out!

Scripts:

| Script name | Description                                                  |
|-------------|--------------------------------------------------------------|
| `get_ip.sh` | Prints the current device's IP address                       |
| `info.sh`   | Prints an email describing the current device's networking   |
| `mail.sh`   | Checks if the current IP has changed and sends an email if so|

The email generated by `info.sh` is HTML email (and will properly render in Gmail or whatever).
