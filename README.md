## Automatically created docker image for tomb

### Docker

- https://hub.docker.com/r/encodeering/tomb-armhf/
- https://hub.docker.com/r/encodeering/tomb-amd64/

### Utility

```bash
# armhf
tomb () { docker run -it --privileged -v `pwd`:/mnt/tomb encodeering/tomb-armhf:2.6-alpine "$@"; }
```

```bash
# amd64
tomb () { docker run -it --privileged -v `pwd`:/mnt/tomb encodeering/tomb-amd64:2.6-alpine "$@"; }
```

### Notice

Please make sure that you've implemented a backup strategy prior of using this image, as more things can go wrong when using encrypted data containers.

You may find the following links interesting

* https://www.gomindsight.com/blog/5-must-haves-data-backup-strategy/
* http://www.channelfutures.com/industry-perspectives/step-step-guide-backup-strategy-small-business
