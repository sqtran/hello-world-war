#!/bin/bash

podman build -f src/main/docker/Dockerfile.liberty -t localhost/liberty:test .
podman run --rm -p 9080:9080 -p 9443:9443 -p 8888:8888 localhost/liberty:test
