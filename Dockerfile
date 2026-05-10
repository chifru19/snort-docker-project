FROM ciscotalos/snort3:latest

USER root

# Create the directory
RUN mkdir -p /usr/local/etc/snort/rules

# We use 'printf' to write the rule. 
# This ensures NO hidden characters from macOS make it into the container.
RUN printf 'alert icmp any any -> any any (msg:"ICMP_Packet_Detected"; sid:1000001; rev:1;)' > /usr/local/etc/snort/rules/local.rules

# Validate
RUN /usr/local/bin/snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/snort/rules/local.rules -T