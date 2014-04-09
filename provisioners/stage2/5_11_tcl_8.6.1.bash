#!/bin/bash -x
cd $LFS/sources
tar xf tcl8.6.1-src.tar.gz
cd tcl8.6.1

cd unix
./configure --prefix=/tools

make

make install

chmod -v u+w /tools/lib/libtcl8.6.so

make install-private-headers

ln -sv tclsh8.6 /tools/bin/tclsh

cd $LFS/sources
rm -rf tcl8.6.1
