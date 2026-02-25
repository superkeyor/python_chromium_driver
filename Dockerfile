FROM python:3.12-slim-bookworm

ENV TZ=US/Central
RUN apt-get update && apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Selenium
RUN apt-get update && \
    apt-get install -y \
    procps \
    chromium \
    chromium-driver \
    xvfb \
    xauth && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
