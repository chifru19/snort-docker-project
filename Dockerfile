FROM ciscotalos/snort3:latest

USER root

# Create the target directory
RUN mkdir -p /usr/local/etc/snort/rules

# printf handles line breaks (\n) perfectly for Linux/Snort
RUN printf 'alert icmp any any -> any any (msg:"ICMP_Packet"; sid:1000001; rev:1;)\nalert tcp any any -> any 80 (msg:"HTTP_Traffic"; sid:1000002; rev:1;)' > /usr/local/etc/snort/rules/local.rules

# Validate the config
RUN /usr/local/bin/snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/snort/rules/local.rules -T