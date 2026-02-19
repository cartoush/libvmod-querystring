#!/bin/sh
#
# Written by Dridi Boukelmoune <dridi.boukelmoune@gmail.com>
#
# This file is in the public domain.

set -e
set -u

BRANCH=${VINYL_BRANCH:-}

wget "https://code.vinyl-cache.org/vinyl-cache/vinyl-cache/archive/${BRANCH}.tar.gz"
tar xf "vinyl-cache-${BRANCH}.tar.gz"
cd "vinyl-cache/"
./autogen.sh

./configure --prefix=/usr
make -sj32
sudo make install
