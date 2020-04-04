#!/bin/sh
mkdir -p out
cd ./out
make clean
cd ..
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=../toolchain/gcc/bin/aarch64-linux-androidkernel-
make O=./out ARCH=arm64 vendor/alphalm_lao_com-perf_defconfig
make O=./out ARCH=arm64 REAL_CC=../toolchain/clang/bin/clang -j16
cp -f ./out/arch/arm64/boot/Image ./packing/kernel
cd ./packing
./magiskboot hexpatch ./kernel \
736B69705F696E697472616D667300 \
77616E745F696E697472616D667300
./magiskboot repack ./sample.img

