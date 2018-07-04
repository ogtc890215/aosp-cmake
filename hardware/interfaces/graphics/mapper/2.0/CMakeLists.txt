project(android.hardware.graphics.mapper@2.0)

set(ANDROID_HARDWARE_GRAPHICS_MAPPER_2_0_ROOT ${ANDROID_ROOT}/hardware/interfaces/graphics/mapper/2.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++/gen/android/hardware/graphics/mapper/2.0/types.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++/gen/android/hardware/graphics/mapper/2.0/MapperAll.cpp
        )

add_library(android.hardware.graphics.mapper-2.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.graphics.mapper-2.0 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers/gen
        )
target_compile_options(android.hardware.graphics.mapper-2.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.graphics.mapper-2.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils

        android.hardware.graphics.common-1.0
        )