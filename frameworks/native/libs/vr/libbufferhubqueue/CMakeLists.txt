project(libbufferhubqueue)

set(BUFFERHUBQUEUE_ROOT ${ANDROID_ROOT}/frameworks/native/libs/vr/libbufferhubqueue)

set(SOURCE_FILES
        ${BUFFERHUBQUEUE_ROOT}/buffer_hub_queue_client.cpp
        ${BUFFERHUBQUEUE_ROOT}/buffer_hub_queue_producer.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libbufferhubqueue SHARED ${SOURCE_FILES})
target_include_directories(libbufferhubqueue PUBLIC
        ${BUFFERHUBQUEUE_ROOT}/include
        ${ANDROID_ROOT}/frameworks/native/libs/vr/libpdx_default_transport/private
        ${ANDROID_ROOT}/frameworks/native/libs/vr/libpdx_default_transport/private/uds
        ${ANDROID_ROOT}/frameworks/native/libs/vr/libdvrcommon/include
        ${ANDROID_ROOT}/frameworks/native/libs/vr/libbufferhub/include
        )
target_compile_definitions(libbufferhubqueue PRIVATE
        -DLOG_TAG=\"libbufferhubqueue\"
        -DTRACE=0
        -DATRACE_TAG=ATRACE_TAG_GRAPHICS
        )
target_link_libraries(libbufferhubqueue
        libbase
        libbinder
        libcutils
        libhardware
        liblog
        libui
        libutils
        libgui

        libbufferhub
        )