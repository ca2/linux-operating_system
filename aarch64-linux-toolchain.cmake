
    # toolchain.cmake
    set(CMAKE_SYSTEM_NAME Linux) # Or the appropriate system name
    set(CMAKE_SYSTEM_PROCESSOR aarch64) # Or the appropriate processor

    set(CMAKE_SYSROOT $ENV{HOME}/raspi-sysroot)

    # Specify your cross-compilers
    #set(CMAKE_C_COMPILER /usr/bin/aarch64-linux-gnu-gcc)
    #set(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++)

    # Add any other necessary toolchain settings
    set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)


    set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})

    # Force pkg-config to use sysroot paths
    set(ENV{PKG_CONFIG_SYSROOT_DIR} ${CMAKE_SYSROOT})
    set(ENV{PKG_CONFIG_LIBDIR} "${CMAKE_SYSROOT}/usr/lib/aarch64-linux-gnu/pkgconfig:${CMAKE_SYSROOT}/usr/share/pkgconfig")
    set(ENV{PKG_CONFIG_PATH} "")

    # Read the file content into a CMake list, where each line becomes an item

    set(CMAKE_LIBRARY_PATH "/usr/lib/aarch64-linux-gnu:/lib/aarch64-linux-gnu")

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