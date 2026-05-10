FROM ciscotalos/snort3:latest

USER root

# Create the directory
RUN mkdir -p /usr/local/etc/snort/rules

# printf ensures the file has exactly what we want and NO trailing hidden spaces
RUN printf 'alert icmp any any -> any any (msg:"ICMP_Packet"; sid:1000001; rev:1;)' > /usr/local/etc/snort/rules/local.rules

# Validate using the absolute path
RUN /usr/local/bin/snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/snort/rules/local.rules -T