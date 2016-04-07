FROM ubuntu:trusty

RUN apt-get update -y
RUN apt-get install -y python-software-properties

RUN apt-get update -y
RUN apt-get install -y git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev libboost-chrono-dev software-properties-common

RUN apt-get update
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev

COPY LotteryEntry.java /
COPY bitcoinj-core-0.14-SNAPSHOT-bundled.jar /
COPY slf4j-simple-1.7.16.jar /
COPY setup.sh /
COPY coin_build.sh /
COPY app_build.sh /
COPY bitcoin.conf /

RUN /bin/sh setup.sh
RUN /bin/sh coin_build.sh
