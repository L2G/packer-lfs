#!/bin/bash -x
cd $LFS/sources
tar xf linux-3.13.9.tar.xz
cd linux-3.13.9

make mrproper

make headers_check
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include

cd ..
rm -rf linux-3.13.9
