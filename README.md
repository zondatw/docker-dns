# docker DNS

## Setup

```shell
make
```

## Lookup

Use `dig` to check dns server is work.  

### Install

In arch linux, you can execute following command:  

```shell
pacman -S extra/bind
```

### Check

```shell
dig @localhost zonda.tw
```

## Trouble shooting

### Restart bind failed!

```shell
service named restart
Stopping domain name service...: namedrndc: connect failed: 127.0.0.1#953: connection refused
.
Starting domain name service...: named failed!
```

you can use named command to debug it.  

```shell
/usr/sbin/named -g
```

## DDNS

[DDNS setting](./DDNS.md)  

## Reference

[Debian Bind9 wiki](https://wiki.debian.org/Bind9/)  
[How to Install and Configure DNS Server in Linux](https://www.thegeekstuff.com/2014/01/install-dns-server/)  
[Running a DNS Server in Docker](https://medium.com/nagoya-foundation/running-a-dns-server-in-docker-61cc2003e899)  
[How to delegate a sub-domain to other DNS servers](https://simpledns.plus/kb/64/how-to-delegate-a-sub-domain-to-other-dns-servers)  
