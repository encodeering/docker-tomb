FROM       alpine:3.7

ARG        TOMB
ARG        KEY=73B35DA54ACB7D10

COPY       etc /etc
COPY       bin /usr/local/bin

RUN        addgroup -g 1000 -S       sentry        \
 &&        adduser  -u 1000 -D -S -G sentry sentry \
 &&        rm -rf   /media/*                       \
 &&        mkdir -p /mnt/tomb                      \
 &&        chmod +x /usr/local/bin/*.sh

WORKDIR    /usr/local/src

RUN        echo @testing http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories                \
 &&        apk --no-cache --virtual build-dependencies add make curl gnupg                                     \
 &&        apk --no-cache add cryptsetup e2fsprogs gnupg pinentry sudo zsh                                     \
                              e2fsprogs-extra file findmnt gettext util-linux                                  \
                              haveged lsof libqrencode steghide@testing                                        \
 &&        mkdir tomb                                                                                          \
 &&        curl -SL https://files.dyne.org/tomb/Tomb-${TOMB}.tar.gz     > tomb.tgz                             \
 &&        curl -SL https://files.dyne.org/tomb/Tomb-${TOMB}.tar.gz.asc > tomb.asc                             \
 &&        export GNUPGHOME="`pwd`"                                                                            \
 &&        gpg --keyserver ipv4.pool.sks-keyservers.net --recv-keys "${KEY}"                                   \
 &&        gpg --batch --verify tomb.asc tomb.tgz                                                              \
 &&        tar xvzf tomb.tgz -C tomb --strip-components=1                                                      \
 &&        make -C tomb install                                                                                \
 &&        rm -rf  tomb *                                                                                      \
 &&        apk del --force-broken-world build-dependencies

VOLUME     /mnt/tomb
WORKDIR    /mnt/tomb

# deactivates user switch due initial opening warning
# USER       sentry

RUN        touch ~/.zshrc

ENTRYPOINT ["docker-entrypoint.sh"]
