#!/bin/sh

go run /go/src/node2.go &
consul agent -config-dir /etc/consul.d/server -data-dir /var/consul
