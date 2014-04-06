packer-lfs
==========

This is a work-in-progress/proof-of-concept with the goal of using
[Packer](http://www.packer.io) to automate the build of a low-overhead Linux
system based on [Linux From Scratch](http://www.linuxfromscratch.org) version
7.5.

Assuming it is successful, it could become the basis for a new LFS live CD.

Development status
------------------

The build scripts are capable of building VirtualBox images we refer to as
"stage 0" and "stage 1" (see below).  These are not yet complete builds of LFS;
still, they are already useful as starting points for anyone wanting to do a
manual LFS build by following along in the book.

Obviously there is a lot left to do!

Stages
------

The build is done in stages; the product of each stage is a VirtualBox OVF image
with companion .vmdk file.

**stage 0:** This creates a small Debian installation with just the tools
necessary to build LFS.  It includes everything through the end of chapter 2.
The "root" login is available with password "packer".

**stage 1:** This builds on stage 0 by downloading packages and patches, then
setting up the "lfs" user (with password "lfs").  It includes everything through
the end of chapter 4.
