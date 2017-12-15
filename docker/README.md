# Docker Automation Scripts

These automation scripts set up Docker workspace described in [Docker for ELSA Lab](https://hackmd.io/s/BJFt7Hp-M). See [Docker Notes](https://hackmd.io/s/BkmJ4sPWz) for more information.

## Getting Started

1. Run `source build_cuda_image.sh`, it's okay if it reports the image already exists
2. Run `bash build_user_image.sh`
3. Run `bash run_user_container.sh`

**NOTE**: Remember to use `source` in the first step

## Attaching the User Container

After exiting from the container, run the following command to reattach to the container:

1. Run `bash attach_user_container.sh`