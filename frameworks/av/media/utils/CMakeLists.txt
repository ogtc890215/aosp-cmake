project(libmediautils)

set(MEDIAUTILS_ROOT ${ANDROID_ROOT}/frameworks/av/media/utils)

set(SOURCE_FILES
        ${MEDIAUTILS_ROOT}/BatteryNotifier.cpp
        ${MEDIAUTILS_ROOT}/ISchedulingPolicyService.cpp
        ${MEDIAUTILS_ROOT}/MemoryLeakTrackUtil.cpp
        ${MEDIAUTILS_ROOT}/ProcessInfo.cpp
        ${MEDIAUTILS_ROOT}/SchedulingPolicyService.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)


add_library(libmediautils SHARED ${SOURCE_FILES})
target_include_directories(libmediautils PUBLIC
        ${MEDIAUTILS_ROOT}/include
        )
target_compile_options(libmediautils PRIVATE
        -Wall
        -Werror
        -Wextra
        )
target_link_libraries(libmediautils
        libbinder
        liblog
        libcutils
        libutils
        libmemunreachable
        )