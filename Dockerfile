FROM debian:buster-slim AS first_stage

LABEL org.opencontainers.image.source https://github.com/darelbeida/actions_test

RUN apt-get update && apt-get install -y --no-install-recommends git gfortran libboost-dev libssl-dev make ssh vim wget \
    && apt-get install -y --no-install-recommends mpich libmpich-dev

ENV GIT_SSL_NO_VERIFY 1

RUN cd /tmp \
    && wget https://cmake.org/files/v3.18/cmake-3.18.4.tar.gz --no-check-certificate \
    && tar xf cmake-3.18.4.tar.gz cmake-3.18.4/ && cd cmake-3.18.4 \
    && ./configure && make -j4 && make install \
    && cd /tmp && rm -rf cmake-3.18.4

FROM first_stage AS second_stage

RUN cmake --version
