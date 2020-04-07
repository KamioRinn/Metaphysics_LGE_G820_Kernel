#!/bin/sh
mkdir -p out
cd ./out
make clean
cd ..
export CLANG_TRIPLE=aarch64-linux-gnu-
export GCC64_PATH=../toolchain/gcc/bin/aarch64-linux-androidkernel-
export CROSS_COMPILE=../toolchain/gcc/bin/aarch64-linux-androidkernel-
make O=./out ARCH=arm64 vendor/alphalm_lao_com-perf_defconfig
make O=./out menuconfig
cp ./out/.config defconfig

