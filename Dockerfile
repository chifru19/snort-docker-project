FROM ciscotalos/snort3:latest

USER root

# Create directory
RUN mkdir -p /usr/local/etc/snort/rules

# Copy rules
COPY config/local.rules /usr/local/etc/snort/rules/local.rules

# On GitHub, we use the full path and skip 'ldconfig' to keep it simple
RUN /usr/local/bin/snort -c /usr/local/etc/snort/snort.lua \
    -R /usr/local/etc/snort/rules/local.rules -T