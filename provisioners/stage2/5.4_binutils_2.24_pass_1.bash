#!/bin/bash -x
cd $LFS/sources
tar xf binutils-2.24.tar.bz2
mkdir -v binutils-build
cd binutils-build
../binutils-2.24/configure     \
    --prefix=/tools            \
    --with-sysroot=$LFS        \
    --with-lib-path=/tools/lib \
    --target=$LFS_TGT          \
    --disable-nls              \
    --disable-werror
make
case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac
make install
cd ..
rm -rf binutils-build binutils-2.24
