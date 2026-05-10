FROM ciscotalos/snort3:latest

USER root

# We define the rules directly in the validation command.
# This bypasses every possible file-loading or whitespace error.
RUN snort -c /usr/local/etc/snort/snort.lua \
    --lua "ips = { rules = [[alert icmp any any -> any any (msg:\"ICMP_Packet\"; sid:1000001; rev:1;)]] }" -T