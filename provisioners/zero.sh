#!/bin/sh
dd if=/dev/zero of=/zerofill bs=1k count=1000000k
rm /zerofill
