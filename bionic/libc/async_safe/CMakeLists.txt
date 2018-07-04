project(libasync_safe)

set(ASYNC_SAFE_ROOT ${ANDROID_ROOT}/bionic/libc/async_safe)

include_directories(BEFORE ${ANDROID_ROOT}/bionic/libc)

add_library(libasync_safe STATIC ${ASYNC_SAFE_ROOT}/async_safe_log.cpp)
target_include_directories(libasync_safe PUBLIC
        ${ASYNC_SAFE_ROOT}/include
        )