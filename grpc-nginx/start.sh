#!/bin/sh

sleep 20

/confd/confd -log-level debug -backend etcdv3 -node http://etcd:2379 -watch &
#/confd/confd -backend etcdv3 -node http://workspace:2379 -watch &

sleep 5

nginx -g 'daemon off;'
