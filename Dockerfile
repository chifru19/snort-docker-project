FROM ciscotalos/snort3:latest

USER root

# Setup folders
RUN mkdir -p /usr/local/etc/snort/rules
COPY config/local.rules /usr/local/etc/snort/rules/local.rules

# Final validation command
RUN snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/snort/rules/local.rules -T