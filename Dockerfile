FROM ciscotalos/snort3:latest

USER root

RUN mkdir -p /usr/local/etc/snort/rules
COPY config/local.rules /usr/local/etc/snort/rules/local.rules

# FORCE CLEAN: This removes empty lines and trailing spaces from the rules file
RUN sed -i '/^[[:space:]]*$/d' /usr/local/etc/snort/rules/local.rules && \
    sed -i 's/[[:space:]]*$//' /usr/local/etc/snort/rules/local.rules

# Validate
RUN snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/snort/rules/local.rules -T