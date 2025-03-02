# SPDX-License-Identifier: BSD-2-Clause
# Copyright releng-tool

FROM ubuntu:latest

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gettext \
    git \
    make \
    pipx \
    python-is-python3 \
    rsync \
    texlive-full \
    xindy \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -ms /bin/bash default

USER default
WORKDIR /home/default
ENV PATH="$PATH:/home/default/.local/bin"

RUN pipx install sphinx && \
    pipx inject sphinx \
    furo \
    myst-parser \
    pygments \
    sphinx \
    sphinx-inline-tabs \
    sphinx-intl
