## Post-installation

1. Clone the TensorFlow Conda environment by running
    ```bash
    conda create --name roboschool --quiet --clone tensorflow
    ```
2. Activate the environment by running
    ```bash
    source activate roboschool
    ```
3. Clone the Roboschool repository by running
    ```bash
    git clone https://github.com/openai/roboschool.git
    ```
4. Copy the files from pre-compiled Bullet directory by running
    ```bash
    sudo cp -r /usr/local/roboschool/ roboschool/
    ```
5. Export pkg-config path by running
    ```bash
    export PKG_CONFIG_PATH=~/anaconda3/envs/roboschool/lib/pkgconfig
    ```
6. Install Roboschool by running
    ```bash
    pip install -e roboschool
    ```
7. Install gym by running
    ```bash
    pip install gym
    ```

## Testing

1. Set OpenGL environment variable by running
    ```bash
    export MESA_GL_VERSION_OVERRIDE=3.3
    ```
2. Run the example by running
    ```bash
    python roboschool/agent_zoo/RoboschoolHumanoidFlagrun_v0_2017may.py
    ```