#!/bin/bash -x
groupadd lfs
useradd -s /bin/bash -g lfs -G sudo -m -k /dev/null lfs
(echo 'lfs'; echo 'lfs') | passwd lfs
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources
