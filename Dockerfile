FROM ciscotalos/snort3:latest

USER root

# Create the directory so your other COPY commands don't fail
RUN mkdir -p /usr/local/etc/snort/rules

# We validate a rule string directly in Lua memory. 
# This bypasses all file-loading and whitespace issues.
RUN snort -c /usr/local/etc/snort/snort.lua \
    --lua "ips = { rules = [[alert icmp any any -> any any (msg:\"ICMP_Packet\"; sid:1000001; rev:1;)]] }" -T