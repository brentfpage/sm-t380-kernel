#!/bin/bash


OUT_DIR=out

# you should change the "CROSS_COMPILE" to right toolchain path (you downloaded)
# ex)
# CROSS_COMPILE=~/android/prebuilt/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
CROSS_COMPILE=/home/brentfpage_gmail_com/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
COMMON_ARGS="-C $(pwd) O=$(pwd)/${OUT_DIR} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE} KCFLAGS=-mno-android"

# export PATH=$(pwd)/../PLATFORM/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin:$PATH
# export PATH=$(pwd)/../arm-linux-androideabi-4.9/bin:$PATH
export PATH=/home/brentfpage_gmail_com/arm-linux-androideabi-4.9/bin:$PATH
export ARCH=arm
alias python='python2'

[ -d ${OUT_DIR} ] && rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}

make ${COMMON_ARGS} gta2swifi_sea_open_defconfig
make -j$(nproc --all) ${COMMON_ARGS}

cp ${OUT_DIR}/arch/arm/boot/zImage $(pwd)/arch/arm/boot/zImage
