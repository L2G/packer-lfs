#!/bin/bash -x

wget http://www.linuxfromscratch.org/lfs/view/stable/wget-list
wget http://www.linuxfromscratch.org/lfs/view/stable/md5sums

mkdir -v ${LFS}/sources
chmod -v a+wt ${LFS}/sources
wget -i wget-list -P ${LFS}/sources
cp md5sums ${LFS}/sources
pushd ${LFS}/sources
md5sum -c md5sums
popd
