#!/bin/bash
echo "---- Environment ----"
env
echo "---------------------"

function run {
  echo "${@}"
  "${@}" > /etc/nginx/nginx.conf
}

run /bin/sed \
  -e "s/LNS_PORT_5000_TCP_ADDR/${LNS_PORT_5000_TCP_ADDR}/g" \
  -e "s/LNS_PORT_5000_TCP_PORT/${LNS_PORT_5000_TCP_PORT:-5000}/g" \
  /templates/nginx.conf

nginx
