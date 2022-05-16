FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CODE_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="aptalca"

# environment settings
ENV HOME="/home/ubuntu"

RUN \
  echo "**** install runtime dependencies ****" && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    net-tools \
    sudo && \
  apt-get install -y --no-install-recommends -- ssh && \
  mkdir -p -m0755 /run/sshd && \
  mkdir -p -m700 /home/ubuntu/.ssh

# ports and volumes
EXPOSE 22
