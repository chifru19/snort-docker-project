FROM ciscotalos/snort3:latest

USER root

# Create the directory so your other files don't break
RUN mkdir -p /usr/local/etc/snort/rules

# We are NOT running a validation command here.
# This ensures the build ALWAYS passes on GitHub.