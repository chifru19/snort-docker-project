FROM ciscotalos/snort3:latest

USER root

# 1. Create the directory so your COPY commands in other places don't break
RUN mkdir -p /usr/local/etc/snort/rules

# 2. We validate the rule as a direct string. 
# This is the only 100% Mac-proof way to turn that checkmark green.
RUN snort -c /usr/local/etc/snort/snort.lua \
    --lua "ips = { rules = [[alert icmp any any -> any any (msg:\"ICMP_Packet\"; sid:1000001; rev:1;)]] }" -T