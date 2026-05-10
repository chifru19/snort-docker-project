FROM ciscotalos/snort3:latest

USER root

# We skip creating a file entirely. 
# We tell Snort to check a "rule-string" directly using the --lua flag.
# This bypasses all line-ending, whitespace, and file-loading issues.
RUN snort -c /usr/local/etc/snort/snort.lua \
    --lua "ips = { rules = [[alert icmp any any -> any any (msg:\"ICMP_Packet\"; sid:1000001; rev:1;)]] }" -T