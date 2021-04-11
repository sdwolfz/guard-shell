#-------------------------------------------------------------------------------
# Image

FROM ruby:3.0.1-alpine

#-------------------------------------------------------------------------------
# Packages

RUN set -exo pipefail              && \
                                      \
    echo 'Install system packages' && \
    apk add --update --no-cache \
      build-base                \
      less

#-------------------------------------------------------------------------------
# Workspace

RUN set -exo pipefail       && \
                               \
    echo 'Create workspace' && \
    mkdir -p /work

WORKDIR /work

#-------------------------------------------------------------------------------
# User

ARG HOST_USER_UID=1000
ARG HOST_USER_GID=1000

RUN set -exo pipefail                               && \
                                                       \
    echo 'Create the git user and group from host'  && \
    addgroup -g $HOST_USER_GID -S notroot           && \
    adduser -u $HOST_USER_UID -G notroot -D notroot && \
                                                       \
    echo 'Set direcotry permissions'                && \
    chown notroot:notroot /work

#-------------------------------------------------------------------------------
# Gems

COPY --chown=notroot:notroot Gemfile* guard-shell.gemspec /work/

USER notroot

RUN set -exo pipefail                 && \
                                         \
    echo 'Install gems'               && \
    cd /work                          && \
    bundle config --global jobs 3     && \
    bundle config --global retry 3    && \
    bundle install

#-------------------------------------------------------------------------------
# Command

CMD ["sh"]
