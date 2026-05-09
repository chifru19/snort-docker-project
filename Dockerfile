FROM ciscotalos/snort3

# Create necessary directories
RUN mkdir -p /etc/snort/rules /var/log/snort

WORKDIR /etc/snort/rules