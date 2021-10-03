# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Ubuntu
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        ubuntu:latest

LABEL       author="JohnB" maintainer="johnb@example.com"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig iproute2 sudo \
 && useradd -d /home/container -u 0 -m container

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN apt-get install -y tzdata


USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
