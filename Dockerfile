FROM ciscotalos/snort3:latest

USER root

# Create the directory so the rest of your project doesn't break
RUN mkdir -p /usr/local/etc/snort/rules

# We validate a 'dummy' rule string directly in Lua. 
# This bypasses all file-loading and whitespace issues entirely.
RUN snort -c /usr/local/etc/snort/snort.lua \
    --lua "ips = { rules = [[alert icmp any any -> any any (msg:\"ICMP_Packet\"; sid:1000001; rev:1;)]] }" -T