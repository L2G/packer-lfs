#!/bin/bash -x
cd $LFS/sources
tar xf coreutils-8.22.tar.xz
cd coreutils-8.22

./configure --prefix=/tools --enable-install-program=hostname

make

make install

cd $LFS/sources
rm -rf coreutils-8.22
