FROM alpine:3.8

LABEL maintainer="Peter Dave Hello <hsu@peterdavehello.org>"
LABEL name="shellcheck"
LABEL version="0.6.0"

ENV SHELLCHECK_VERSION=0.6.0

RUN apk add --no-cache bash

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN wget https://storage.googleapis.com/shellcheck/shellcheck-v$SHELLCHECK_VERSION.linux.x86_64.tar.xz -O- | tar xJvf - shellcheck-v$SHELLCHECK_VERSION/shellcheck && \
    mv shellcheck-v$SHELLCHECK_VERSION/shellcheck /bin && \
    rmdir shellcheck-v$SHELLCHECK_VERSION/ && \
    shellcheck -V
