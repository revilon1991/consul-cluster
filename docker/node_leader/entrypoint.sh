#!/bin/sh

go run /go/src/node1.go &
consul agent -config-dir /etc/consul.d/bootstrap -data-dir /var/consul
