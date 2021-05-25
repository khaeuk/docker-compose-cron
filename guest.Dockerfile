# start with a base centos7 image
FROM python:3.6.9

LABEL maintainer="hkim@lji.org"

# Make some directories
RUN mkdir -p /src/testcron && mkdir -p /src/cron

WORKDIR /src

RUN apt-get update

# Install ssh / start ssh service / start daemon
RUN apt -y install openssh-server
RUN service ssh start
RUN /usr/sbin/sshd -D &

# Create non-root user
RUN useradd -m --no-log-init --system --uid 1000 foobob -s /bin/bash -g sudo -G root

# Chnage passwd
RUN echo 'foobob:foobob' | chpasswd
