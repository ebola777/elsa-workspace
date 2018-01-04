FROM shawnchang420/cuda-drl
LABEL name="mujoco"
LABEL description="With MuJoCo installed"
LABEL authors="Shawn Chang <ebola777@yahoo.com.tw>"

################################################################################
# Install MuJoCo
# Reference: https://github.com/openai/mujoco-py
################################################################################
# Install the dependencies
RUN apt-get -y install \
    libgl1-mesa-dev \
    libgl1-mesa-glx \
    libglew-dev \
    libosmesa6-dev

# Install MuJoCo
# Go to the temporary directory
RUN cd /tmp/ && \
    # Create the directory
    mkdir -p /root/.mujoco && \
    # Download the file
    wget https://www.roboti.us/download/mjpro150_linux.zip -O mujoco.zip && \
    # Unzip the file
    unzip mujoco.zip -d /root/.mujoco && \
    # Remove the file
    rm -rf mujoco.zip