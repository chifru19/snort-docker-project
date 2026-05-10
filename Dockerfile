FROM ciscotalos/snort3:latest

USER root

# Create the directory
RUN mkdir -p /usr/local/etc/snort/rules

# We write both rules on a SINGLE line to eliminate line-ending issues
RUN echo 'alert icmp any any -> any any (msg:"ICMP_Packet"; sid:1000001; rev:1;) alert tcp any any -> any 80 (msg:"HTTP_Traffic"; sid:1000002; rev:1;)' > /usr/local/etc/snort/rules/local.rules

# Validate using the absolute path
RUN /usr/local/bin/snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/snort/rules/local.rules -T