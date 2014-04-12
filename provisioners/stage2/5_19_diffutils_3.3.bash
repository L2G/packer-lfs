#!/bin/bash -x
cd $LFS/sources
tar xf diffutils-3.3.tar.xz
cd diffutils-3.3

./configure --prefix=/tools

make

make install

cd $LFS/sources
rm -rf diffutils-3.3
