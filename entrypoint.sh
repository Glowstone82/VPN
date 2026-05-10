#!/bin/bash

if [[ -z "${Password}" ]]; then
  Password="5c301bb8-6c77-41a0-a606-4ba11bbab084"
fi
ENCRYPT="chacha20-ietf-poly1305"
QR_Path="/qr"

#V2Ray Configuration
V2_Path="/v2"

if [ ! -d /etc/shadowsocks-libev ]; then  
  mkdir /etc/shadowsocks-libev
fi

# TODO: bug when PASSWORD contain '/'
sed -e "/^#/d"\
    -e "s/\${PASSWORD}/${Password}/g"\
    -e "s/\${ENCRYPT}/${ENCRYPT}/g"\
    /conf/shadowsocks-libev_config.json >  /etc/shadowsocks-libev/config.json
echo /etc/shadowsocks-libev/config.json
cat /etc/shadowsocks-libev/config.json

ss-server -c /etc/shadowsocks-libev/config.json &
