#!/usr/bin/make -f

LFS=/mnt/lfs

all: ${LFS} 3_1_introduction

${LFS}:

wget-list:
	wget http://www.linuxfromscratch.org/lfs/view/stable/wget-list

md5sums:
	wget http://www.linuxfromscratch.org/lfs/view/stable/md5sums

3_1_introduction: wget-list md5sums
	mkdir -v ${LFS}/sources
	chmod -v a+wt ${LFS}/sources
	cat wget-list
	cat md5sums

# vim: noet:
