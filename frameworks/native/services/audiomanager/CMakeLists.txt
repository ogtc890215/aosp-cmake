project(libaudiomanager)

set(AUDIOMANAGER_ROOT ${ANDROID_ROOT}/frameworks/native/services/audiomanager)

set(SOURCE_FILES
        ${AUDIOMANAGER_ROOT}/IAudioManager.cpp
        ${AUDIOMANAGER_ROOT}/IPlayer.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/av/include)


add_library(libaudiomanager SHARED ${SOURCE_FILES})
target_include_directories(libaudiomanager PUBLIC
        ${ANDROID_ROOT}/system/media/audio/include
        ${ANDROID_ROOT}/hardware/libhardware/include
        )
target_compile_options(libaudiomanager PRIVATE
        -Wall
        -Werror
        -Wunused
        -Wunreachable-code
        )
target_link_libraries(libaudiomanager
        libutils
        libbinder
        liblog
        )