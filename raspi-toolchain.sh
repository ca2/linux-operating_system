#!/bin/bash
#
# Raspi Toolchain
#
# Raspberry Pi cross-compilation environment for CLion
# Use this file in: Settings → Build, Execution, Deployment → Toolchains → Environment → “Load from file”

# 🧭 Path to Raspberry Pi sysroot
export SYSROOT=$HOME/raspi-sysroot

# 🧱 Toolchain prefix (adjust if your compiler prefix differs)
export TARGET=aarch64-linux-gnu

# 🧑‍💻 Compilers
export CC=${TARGET}-gcc
export CXX=${TARGET}-g++
export AR=${TARGET}-ar
export AS=${TARGET}-as
export LD=${TARGET}-ld
export STRIP=${TARGET}-strip

# 🪪 Sysroot and compiler flags
export CFLAGS="--sysroot=${SYSROOT}"
export CXXFLAGS="--sysroot=${SYSROOT}"
export LDFLAGS="--sysroot=${SYSROOT}"

# 🧩 pkg-config setup to use target sysroot
export PKG_CONFIG_SYSROOT_DIR=${SYSROOT}
export PKG_CONFIG_PATH=${SYSROOT}/usr/lib/aarch64-linux-gnu/pkgconfig:${SYSROOT}/usr/share/pkgconfig
export PKG_CONFIG_LIBDIR=${PKG_CONFIG_PATH}

# 🧭 Library and include search paths
export CMAKE_LIBRARY_PATH=${SYSROOT}/lib:${SYSROOT}/usr/lib:${SYSROOT}/usr/lib/aarch64-linux-gnu
export CMAKE_INCLUDE_PATH=${SYSROOT}/usr/include:${SYSROOT}/usr/local/include

# 🧰 Optional: PATH adjustment so CMake finds the cross tools first
export PATH=/usr/bin:${PATH}

# The following setting is a CMAKE variable (not a environment variable)
#export PKG_CONFIG_EXECUTABLE="$HOME/code/operating_system/tool/bin/aarch64-pkg-config"

# The following setting is a CMAKE variable (not a environment variable)
#export PKG_CONFIG_EXECUTABLE=/usr/bin/pkg-config

# The following setting doesn't exist (currently) and doesn't work (currently)
# Please set it manually when setting up the Raspi toolchain in Clion.
# export GDB=/usr/bin/gdb-multiarch