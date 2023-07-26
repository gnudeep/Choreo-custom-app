#!/bin/sh

# Get the DNS server IP from /etc/resolv.conf
dns_server=$(awk '/^nameserver/ { print $2; exit }' /etc/resolv.conf)

exec dnsperf -s "$dns_server" -d 10 -l 30 -w 5 -c 10 choreo.dev

