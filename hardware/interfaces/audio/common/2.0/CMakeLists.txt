project(android.hardware.audio.common@2.0)

set(ANDROID_HARDWARE_AUDIO_COMMON_2_0_ROOT ${ANDROID_ROOT}/hardware/interfaces/audio/common/2.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0_genc++/gen/android/hardware/audio/common/2.0/types.cpp
        )

add_library(android.hardware.audio.common-2.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.audio.common-2.0 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0_genc++_headers/gen
        )
target_compile_options(android.hardware.audio.common-2.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.audio.common-2.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils
        )