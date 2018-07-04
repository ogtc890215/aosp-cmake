project(libbufferhub)

set(BUFFERHUB_ROOT ${ANDROID_ROOT}/frameworks/native/libs/vr/libbufferhub)

set(SOURCE_FILES
        ${BUFFERHUB_ROOT}/buffer_hub_client.cpp
        ${BUFFERHUB_ROOT}/buffer_hub_rpc.cpp
        ${BUFFERHUB_ROOT}/ion_buffer.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/native/opengl/include)
include_directories(${ANDROID_ROOT}/frameworks/native/libs/vr/libdvrcommon/include)
include_directories(${ANDROID_ROOT}/frameworks/native/libs/vr/libpdx_default_transport/private/uds)
include_directories(${ANDROID_ROOT}/frameworks/native/libs/vr/libpdx_default_transport/private)

add_library(libbufferhub SHARED ${SOURCE_FILES})
target_include_directories(libbufferhub PUBLIC
        ${BUFFERHUB_ROOT}/include
        ${ANDROID_ROOT}/frameworks/native/libs/vr/libdvr/include
        ${ANDROID_ROOT}/frameworks/native/libs/nativebase/include
        )
target_compile_definitions(libbufferhub PRIVATE
        -DLOG_TAG=\"libbufferhub\"
        -DTRACE=0
        -DATRACE_TAG=ATRACE_TAG_GRAPHICS
        )
target_link_libraries(libbufferhub
        libbase
        libcutils
        libhardware
        liblog
        libui
        libutils
        libnativewindow

        libpdx_uds
        )