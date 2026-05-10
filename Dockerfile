FROM ciscotalos/snort3:latest

USER root

RUN mkdir -p /usr/local/etc/snort/rules
COPY config/local.rules /usr/local/etc/snort/rules/local.rules

# This command validates the rules in isolation
RUN snort -R /usr/local/etc/snort/rules/local.rules -T