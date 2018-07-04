project(libvrflinger)

set(VRFLINGER_ROOT ${ANDROID_ROOT}/frameworks/native/libs/vr/libvrflinger)

set(SOURCE_FILES
        ${VRFLINGER_ROOT}/acquired_buffer.cpp
        ${VRFLINGER_ROOT}/epoll_event_dispatcher.cpp
        ${VRFLINGER_ROOT}/display_manager_service.cpp
        ${VRFLINGER_ROOT}/display_service.cpp
        ${VRFLINGER_ROOT}/display_surface.cpp
        ${VRFLINGER_ROOT}/hardware_composer.cpp
        ${VRFLINGER_ROOT}/vr_flinger.cpp
        ${VRFLINGER_ROOT}/vsync_service.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/native/opengl/include)
include_directories(${ANDROID_ROOT}/frameworks/native/libs/vr/libdvr/include)
include_directories(${ANDROID_ROOT}/frameworks/native/libs/vr/libbroadcastring/include)
include_directories(${ANDROID_ROOT}/frameworks/native/services/surfaceflinger)
include_directories(${ANDROID_ROOT}/hardware/interfaces/graphics/composer/2.1/default)
include_directories(${ANDROID_ROOT}/external/eigen)

add_library(libvrflinger STATIC ${SOURCE_FILES})
target_include_directories(libvrflinger PUBLIC
        ${VRFLINGER_ROOT}/include
        )
target_compile_definitions(libvrflinger PRIVATE
        -DLOG_TAG=\"vr_flinger\"
        -DTRACE=0
        -DATRACE_TAG=ATRACE_TAG_GRAPHICS
        -DGL_GLEXT_PROTOTYPES
        -DEGL_EGLEXT_PROTOTYPES
        )
target_link_libraries(libvrflinger
        android.frameworks.vr.composer-1.0
        android.hardware.graphics.allocator-2.0
        android.hardware.graphics.composer-2.1

        libbinder
        libbase
        libcutils
        liblog
        libhardware
        libnativewindow
        libutils
        libEGL
        libGLESv1_CM
        libGLESv2
        libvulkan
        libui
        libgui
        libsync
        libhidlbase
        libhidltransport
        libfmq

        libbufferhubqueue
        libdisplay
        libperformance
        libvrsensor
        libvr_manager
        )