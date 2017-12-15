ARG TAG
FROM nvidia/cuda:$TAG
MAINTAINER Shawn Chang, ebola777@yahoo.com.tw

# Set the base name
ENV BASE_NAME cuda

# Install the packages
RUN apt-get update && \
    apt-get -y install \
    build-essential \
    cmake \
    curl \
    git \
    htop \
    iotop \
    iputils-ping \
    iputils-tracepath \
    landscape-common \
    nano \
    net-tools \
    python-dev \
    python-pip \
    python-virtualenv \
    python3-dev \
    python3-pip \
    python3-venv \
    screen \
    sudo \
    tmux \
    vim \
    wget \
    x11-apps \
    zip