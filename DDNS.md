# DDNS

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