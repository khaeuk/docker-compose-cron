# start with a base centos7 image
FROM python:3.6.9

LABEL maintainer="hkim@lji.org"

# Make some directories
RUN mkdir -p /src/testcron && mkdir -p /src/cron

WORKDIR /src/testcron

COPY . ./
COPY ./timestamps.txt /src/cron/

RUN pip install -r requirements.txt



