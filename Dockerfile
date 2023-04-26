FROM debian:stable-slim

RUN apt-get update &&\
    apt-get install -y apt-transport-https dirmngr gnupg ca-certificates &&\
    gpg --keyserver keyserver.ubuntu.com --receive-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF &&\
    gpg --export > /etc/apt/trusted.gpg.d/mono-official.gpg &&\
    gpg --batch --yes --delete-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF &&\
    echo "deb https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list &&\
    apt-get update &&\
    apt-get install -y --no-install-recommends nginx nginx-extras mono-runtime mono-xsp4 mono-fastcgi-server4 supervisor &&\
    apt-get upgrade -y &&\
    apt-get autoremove -y &&\
    apt-get clean &&\
    rm --recursive --force /var/tmp/* &&\
    rm --recursive --force /tmp/* &&\
    rm --recursive --force /var/lib/apt/lists/*
