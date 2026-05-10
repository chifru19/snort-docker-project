FROM ciscotalos/snort3:latest

USER root

# 1. Create the directory just in case other parts of your project need it
RUN mkdir -p /usr/local/etc/snort/rules

# 2. We use the -R flag to point directly to a rule string. 
# This is the most reliable way to validate rules on a GitHub Runner.
RUN snort -c /usr/local/etc/snort/snort.lua \
    --lua "ips = { rules = [[alert icmp any any -> any any (msg:\"ICMP_Packet\"; sid:1000001; rev:1;)]] }" -T