#!/bin/sh

source_path=./cmd
go_file=main.go
image_name=eastmoney_quant

CGO_ENABLED=0 GOOS="linux" GOARCH="amd64" go build -o $source_path/$image_name $source_path/$go_file

docker rmi -f $image_name
docker build -f $source_path/Dockerfile -t $image_name  .
rm $source_path/$image_name