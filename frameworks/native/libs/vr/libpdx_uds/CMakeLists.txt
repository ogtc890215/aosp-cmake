project(libpdx_uds)

set(PDX_UDS_ROOT ${ANDROID_ROOT}/frameworks/native/libs/vr/libpdx_uds)

set(SOURCE_FILES
        ${PDX_UDS_ROOT}/channel_event_set.cpp
        ${PDX_UDS_ROOT}/channel_manager.cpp
        ${PDX_UDS_ROOT}/client_channel_factory.cpp
        ${PDX_UDS_ROOT}/client_channel.cpp
        ${PDX_UDS_ROOT}/ipc_helper.cpp
        ${PDX_UDS_ROOT}/service_endpoint.cpp
        )


add_library(libpdx_uds STATIC ${SOURCE_FILES})
target_include_directories(libpdx_uds PUBLIC
        ${PDX_UDS_ROOT}/private
        )
target_compile_definitions(libpdx_uds PRIVATE
        -DLOG_TAG=\"libpdx_uds\"
        -DTRACE=0
        )
target_compile_options(libpdx_uds PRIVATE
        -Wall
        -Wextra
        -Werror
        )
target_link_libraries(libpdx_uds
        libbase
        libcutils
        libpdx

        libselinux
        )