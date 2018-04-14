FROM debian:latest

RUN apt-get update && apt-get install -y gnupg2 curl jq && rm -rf /var/lib/apt/lists/*

ADD assets /opt/resource
