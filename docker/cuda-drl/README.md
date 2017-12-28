# Docker Images for ELSA Lab

These images will be automatically built on Docker Cloud and available on [Docker Hub][docker-hub].

## Dependency Tree

* nvidia/cuda:9.0-cudnn7-devel
  + shawnchang420/cuda-drl:latest
    - shawnchang420/cuda-drl:torcs

The structure of an item should be `[$HUB_USER/]$REPO_NAME[:$TAG]` where the `$HUB_USER` and `$TAG` are optional.

[docker-hub]: https://hub.docker.com/r/shawnchang420/cuda-drl/