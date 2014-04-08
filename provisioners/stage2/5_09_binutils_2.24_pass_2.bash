#!/bin/bash -x
cd $LFS/sources
tar xf binutils-2.24.tar.bz2
mkdir -v binutils-build
cd binutils-build

CC=$LFS_TGT-gcc                \
AR=$LFS_TGT-ar                 \
RANLIB=$LFS_TGT-ranlib         \
../binutils-2.24/configure     \
    --prefix=/tools            \
    --disable-nls              \
    --with-lib-path=/tools/lib \
    --with-sysroot

make

make install

make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin

cd ..
rm -rf binutils-build binutils-2.24
