#!/bin/sh

go run /go/src/node3.go &
consul agent -config-dir /etc/consul.d/server -data-dir /var/consul
