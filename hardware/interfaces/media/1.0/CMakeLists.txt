project(android.hardware.media@1.0)

set(ANDROID_HARDWARE_MEDIA_1_0_ROOT ${ANROID_ROOT}/hardware/interfaces/media/1.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++/gen/android/hardware/media/1.0/types.cpp
        )

add_library(android.hardware.media-1.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.media-1.0 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers/gen
        )
target_compile_options(android.hardware.media-1.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.media-1.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils

        android.hardware.graphics.common-1.0
        )