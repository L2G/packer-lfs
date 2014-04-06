#!/bin/bash -x

wget http://www.linuxfromscratch.org/lfs/view/stable/wget-list
wget http://www.linuxfromscratch.org/lfs/view/stable/md5sums

patch << END_PATCH
--- wget-list.orig	2014-04-05 22:02:56.000000000 -0700
+++ wget-list	2014-04-05 22:04:26.000000000 -0700
@@ -33,7 +33,7 @@
 http://www.linuxfromscratch.org/lfs/downloads/7.5/lfs-bootscripts-20130821.tar.bz2
 http://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.2.6.tar.gz
 http://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.gz
-http://www.kernel.org/pub/linux/kernel/v3.x/linux-3.13.3.tar.xz
+http://www.kernel.org/pub/linux/kernel/v3.x/linux-3.13.9.tar.xz
 http://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.xz
 http://ftp.gnu.org/gnu/make/make-4.0.tar.bz2
 http://download.savannah.gnu.org/releases/man-db/man-db-2.6.6.tar.xz
--- md5sums.orig	2014-04-05 22:03:03.000000000 -0700
+++ md5sums	2014-04-05 22:15:56.000000000 -0700
@@ -33,7 +33,7 @@
 e908023fc44e613ad0c81241781289e7  lfs-bootscripts-20130821.tar.bz2
 6d1d51a5dc102af41e0d269d2a31e6f9  libpipeline-1.2.6.tar.gz
 d2f3b7d4627e69e13514a40e72a24d50  libtool-2.4.2.tar.gz
-ad98a0c623a124a25dab86406ddc7119  linux-3.13.3.tar.xz
+91e81eb5acc67671ba5372835f594417  linux-3.13.9.tar.xz
 12a3c829301a4fd6586a57d3fcf196dc  m4-1.4.17.tar.xz
 571d470a7647b455e3af3f92d79f1c18  make-4.0.tar.bz2
 5d65d66191080c144437a6c854e17868  man-db-2.6.6.tar.xz
END_PATCH

mkdir -v ${LFS}/sources
chmod -v a+wt ${LFS}/sources
wget -i wget-list -P ${LFS}/sources
cp md5sums ${LFS}/sources
pushd ${LFS}/sources
md5sum -c md5sums
popd
