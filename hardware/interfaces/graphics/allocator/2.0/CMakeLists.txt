project(android.hardware.graphics.allocator@2.0)

set(ANDROID_HARDWARE_GRAPHICS_ALLOCATOR_2_0_ROOT ${ANDROID_ROOT}/hardware/interfaces/graphics/allocator/2.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++/gen/android/hardware/graphics/allocator/2.0/AllocatorAll.cpp
        )

add_library(android.hardware.graphics.allocator-2.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.graphics.allocator-2.0 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++_headers/gen
        )
target_compile_options(android.hardware.graphics.allocator-2.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.graphics.allocator-2.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils

        android.hardware.graphics.common-1.0
        android.hardware.graphics.mapper-2.0
        )