#!/bin/sh

nginx -g 'daemon off;' &
consul agent -ui -config-dir /etc/consul.d/client -data-dir /var/consul
