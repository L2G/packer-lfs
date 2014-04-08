#!/bin/sh
dd if=/dev/zero of=$HOME/zerofill bs=1k count=1000000k
rm $HOME/zerofill
