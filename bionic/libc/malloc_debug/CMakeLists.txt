project(libmalloc_debug)

set(MALLOC_DEBUG_ROOT ${ANDROID_ROOT}/bionic/libc/malloc_debug)

set(SOURCE_FILES
        ${MALLOC_DEBUG_ROOT}/backtrace.cpp
        ${MALLOC_DEBUG_ROOT}/MapData.cpp
        )

include_directories(BEFORE ${ANDROID_ROOT}/bionic/libc)


add_library(libc_malloc_debug_backtrace STATIC ${SOURCE_FILES})
target_include_directories(libc_malloc_debug_backtrace PUBLIC
        ${MALLOC_DEBUG_ROOT}
        )
target_compile_options(libc_malloc_debug_backtrace PRIVATE
        -Werror
        -Wall
        -Wno-error=format-zero-length
        )
target_link_libraries(libc_malloc_debug_backtrace
        libasync_safe
        libdemangle
        )