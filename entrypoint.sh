#!/bin/sh

# Get the DNS server IP from /etc/resolv.conf
dns_server=$(awk '/^nameserver/ { print $2; exit }' /etc/resolv.conf)

# Generate the DNSPerf configuration file
cat <<EOF >dnsperf.conf
- QPS: 1000
  Duration: 10
  Warmup: 5
  Threads: 10
  Nameserver: $dns_server
  Name: choreo.dev
EOF

# Run the DNSPerf test
exec dnsperf -c dnsperf.conf

