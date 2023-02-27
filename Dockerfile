FROM debian:stable-slim

RUN apt-get update &&\
    apt-get install -y --no-install-recommends nginx mono-runtime mono-xsp4 mono-fastcgi-server4 supervisor &&\
    apt-get upgrade -y &&\
    apt-get autoremove -y &&\
    apt-get clean &&\
    rm --recursive --force /var/tmp/* &&\
    rm --recursive --force /tmp/* &&\
    rm --recursive --force /var/lib/apt/lists/*
