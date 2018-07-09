project(libsoundpool)

set(SOUNDPOOL_ROOT ${ANDROID_ROOT}/frameworks/base/media/jni/soundpool)

set(SOURCE_FILES
        ${SOUNDPOOL_ROOT}/android_media_SoundPool.cpp
        ${SOUNDPOOL_ROOT}/SoundPool.cpp
        ${SOUNDPOOL_ROOT}/SoundPoolThread.cpp
        )

include_directories(${SOUNDPOOL_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_library(libsoundpool SHARED ${SOURCE_FILES})
target_compile_options(libsoundpool PRIVATE
        -Wall
        -Werror
        -Wno-error=deprecated-declarations
        -Wunused
        -Wunreachable-code
        )
target_link_libraries(libsoundpool
        liblog
        libcutils
        libutils
        libandroid_runtime
        libnativehelper
        libaudioclient
        libmediandk
        libbinder
        )