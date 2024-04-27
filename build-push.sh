#!/bin/bash

: <<'END_COMMENT'
Docker Buildx is an advanced feature provided by Docker that allows you 
to build Docker images for multiple platforms (like AMD64, ARM64, etc.) from a single command. 
It's essentially an extension to the Docker CLI that introduces the ability to 
build, tag, and push images using the BuildKit engine, which provides improved performance, caching, and build capabilities compared to the traditional Docker build process.

> **good to know:** ✋ How to fix `permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock`:
> ```bash
> sudo chmod 666 /var/run/docker.sock
> ```
END_COMMENT

VERSION=0.0.4

docker buildx build \
--platform=linux/amd64,linux/arm64 \
--build-arg="GO_VERSION=1.22.1" \
--build-arg="NODE_MAJOR=21" \
--build-arg="USER_NAME=genai-for-all" \
--push -t k33g/genai-go-workspace:${VERSION} .

docker pull k33g/genai-go-workspace:${VERSION}
docker images | grep golang-workspace


: <<'END_COMMENT'
If you get this error message:
ERROR: Multi-platform build is not supported for the docker driver.
Switch to a different driver, or turn on the containerd image store, and try again.

Try the following command:
docker buildx create --use desktop-linux

And try again
END_COMMENT

