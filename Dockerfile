FROM debian:unstable-slim

RUN apt update

# Debug use
# RUN apt install -y dnsutils net-tools
RUN apt install -y bind9

RUN sed -i "s/\/etc\/bind\/named.conf.options/\/etc\/bind9_settings\/named.conf.options/g" /etc/bind/named.conf
RUN sed -i "s/\/etc\/bind\/named.conf.local/\/etc\/bind9_settings\/named.conf.local/g" /etc/bind/named.conf

EXPOSE 53
CMD service named restart && tail -f /dev/null