FROM       alpine:3.7

ARG        TOMB

COPY       etc /etc

RUN        addgroup -g 1000 -S       sentry        \
 &&        adduser  -u 1000 -D -S -G sentry sentry \                                                                        \
 &&        mkdir -p /mnt/tomb

WORKDIR    /usr/local/src

RUN        echo @testing http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories                \
 &&        apk --no-cache --virtual build-dependencies add make curl                                           \
 &&        apk --no-cache add cryptsetup e2fsprogs gnupg pinentry sudo zsh                                     \
                              e2fsprogs-extra file findmnt gettext util-linux                                  \
                              libqrencode steghide@testing                                                     \
 &&        mkdir tomb                                                                                          \
 &&        curl -SL https://github.com/dyne/Tomb/archive/${TOMB}.tar.gz | tar xvz -C tomb --strip-components=1 \
 &&        make -C tomb install                                                                                \
 &&        rm -rf  tomb                                                                                        \
 &&        apk del build-dependencies

VOLUME     /mnt/tomb
WORKDIR    /mnt/tomb

USER       sentry

RUN        touch ~/.zshrc

ENTRYPOINT ["zsh"]
