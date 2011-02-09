#!/bin/sh

set -x

EXIM_SRC=$(realpath $(pwd)/../exim/src)
# BUILDDIR=$(pwd)/build
BUILDNAME=tests
PREFIX=$(pwd)/install
EXIM_USER=$(id -un)

< Makefile.Local.in sed \
    -e 's#@PREFIX@#'$PREFIX'#g' \
    -e 's#@EXIM_USER@#'$EXIM_USER'#g' \
    > $EXIM_SRC/Local/Makefile 

make -C $EXIM_SRC buildname=$BUILDNAME clean
make -C $EXIM_SRC buildname=$BUILDNAME
fakeroot make -C $EXIM_SRC buildname=$BUILDNAME install

./simple.t
