FROM ubuntu:22.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Snort 3 specifically
RUN apt-get update && \
    apt-get install -y snort3 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /etc/snort