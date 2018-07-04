project(android.hardware.audio.common@2.0-util)

set(ANDROID_HARDWARE_AUDIO_COMMON_2_0_UTIL_ROOT ${ANDROID_ROOT}/hardware/interfaces/audio/common/2.0/default)

set(SOURCE_FILES
        ${ANDROID_HARDWARE_AUDIO_COMMON_2_0_UTIL_ROOT}/EffectMap.cpp
        ${ANDROID_HARDWARE_AUDIO_COMMON_2_0_UTIL_ROOT}/HidlUtils.cpp
        )

include_directories(${ANDROID_ROOT}/hardware/libhardware/include)
include_directories(${ANDROID_ROOT}/system/media/audio/include)

add_library(android.hardware.audio.common-2.0-util SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.audio.common-2.0-util PUBLIC
        ${ANDROID_HARDWARE_AUDIO_COMMON_2_0_UTIL_ROOT}
        )
target_compile_options(android.hardware.audio.common-2.0-util PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.audio.common-2.0-util
        liblog
        libutils
        libhidlbase
        android.hardware.audio.common-2.0
        )