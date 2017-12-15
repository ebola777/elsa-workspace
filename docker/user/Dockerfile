ARG BASE_NAME
FROM elsa/$BASE_NAME
MAINTAINER Shawn Chang, ebola777@yahoo.com.tw

# Define the arguments
ARG USERNAME=elsa
ARG PASSWORD=docker
ARG UID=1001

# Create the user
RUN useradd --no-log-init --create-home --shell /bin/bash --uid "$UID" "$USERNAME" && \
    echo "$USERNAME:$PASSWORD" | chpasswd && \
    adduser "$USERNAME" sudo

# Set the user name
USER "$USERNAME"