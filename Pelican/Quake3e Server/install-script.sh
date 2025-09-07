#!/bin/ash
# Quake3e Server Installation Script
# By JohnB <johnb@johnbdev.net>
# github.com/johnb17
#
# Based on: https://github.com/bademux/quake3e-server/blob/master/Dockerfile
#
# Server Files: /mnt/server

cd /mnt/server
apk add --no-cache --update linux-headers build-base curl-dev bash

mkdir build
cd /mnt/server/build

curl -o https://github.com/ec-/Quake3e/archive/refs/tags/latest.tar.gz /mnt/server/target.tar.gz
tar -zxvf target.tar.gz --strip-components=1
make install -j$(nproc) BUILD_SERVER=1 BUILD_CLIENT=0 DESTDIR=. TARGET_SERVER=quake3e.ded

cd /mnt/server
cp /mnt/server/build/quake3e.ded /mnt/server
