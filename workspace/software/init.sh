#!/usr/bin/env bash

mkdir -p /var/www/go/bin
mkdir -p /var/www/go/pkg
mkdir -p /var/www/go/src

go get -u github.com/golang/dep/cmd/dep
go get -u github.com/golang/protobuf/proto
go get -u github.com/golang/protobuf/protoc-gen-go
go get -u google.golang.org/grpc
go get github.com/gogo/protobuf/...
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/xo/xo