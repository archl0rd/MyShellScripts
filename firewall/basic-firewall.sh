#!/bin/sh
# Adriano Freitas

iptables -F
iptables -X
iptables -Z

iptables -A INPUT -i venet0 -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
#iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#iptables -A INPUT -m state --state INVALID -j LOG --log-prefix " FIREWALL: PACOTE$

#iptables -A INPUT -p tcp --dport 22 -j LOG --log-prefix " FIREWALL: PORTA 22 "
#iptables -I INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --sec$
#iptables -A INPUT -p tcp --dport 22 -j ACCEPT

iptables -A INPUT -p tcp --dport 6256 -j LOG --log-prefix " FIREWALL: SQUID"
iptables -A INPUT -p tcp --dport 6256 -j ACCEPT

iptables -A INPUT -p tcp --dport 443 -j LOG --log-prefix " FIREWALL: PORTA 443 "
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

iptables -A INPUT -j DROP
