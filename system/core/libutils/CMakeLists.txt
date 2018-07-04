project(libutils)

set(UTILS_ROOT ${ANDROID_ROOT}/system/core/libutils)

set(SOURCE_FILES
        ${UTILS_ROOT}/CallStack.cpp
        ${UTILS_ROOT}/FileMap.cpp
        ${UTILS_ROOT}/JenkinsHash.cpp
        ${UTILS_ROOT}/NativeHandle.cpp
        ${UTILS_ROOT}/Printer.cpp
        ${UTILS_ROOT}/PropertyMap.cpp
        ${UTILS_ROOT}/RefBase.cpp
        ${UTILS_ROOT}/SharedBuffer.cpp
        ${UTILS_ROOT}/Static.cpp
        ${UTILS_ROOT}/StopWatch.cpp
        ${UTILS_ROOT}/String8.cpp
        ${UTILS_ROOT}/String16.cpp
        ${UTILS_ROOT}/StrongPointer.cpp
        ${UTILS_ROOT}/SystemClock.cpp
        ${UTILS_ROOT}/Threads.cpp
        ${UTILS_ROOT}/Timers.cpp
        ${UTILS_ROOT}/Tokenizer.cpp
        ${UTILS_ROOT}/Unicode.cpp
        ${UTILS_ROOT}/VectorImpl.cpp
        ${UTILS_ROOT}/misc.cpp
        )

set(ANDROID_SOURCE_FILES
        ${UTILS_ROOT}/Looper.cpp
        ${UTILS_ROOT}/ProcessCallStack.cpp
        ${UTILS_ROOT}/Trace.cpp)

list(APPEND SOURCE_FILES ${ANDROID_SOURCE_FILES})

include_directories(BEFORE ${UTILS_ROOT}/include)
include_directories(${ANDROID_ROOT}/external/safe-iop/include)

add_library(libutils SHARED ${SOURCE_FILES})
target_include_directories(libutils PUBLIC
        ${ANDROID_ROOT}/system/core/libsystem/include
        )
target_compile_options(libutils PRIVATE
        -Werror
        -fvisibility=protected
        -fsanitize=integer
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libutils
        liblog
        libbacktrace
        libcutils
        libvndksupport

        ${INTERMEDIATES_ROOT}/bionic/libc/crtbegin_so/android_arm64_armv8-a_cortex-a53_core/crtbegin_so.o
        )