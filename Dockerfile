FROM ubuntu:22.04

# This prevents the "Interface" prompt from stopping the build
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y snort && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /etc/snort