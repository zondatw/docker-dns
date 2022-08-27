# docker DNS

## Setup

### Modify forwarders

Add google DNS in `/etc/bind/named.conf.options` file.  

```shell
forwarders {
    8.8.8.8;
    8.8.4.4;
};
```

### Restart

```shell
service named restart
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
dig @localhost google.com
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