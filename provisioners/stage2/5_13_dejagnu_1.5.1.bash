#!/bin/bash -x
cd $LFS/sources
tar xf dejagnu-1.5.1.tar.gz
cd dejagnu-1.5.1

./configure --prefix=/tools

make install

cd $LFS/sources
rm -rf dejagnu-1.5.1
