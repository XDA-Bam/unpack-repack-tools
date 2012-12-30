#!/bin/bash
# Kernel packer for GT-I9003 by skin1980

cp kernel/zImage zImage
rm ramdisk.cpio.lzma
rm normalboot.img

if test -e zImage ; then
    pushd ramdisk
    find . | cpio -o -H newc | lzma > ../ramdisk.cpio.lzma
    popd

    ./mkbootimg --kernel zImage --ramdisk ramdisk.cpio.lzma --pagesize 1000 -o normalboot.img 
    tar -cvf GT-I9003_PDA.tar normalboot.img 
rm ramdisk.cpio.lzma
rm normalboot.img
rm zImage
   else
    echo "No zImage found"
fi
