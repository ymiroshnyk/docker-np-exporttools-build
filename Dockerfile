FROM debian:bookworm

MAINTAINER Yuriy Miroshnyk <y.miroshnyk@gmail.com>

RUN apt-get update && apt-get install -y \
	build-essential \
	cmake \
	libboost-all-dev \
	python3 \
	python3-path

# ccache
RUN apt update && apt install -y \
	ccache
ENV CCACHE_COMPILERCHECK=content \
	CCACHE_SLOPPINESS=pch_defines,time_macros \
	CCACHE_DIR=/ccache

