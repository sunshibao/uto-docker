#!/bin/sh

/var/www/etcd/etcd --data-dir /var/www/tmp/data --advertise-client-urls http://0.0.0.0:2379 --listen-client-urls http://0.0.0.0:2379 &

php-fpm