#!/bin/bash -x
cd $LFS/sources
tar xf check-0.9.12.tar.gz
cd check-0.9.12

PKG_CONFIG= ./configure --prefix=/tools

make

make install

cd $LFS/sources
rm -rf check-0.9.12
