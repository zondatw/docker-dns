# DDNS

## Table of contents

- [DDNS](#ddns)
  - [Table of contents](#table-of-contents)
  - [Setup](#setup)
    - [Generate key](#generate-key)
    - [Set key to named.conf.local](#set-key-to-namedconflocal)
    - [Restart](#restart)
  - [Client](#client)
    - [Interactive](#interactive)
    - [Non-interactive](#non-interactive)
  - [Check](#check)
  - [Reference](#reference)

## Setup

### Generate key

```shell
$ tsig-keygen -a HMAC-MD5 ddns
key "ddns" {
        algorithm hmac-md5;
        secret "6QBnzGyH3Nu3ylN4+y4zRQ==";
};
```

### Set key to named.conf.local

[named.con.local](./bind9_settings/named.conf.local)  

### Restart

```shell
$ service named restart
```

## Client

### Interactive

```shell
// login
$ nsupdate -y hmac-md5:ddns:6QBnzGyH3Nu3ylN4+y4zRQ==

// choice name server
> server 127.0.0.1

// Update A record
> update add ck.zonda.tw. 86400 A 11.22.33.200
> send

// Delete A record
> update delete ck.zonda.tw. 86400 A 11.22.33.200
> send
```

### Non-interactive

Create `settings.txt`

```
server 127.0.0.1
update add batch.zonda.tw 86400 A 11.11.11.11
send
```

and execute command  

```shell
$ nsupdate -y hmac-md5:ddns:6QBnzGyH3Nu3ylN4+y4zRQ== -v settings.txt
```

or

```shell
echo "
server 127.0.0.1
update add batch.zonda.tw 86400 A 11.11.11.11
send
quit
" | nsupdate -y hmac-md5:ddns:6QBnzGyH3Nu3ylN4+y4zRQ==
```

## Check

Use following cmd, you can get all record by axfr query  

```shell
dig @127.0.0.1  zonda.tw axfr
```

## Reference

[設定 BIND 的 DDNS (Dynamic DNS) 環境](https://ezbox.idv.tw/180/bind-ddns-dynamic-dns/)  
[簡單建置自用的 動態 DNS、Dynamic DNS](https://ithelp.ithome.com.tw/articles/10062006)  
[動態 DNS 設定技巧](http://www.study-area.org/tips/ddns.htm)  
[Bind9-Advanced DNS Features](https://bind9.readthedocs.io/en/v9_16_5/advanced.html)  