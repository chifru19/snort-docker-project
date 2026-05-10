FROM ciscotalos/snort3:latest

USER root

# Create directory and copy file
RUN mkdir -p /usr/local/etc/snort/rules
COPY config/local.rules /usr/local/etc/snort/rules/local.rules

# We use --lua to tell Snort exactly how to handle the rule file
RUN snort -c /usr/local/etc/snort/snort.lua \
    --lua "ips = { include = '/usr/local/etc/snort/rules/local.rules' }" -T