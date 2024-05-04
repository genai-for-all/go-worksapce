#!/bin/bash
set -o allexport; source settings.env; set +o allexport

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

VERSION=${VERSION}

docker buildx build \
--platform=linux/amd64,linux/arm64 \
--build-arg="GO_VERSION=${GO_VERSION}" \
--build-arg="TINYGO_VERSION=${TINYGO_VERSION}" \
--build-arg="EXTISM_VERSION=${EXTISM_VERSION}" \
--build-arg="NODE_MAJOR=${NODE_MAJOR}" \
--build-arg="USER_NAME=${USER_NAME}" \
-t k33g/genai-go-workspace:${VERSION} .

docker images | grep golang-workspace


: <<'END_COMMENT'
If you get this error message:
ERROR: Multi-platform build is not supported for the docker driver.
Switch to a different driver, or turn on the containerd image store, and try again.

Try the following command:
docker buildx create --use desktop-linux

And try again
END_COMMENT

