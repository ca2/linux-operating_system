#Changed by camilo on 2025-11-09 00:27 <3ThomasBorregaardSørensen!!


if(${WITH_GPU_AND_GRAPHICS3D})

   message(STATUS "WITH_GPU_AND_GRAPHICS3D")
   set(WITH_OPENGL TRUE)
   set(WITH_VULKAN TRUE)

endif()


include("operating_system/operating_system-posix/__.cmake")
include("operating_system/operating_system-linux/__.cmake")