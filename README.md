packer-lfs
==========

This is a work-in-progress/proof-of-concept with the goal of using
[Packer](http://www.packer.io) to automate the build of a low-overhead GNU/Linux
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

**stage 2:** This will build on stage 1 by extracting and building the software
that was previously downloaded to /mnt/lfs/sources, corresponding with the
instructions in chapter 5.

**stage 3:** ...

**stage 4:** Profit.

Building
--------

    packer build lfs-stage0.json
    packer build lfs-stage1.json
    # Haven't figured out an automatic way of avoiding the timestamp yet...
    mv output-lfs-stage1/packer-lfs-stage1{-*,}.ovf
    packer build lfs-stage2.json

Notes
-----

During stage 0 the `sudo` package is installed, and during stage 1 the lfs user
is given sudo privileges when it is created. This makes it possible for the lfs
user to initiate the `shutdown` step at the finalization of stage 2.

During stage 1, after the [wget-list]
(http://www.linuxfromscratch.org/lfs/view/stable/wget-list) and [md5sums]
(http://www.linuxfromscratch.org/lfs/view/stable/md5sums) files are downloaded
from the LFS website, they are patched to allow downloading Linux 3.13.9, the
latest version in the 3.13.x branch at this writing.  (From [LFS section 3.2]
(http://www.linuxfromscratch.org/lfs/view/stable/chapter03/packages.html): "The
Linux kernel is updated relatively often, many times due to discoveries of
security vulnerabilities. The latest available 3.13.x kernel version should be
used, unless the [errata page]
(http://www.linuxfromscratch.org/lfs/errata/stable/) says otherwise.")

It is expected that extra steps will be required to keep the SSH server
available, since Packer's automation depends on SSH.  We will cross that bridge
when we get to it...
