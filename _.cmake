

set(RASPBIAN TRUE)

set(DEBIAN_LIKE TRUE)

add_compile_definitions(RASPBERRYPIOS)

add_compile_definitions(DEBIAN_LIKE_LINUX)

set(DONT_USE_PKG_CONFIG FALSE)

set(HAS_SYSTEM_UNAC TRUE)

set(HAS_WAYLAND FALSE)

message(STATUS "RASPBERRYPIOS defined!! (1)")


if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")

    include(operating_system/operating_system-linux/_.cmake)

endif()



