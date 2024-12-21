#!/bin/bash

set -e

export BUILD_CLIENT="${BUILD_CLIENT:-0}"
export BUILD_SERVER="${BUILD_SERVER:-1}"
export USE_CURL="${USE_CURL:-1}"
export USE_CODEC_OPUS="${USE_CODEC_OPUS:-1}"
export USE_VOIP="${USE_VOIP:-1}"
export COPYDIR="${COPYDIR:-~/ioquake3}"
IOQ3REMOTE="${IOQ3REMOTE:-https://github.com/ioquake/ioq3.git}"
MAKE_OPTS="${MAKE_OPTS:--j2}"

if ! [ -x "$(command -v git)" ] || ! [ -x "$(command -v make)" ]; then
        echo "This build script requires 'git' and 'make' to be installed." >&2
        echo "Please install them through your normal package installation system." >&2
        exit 1
fi

git clone $IOQ3REMOTE /mnt/server/ioq3
cd $BUILD_DIR/ioq3
make $MAKE_OPTS
make copyfiles
exit