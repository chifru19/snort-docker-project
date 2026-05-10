FROM ciscotalos/snort3:latest

USER root

# Create the directory just so your docker-compose doesn't complain
RUN mkdir -p /usr/local/etc/snort/rules

# This validates ONLY the base configuration. 
# No rules, no strings, no hidden characters.
RUN snort -c /usr/local/etc/snort/snort.lua -T