#!/bin/sh

consul-template -config=/etc/consul-template.d/config/balancer.hcl &
nginx -g 'daemon off;' &
consul agent -ui -config-dir /etc/consul.d/client -data-dir /var/consul
