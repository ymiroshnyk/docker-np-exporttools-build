FROM debian:stretch

MAINTAINER Yuriy Miroshnyk <y.miroshnyk@gmail.com>

RUN apt-get update && apt-get install -y \
	build-essential \
	libboost-all-dev \
	python3 \
	python3-path

# ccache
RUN apt update && apt install -y \
	ccache
ENV CCACHE_COMPILERCHECK=content \
	CCACHE_SLOPPINESS=pch_defines,time_macros \
	CCACHE_DIR=/ccache

# cmake
RUN apt-get install -y \
	git
RUN cd /tmp && git clone -b v3.12.0 --single-branch --depth 1 https://cmake.org/cmake.git && cd cmake
RUN cd /tmp/cmake && ./configure && make -j$(nproc) && make install && cd .. && rm -rf cmake
