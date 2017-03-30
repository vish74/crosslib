FROM ubuntu:16.04

LABEL maintainer Vish "vishvesh@litmusloop.com"

RUN apt-get update && apt-get install -y \
  build-essential autoconf libtool \
  pkg-config \
  automake \
  autogen \
  bash \
  bc \
  bzip2 \
  ca-certificates \
  curl \
  file \
  git \
  gzip \
  zip \
  make \
  ncurses-dev \
  python \
  python-pip \
  rsync \
  sed \
  bison \
  flex \
  tar \
  pax \
  vim \
  wget \
  runit \
  xz-utils && \
  apt-get clean --yes

ENV GRPC_RELEASE_TAG v1.1.0
ENV AS=/usr/bin/as \
    AR=/usr/bin/ar \
    CC=/usr/bin/gcc \
    CPP=/usr/bin/cpp \
    CXX=/usr/bin/g++ \
    LDXX=/usr/bin/g++ \
    LD=/usr/bin/ld

RUN git clone -b ${GRPC_RELEASE_TAG} https://github.com/grpc/grpc /home/grpc/

# install grpc
RUN cd /home/grpc && \
    git submodule update --init && \
    make && \
    make install

#install protoc
RUN cd /home/grpc/third_party/protobuf && \
    make && make install