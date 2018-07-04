project(libvr_manager)

set(VR_MANAGER_ROOT ${ANDROID_ROOT}/frameworks/native/libs/vr/libvr_manager)

set(SOURCE_FILES
        ${VR_MANAGER_ROOT}/vr_manager.cpp
        ${VR_MANAGER_ROOT}/trusted_uids.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include/vr/vr_manager)
include_directories(${ANDROID_ROOT}/frameworks/native/include)

add_library(libvr_manager STATIC ${SOURCE_FILES})
target_include_directories(libvr_manager PUBLIC
        ${VR_MANAGER_ROOT}/include
        )
target_compile_options(libvr_manager PRIVATE
        -Wall
        -Werror
        -Wunused
        -Wunreachable-code
        )
target_link_libraries(libvr_manager
        libutils
        libbinder
        )