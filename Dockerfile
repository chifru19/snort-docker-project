FROM ciscotalos/snort3:latest

USER root

RUN mkdir -p /usr/local/etc/snort/rules
COPY config/local.rules /usr/local/etc/snort/rules/local.rules

# Validates the two rules you just added
RUN snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/snort/rules/local.rules -T