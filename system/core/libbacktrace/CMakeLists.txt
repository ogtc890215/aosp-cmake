project(libbacktrace)

set(BACKTRACE_ROOT ${ANDROID_ROOT}/system/core/libbacktrace)

set(SOURCE_FILES
        ${BACKTRACE_ROOT}/Backtrace.cpp
        ${BACKTRACE_ROOT}/BacktraceCurrent.cpp
        ${BACKTRACE_ROOT}/BacktracePtrace.cpp
        ${BACKTRACE_ROOT}/thread_utils.c
        ${BACKTRACE_ROOT}/ThreadEntry.cpp
        ${BACKTRACE_ROOT}/UnwindCurrent.cpp
        ${BACKTRACE_ROOT}/UnwindMap.cpp
        ${BACKTRACE_ROOT}/UnwindPtrace.cpp

        ${BACKTRACE_ROOT}/BacktraceMap.cpp
        )

include_directories(${BACKTRACE_ROOT}/include)

add_library(libbacktrace SHARED ${SOURCE_FILES})
target_compile_options(libbacktrace PRIVATE
        -Wall
        -Werror
        -Wno-inline-asm
        )
target_link_libraries(libbacktrace
        libbase
        liblog
        libunwind
        libcutils
        libdemangle
        libasync_safe
        )