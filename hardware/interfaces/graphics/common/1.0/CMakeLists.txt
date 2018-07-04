project(android.hardware.graphics.common@1.0)

set(ANDROID_HARDWARE_GRAPHICS_COMMON_1_0_ROOT ${ANDROID_ROOT}/hardware/interfaces/graphics/common/1.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++/gen/android/hardware/graphics/common/1.0/types.cpp
        )

add_library(android.hardware.graphics.common-1.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.graphics.common-1.0 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers/gen
        )
target_compile_options(android.hardware.graphics.common-1.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.graphics.common-1.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils
        )