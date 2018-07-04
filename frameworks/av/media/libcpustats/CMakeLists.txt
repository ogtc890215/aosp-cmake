project(libcpustats)

set(CPUSTATS_ROOT ${ANDROID_ROOT}/frameworks/av/media/libcpustats)

set(SOURCE_FILES
        ${CPUSTATS_ROOT}/CentralTendencyStatistics.cpp
        ${CPUSTATS_ROOT}/ThreadCpuUsage.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_library(libcpustats STATIC ${SOURCE_FILES})
target_compile_options(libcpustats PRIVATE
        -Werror
        -Wall
        )