#/bin/bash
# archl0rd - adrianofreitas.me
username=$1
htpasswd -c /etc/squid3/passwd $username
