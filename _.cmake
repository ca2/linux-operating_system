
if(${WITH_GPU_AND_GRAPHICS3D})

set(WITH_OPENGL TRUE)

endif()

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")

    include(operating_system/operating_system-linux/_.cmake)

endif()



