FROM debian:stretch

MAINTAINER Yuriy Miroshnyk <y.miroshnyk@gmail.com>

# todo
RUN apt-get update && apt-get install -y \
	build-essential \
	git \
	libboost-all-dev \
	libqt4-dev \
	python3 \
	python3-path \
	x11-apps
	
#cmake with specific version (see -b flag)
RUN cd /tmp && git clone -b v3.12.0 --single-branch --depth 1 https://cmake.org/cmake.git && cd cmake
RUN cd /tmp/cmake && ./configure && make -j$(nproc) && make install && cd .. && rm -rf cmake

RUN apt-get update && apt-get install -y \
    clang

ENV DISPLAY :0

#XSOCK=/tmp/.X11-unix
#XAUTH=/tmp/.docker.xauth
#xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
#docker run -ti -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH xeyes

