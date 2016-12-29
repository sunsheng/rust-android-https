#!/bin/sh

# rustup target add arm-linux-androideabi
# ~/dev/android-sdk-macosx/ndk-bundle/build/tools/make-standalone-toolchain.sh \
#     --arch=arm \
#     --platform=android-14 \
#     --install-dir=/tmp/toolchain
CONFIG=release
export PATH=/tmp/toolchain/bin:${PATH}
# export DEP_OPENSSL_INCLUDE=/usr/local/ssl/android-14/include
export OPENSSL_INCLUDE_DIR=/usr/local/ssl/android-14/include
export OPENSSL_LIB_DIR=/usr/local/ssl/android-14/lib
# CARGO_TARGET_ARM_LINUX_ANDROIDEABI_LINKER=toolchain/bin/arm-linux-androideabi-gcc
# rm -rf target
OPENSSL_STATIC=yes cargo build  --target arm-linux-androideabi "--${CONFIG}"
arm-linux-androideabi-strip "target/arm-linux-androideabi/${CONFIG}/http-client"
ls -l "target/arm-linux-androideabi/${CONFIG}/http-client"
# exit
adb push "target/arm-linux-androideabi/${CONFIG}/http-client" /data/local/tmp
adb shell /data/local/tmp/http-client
