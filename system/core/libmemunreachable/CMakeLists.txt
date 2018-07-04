project(libmemunreachable)

set(MEMUNREACHABLE_ROOT ${ANDROID_ROOT}/system/core/libmemunreachable)

set(SOURCE_FILES
        ${MEMUNREACHABLE_ROOT}/Allocator.cpp
        ${MEMUNREACHABLE_ROOT}/Binder.cpp
        ${MEMUNREACHABLE_ROOT}/HeapWalker.cpp
        ${MEMUNREACHABLE_ROOT}/LeakFolding.cpp
        ${MEMUNREACHABLE_ROOT}/LeakPipe.cpp
        ${MEMUNREACHABLE_ROOT}/LineBuffer.cpp
        ${MEMUNREACHABLE_ROOT}/MemUnreachable.cpp
        ${MEMUNREACHABLE_ROOT}/ProcessMappings.cpp
        ${MEMUNREACHABLE_ROOT}/PtracerThread.cpp
        ${MEMUNREACHABLE_ROOT}/ThreadCapture.cpp
        )


add_library(libmemunreachable SHARED ${SOURCE_FILES})
target_include_directories(libmemunreachable PUBLIC
        ${MEMUNREACHABLE_ROOT}/include
        )
target_compile_options(libmemunreachable PRIVATE
        -Wall
        -Wextra
        -Werror
        )
target_link_libraries(libmemunreachable
        libbase
        libasync_safe
        libc_malloc_debug_backtrace

        ${INTERMEDIATES_ROOT}/bionic/libc/crtbegin_so/android_arm64_armv8-a_cortex-a53_core/crtbegin_so.o
        )