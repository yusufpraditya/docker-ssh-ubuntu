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
  echo "**** install node repo ****" && \
  curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo 'deb https://deb.nodesource.com/node_14.x focal main' \
    > /etc/apt/sources.list.d/nodesource.list && \
  echo "**** install build dependencies ****" && \
  apt-get update && \
  apt-get install -y \
    build-essential \
    nodejs && \
  echo "**** install runtime dependencies ****" && \
  apt-get install -y \
    git \
    jq \
    libatomic1 \
    nano \
    net-tools \
    sudo && \

  echo "**** clean up ****" && \
  apt-get purge --auto-remove -y \
    build-essential \
    nodejs && \
  apt-get clean && \

# add local files
COPY /root /

# ports
EXPOSE 22
