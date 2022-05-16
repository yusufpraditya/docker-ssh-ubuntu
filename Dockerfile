FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CODE_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="aptalca"

# environment settings
ENV HOME="/config"

RUN \
  echo "**** install runtime dependencies ****" && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    net-tools \
    sudo && \
  apt-get install -y --no-install-recommends -- ssh && \
  mkdir -p -m0755 /run/sshd && \
  mkdir -m700 ~/.ssh  

# ports and volumes
EXPOSE 22
