project(libsoundtrigger)

set(SOUNDTRIGGER_ROOT ${ANDROID_ROOT}/frameworks/av/soundtrigger)

set(SOURCE_FILES
        ${SOUNDTRIGGER_ROOT}/SoundTrigger.cpp
        ${SOUNDTRIGGER_ROOT}/ISoundTrigger.cpp
        ${SOUNDTRIGGER_ROOT}/ISoundTriggerClient.cpp
        ${SOUNDTRIGGER_ROOT}/ISoundTriggerHwService.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/system/core/base/include)
include_directories(${ANDROID_ROOT}/system/media/audio/include)

add_library(libsoundtrigger SHARED ${SOURCE_FILES})
target_compile_options(libsoundtrigger PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libsoundtrigger
        libcutils
        libutils
        liblog
        libbinder
        )
