## Automatically created docker image for tomb

[![Build Status](https://travis-ci.org/encodeering/docker-tomb.svg?branch=master)](https://travis-ci.org/encodeering/docker-tomb)

### Docker

- https://hub.docker.com/r/encodeering/tomb-armhf/

    ```docker pull encodeering/tomb-armhf:2.5-alpine```

- https://hub.docker.com/r/encodeering/tomb-amd64/

    ```docker pull encodeering/tomb-amd64:2.5-alpine```

### Utility

```bash
# armhf
tomb () { docker run --rm -it --privileged -v `pwd`:/mnt/tomb encodeering/tomb-armhf:2.5-alpine "$@"; }
```

```bash
# amd64
tomb () { docker run --rm -it --privileged -v `pwd`:/mnt/tomb encodeering/tomb-amd64:2.5-alpine "$@"; }
```
