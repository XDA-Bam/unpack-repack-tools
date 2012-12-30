#!/bin/bash
# normalboot.img unpack by Skin1980 for GT-I9003

cd tools
./extract-ramdisk.pl normalboot.img
./extract-kernel.pl normalboot.img
cd ..
mv tools/zImage kernel/zImage
cp -r tools/normalboot.img-ramdisk/* ramdisk/
rm -r tools/normalboot.img-ramdisk*


