#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

docker-pull "$REPOSITORY/alpine-$ARCH:3.9" "alpine:3.9"

docker-build --build-arg TOMB=$VERSION alpine

docker-verify-config "--entrypoint tomb"
docker-verify -v 2>&1 | dup | contains "Tomb ${VERSION}"
