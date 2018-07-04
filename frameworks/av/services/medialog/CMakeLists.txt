project(libmedialogservice)

set(MEDIALOG_ROOT ${ANDROID_ROOT}/frameworks/av/services/medialog)

set(SOURCE_FILES
        ${MEDIALOG_ROOT}/MediaLogService.cpp
        ${MEDIALOG_ROOT}/IMediaLogService.cpp
        )

include_directories(${ANDROID_ROOT}/system/media/audio_utils/include)
include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_library(libmedialogservice SHARED ${SOURCE_FILES})
target_compile_options(libmedialogservice PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(libmedialogservice
        libbinder
        libutils
        liblog
        libnbaio
        libaudioutils
        )