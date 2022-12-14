FROM debian:unstable-slim

RUN apt update

# Debug use
# RUN apt install -y dnsutils net-tools
RUN apt install -y bind9 procps

# settings directory
RUN mkdir -p /etc/bind9_settings && chown bind /etc/bind9_settings

RUN sed -i "s/\/etc\/bind\/named.conf.options/\/etc\/bind9_settings\/named.conf.options/g" /etc/bind/named.conf
RUN sed -i "s/\/etc\/bind\/named.conf.local/\/etc\/bind9_settings\/named.conf.local/g" /etc/bind/named.conf

# log path
RUN mkdir -p /var/log/bind && chown bind /var/log/bind


EXPOSE 53
CMD service named restart || /usr/sbin/named -g && tail -f /dev/null
