project(libcutils)

set(CUTILS_ROOT ${ANDROID_ROOT}/system/core/libcutils)

set(NOWINDOWS_SOURCE_FILES
        ${CUTILS_ROOT}/android_get_control_file.cpp
        ${CUTILS_ROOT}/fs.c
        ${CUTILS_ROOT}/multiuser.c
        ${CUTILS_ROOT}/socket_inaddr_any_server_unix.c
        ${CUTILS_ROOT}/socket_local_client_unix.c
        ${CUTILS_ROOT}/socket_local_server_unix.c
        ${CUTILS_ROOT}/socket_network_client_unix.c
        ${CUTILS_ROOT}/sockets_unix.cpp
        ${CUTILS_ROOT}/str_parms.c)

set(SOURCE_FILES
        ${CUTILS_ROOT}/config_utils.c
        ${CUTILS_ROOT}/fs_config.cpp
        ${CUTILS_ROOT}/canned_fs_config.c
        ${CUTILS_ROOT}/hashmap.c
        ${CUTILS_ROOT}/iosched_policy.c
        ${CUTILS_ROOT}/load_file.c
        ${CUTILS_ROOT}/native_handle.c
        ${CUTILS_ROOT}/open_memstream.c
        ${CUTILS_ROOT}/record_stream.c
        ${CUTILS_ROOT}/sched_policy.cpp
        ${CUTILS_ROOT}/sockets.cpp
        ${CUTILS_ROOT}/strdup16to8.c
        ${CUTILS_ROOT}/strdup8to16.c
        ${CUTILS_ROOT}/strlcpy.c
        ${CUTILS_ROOT}/threads.c)

set(ANDROID_SOURCE_FILES
        ${CUTILS_ROOT}/android_reboot.c
        ${CUTILS_ROOT}/ashmem-dev.c
        ${CUTILS_ROOT}/klog.cpp
        ${CUTILS_ROOT}/partition_utils.c
        ${CUTILS_ROOT}/properties.cpp
        ${CUTILS_ROOT}/qtaguid.c
        ${CUTILS_ROOT}/trace-dev.c
        ${CUTILS_ROOT}/uevent.c)

list(APPEND SOURCE_FILES ${NOWINDOWS_SOURCE_FILES})
list(APPEND SOURCE_FILES ${ANDROID_SOURCE_FILES})

list(APPEND SOURCE_FILES "${CUTILS_ROOT}/arch-arm64/android_memset.S")
set_property(SOURCE ${CUTILS_ROOT}/arch-arm64/android_memset.S PROPERTY LANGUAGE C)

include_directories(BEFORE ${CUTILS_ROOT}/include)

add_library(libcutils SHARED ${SOURCE_FILES})
target_compile_options(libcutils PRIVATE
        -Werror
        -Wall
        -Wextra
        -fsanitize=integer
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libcutils
        liblog
        )