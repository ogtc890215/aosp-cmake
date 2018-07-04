project(libdisplay)

set(DISPLAY_ROOT ${ANDROID_ROOT}/frameworks/native/libs/vr/libdisplay)

set(SOURCE_FILES
        ${DISPLAY_ROOT}/display_client.cpp
        ${DISPLAY_ROOT}/display_manager_client.cpp
        ${DISPLAY_ROOT}/display_protocol.cpp
        ${DISPLAY_ROOT}/vsync_client.cpp
        ${DISPLAY_ROOT}/shared_buffer_helpers.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/native/libs/vr/libbroadcastring/include)


add_library(libdisplay SHARED ${SOURCE_FILES})
target_include_directories(libdisplay PUBLIC
        ${DISPLAY_ROOT}/include
        ${ANDROID_ROOT}/frameworks/native/vulkan/include
        ${ANDROID_ROOT}/frameworks/native/libs/vr/libdvr/include
        )
target_compile_definitions(libdisplay PRIVATE
        -DLOG_TAG=\"libdisplay\"
        -DTRACE=0
        -DATRACE_TAG=ATRACE_TAG_GRAPHICS
        -DGL_GLEXT_PROTOTYPES
        -DEGL_EGLEXT_PROTOTYPES
        )
target_link_libraries(libdisplay
        libbase
        libcutils
        liblog
        libutils
        libui
        libgui
        libhardware
        libsync
        libnativewindow

        libbufferhubqueue
        )