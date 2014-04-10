#!/bin/bash -x
cd $LFS/sources
tar xf ncurses-5.9.tar.gz
cd ncurses-5.9

./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite

make

make install

cd $LFS/sources
rm -rf ncurses-5.9
