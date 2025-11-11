#Created with chatgpt by camilo by 2025-11 <3ThomasBorregaardSørensen!!


# toolchain.cmake


message(STATUS "aarch64-linux-toolchain.cmake")

set(CMAKE_SYSTEM_NAME Linux) # Or the appropriate system name
set(CMAKE_SYSTEM_PROCESSOR aarch64) # Or the appropriate processor

set(CMAKE_SYSROOT $ENV{HOME}/raspi-sysroot)

# Specify your cross-compilers
#set(CMAKE_C_COMPILER /usr/bin/aarch64-linux-gnu-gcc)
#set(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++)


# Also make sure compiler flags use the sysroot
set(CMAKE_C_FLAGS "--sysroot=${CMAKE_SYSROOT} -I${CMAKE_SYSROOT}/usr/include" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "--sysroot=${CMAKE_SYSROOT} -I${CMAKE_SYSROOT}/usr/include" CACHE STRING "" FORCE)
set(CMAKE_EXE_LINKER_FLAGS "--sysroot=${CMAKE_SYSROOT}" CACHE STRING "" FORCE)


#    # Force pkg-config to use sysroot paths
#    set(ENV{PKG_CONFIG_SYSROOT_DIR} ${CMAKE_SYSROOT})
#    set(ENV{PKG_CONFIG_LIBDIR} "${CMAKE_SYSROOT}/usr/lib/aarch64-linux-gnu/pkgconfig:${CMAKE_SYSROOT}/usr/share/pkgconfig")
#    set(ENV{PKG_CONFIG_PATH} "")

# Read the file content into a CMake list, where each line becomes an item

if(EXISTS "${CMAKE_SOURCE_DIR}/rpi-env-export.txt")
    file(STRINGS "${CMAKE_SOURCE_DIR}/rpi-env-export.txt" RPI_ENV_VARS)
    foreach(line IN LISTS RPI_ENV_VARS)
        message(STATUS "line is ${line}")
        if(line MATCHES "^([^=]+)=(.*)$")
            message(STATUS "CMAKE_MATCH_1 is ${CMAKE_MATCH_1}")
            message(STATUS "CMAKE_MATCH_2 is ${CMAKE_MATCH_2}")
            set(SYSROOT_${CMAKE_MATCH_1} "${CMAKE_MATCH_2}")
        endif()
    endforeach()
endif()


message(STATUS "SYSROOT_XDG_CURRENT_DESKTOP is ${SYSROOT_XDG_CURRENT_DESKTOP}")


# --- 🧭 Library search paths ---
# Helps find libraries manually (for find_library, etc.)
set(CMAKE_LIBRARY_PATH
   ${CMAKE_SYSROOT}/lib
   ${CMAKE_SYSROOT}/usr/lib
   ${CMAKE_SYSROOT}/usr/lib/aarch64-linux-gnu
   ${CMAKE_SYSROOT}/usr/local/lib
)

# Include paths too, for consistency
set(CMAKE_INCLUDE_PATH
   ${CMAKE_SYSROOT}/usr/include
   ${CMAKE_SYSROOT}/usr/local/include
   ${CMAKE_SYSROOT}/usr/include/aarch64-linux-gnu
)


# --- 🔍 Extra hints for find_* commands ---
# CMake’s built-in find_xxx() functions automatically prepend sysroot,
# but these hints can help when pkg-config or cmake packages are imperfect.
set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)




#set(PKG_CONFIG_EXECUTABLE "$ENV{HOME}/code/operating_system/tool/bin/aarch64-pkg-config")
set(PKG_CONFIG_EXECUTABLE "/usr/bin/pkg-config")

