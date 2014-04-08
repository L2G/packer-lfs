#!/bin/bash -x
cd $LFS/sources
tar xf gcc-4.8.2.tar.bz2
mkdir -pv gcc-build
cd gcc-build

../gcc-4.8.2/libstdc++-v3/configure \
    --host=$LFS_TGT                 \
    --prefix=/tools                 \
    --disable-multilib              \
    --disable-shared                \
    --disable-nls                   \
    --disable-libstdcxx-threads     \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/4.8.2

make

make install

cd ..
rm -rf gcc-4.8.2 gcc-build
