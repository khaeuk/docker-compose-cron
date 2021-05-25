# start with a base centos7 image
FROM python:3.6.9

LABEL maintainer="hkim@lji.org"

# Make some directories
RUN mkdir -p /src/testcron && mkdir -p /src/cron

WORKDIR /src

RUN apt-get update

RUN apt-get -y install openssh-server sudo
RUN service ssh start
