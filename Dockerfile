FROM debian:buster-slim

LABEL org.opencontainers.image.source https://github.com/darelbeida/actions_test

RUN apt-get update && apt-get install -y --no-install-recommends git gfortran libboost-dev libssl-dev make ssh vim wget \
    && apt-get install -y --no-install-recommends mpich libmpich-dev

ENV GIT_SSL_NO_VERIFY 1
