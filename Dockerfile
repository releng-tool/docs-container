# SPDX-License-Identifier: BSD-2-Clause
# Copyright releng-tool

FROM ubuntu:latest

# non-interactive apt usage
ENV DEBIAN_FRONTEND=noninteractive

# pre-register pipx path
ENV PATH="$PATH:/root/.local/bin"

RUN apt-get update && apt-get install -y \
    # system packages
    gettext \
    git \
    make \
    pipx \
    python-is-python3 \
    rsync \
    texlive-full \
    xindy \
    # pypi-provided packages
    && pipx install \
    # pin sphinx v8.1.3; github.com/sphinx-doc/sphinx/issues/14221
    sphinx==8.1.3 \
    sphinx-intl \
    # modules for sphinx
    && pipx inject sphinx \
    furo \
    myst-parser \
    pygments \
    sphinx \
    sphinx-inline-tabs \
    sphinx-intl \
    # cleanup
    && rm -rf /var/lib/apt/lists/*
