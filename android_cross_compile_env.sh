export ANDROID_NDK_ROOT=/opt/android-ndk
export ANDROID_API=23
export ANDROID_CPU=arm64-v8a

export CPP="aarch64-linux-android$ANDROID_API-clang++"
export CC="aarch64-linux-android$ANDROID_API-clang"
export CXX="aarch64-linux-android$ANDROID_API-clang++"
export LD="ld"
export AS="llvm-as"
export AR="llvm-ar"
export RANLIB="llvm-ranlib"
export STRIP="llvm-strip"

export CPPFLAGS="-D__ANDROID_API__=$ANDROID_API"
export CFLAGS="$CFLAGS --sysroot=$AOSP_SYSROOT"
export CXXFLAGS="$CXXFLAGS -stdlib=libc++ --sysroot=$AOSP_SYSROOT"
