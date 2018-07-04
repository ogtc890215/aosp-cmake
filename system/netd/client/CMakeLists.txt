project(libnetd_client)

set(NETD_CLIENT_ROOT ${ANDROID_ROOT}/system/netd/client)

set(SOURCE_FILES
        ${NETD_CLIENT_ROOT}/FwmarkClient.cpp
        ${NETD_CLIENT_ROOT}/NetdClient.cpp
        )

include_directories(${ANDROID_ROOT}/bionic/libc/dns/include)
include_directories(${NETD_CLIENT_ROOT})

add_library(libnetd_client SHARED ${SOURCE_FILES})
target_include_directories(libnetd_client PUBLIC
        ${ANDROID_ROOT}/system/netd/include
        )
target_compile_options(libnetd_client PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libnetd_client
        libcutils
        )