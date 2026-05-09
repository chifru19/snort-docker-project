# We'll use a standard ubuntu base which you likely already have
FROM ubuntu:22.04

# Install Snort 3
RUN apt-get update && \
    apt-get install -y snort && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /etc/snort