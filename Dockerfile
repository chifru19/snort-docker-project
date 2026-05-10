FROM ciscotalos/snort3:latest

USER root

# Ensure the directory exists
RUN mkdir -p /usr/local/etc/snort/rules

# Copy everything from config into the rules dir
# Using the wildcard * helps if there are hidden characters in filenames
COPY config/local.rules /usr/local/etc/snort/rules/local.rules

# Validate using the absolute path and explicit config loading
RUN /usr/local/bin/snort -c /usr/local/etc/snort/snort.lua \
    -R /usr/local/etc/snort/rules/local.rules \
    --plugin-path /usr/local/lib/snort_extra -T