FROM nvidia/cuda:9.0-cudnn7-devel
LABEL name="cuda-drl"
LABEL description="CUDA image for deep reinforcement learning for ELSA lab"
LABEL authors="Shawn Chang <ebola777@yahoo.com.tw>"

# Install the packages for development
RUN apt update && \
    apt -y install \
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

# Install Intel MKL
# Reference: https://github.com/mind/wheels#mkl
RUN cd /tmp/ && \
    git clone https://github.com/01org/mkl-dnn.git && \
    cd mkl-dnn/scripts && ./prepare_mkl.sh && cd .. && \
    mkdir -p build && cd build && cmake .. && make && \
    sudo make install && \
    rm -rf /tmp/mkl-dnn