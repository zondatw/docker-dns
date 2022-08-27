FROM debian:unstable-slim

RUN apt update

# Debug use
# RUN apt install -y dnsutils net-tools
RUN apt install -y bind9

EXPOSE 53 8080
CMD tail -f /dev/null