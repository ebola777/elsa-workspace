FROM shawnchang420/cuda-drl
LABEL name="torcs"
LABEL description="With visual TOCRCS server installed"
LABEL authors="Shawn Chang <ebola777@yahoo.com.tw>"

################################################################################
# Install visual TORCS server
# Reference: https://github.com/ugo-nama-kun/gym_torcs/tree/master/vtorcs-RL-color
################################################################################
# Install the dependencies
RUN apt-get -y install \
    libglib2.0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    libplib-dev \
    libopenal-dev \
    libalut-dev \
    libxi-dev \
    libxmu-dev \
    libxrender-dev \
    libxrandr-dev \
    libpng12-dev

# Install visual TORCS server
# Go to the temporary directory
RUN cd /tmp/ && \
    # Clone the repository
    git clone https://github.com/ugo-nama-kun/gym_torcs.git && \
    # Go to the visual TORCS server directory
    cd gym_torcs/vtorcs-RL-color && \
    # Configure the packages
    ./configure && \
    # Build and install the packages
    make && \
    make install && \
    make datainstall && \
    # Remove the repository
    rm -rf /tmp/gym_torcs