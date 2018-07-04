project(android.hardware.graphics.composer@2.1)

set(ANDROID_HARDWARE_GRAPHICS_COMPOSER_2_1_ROOT ${ANDROID_ROOT}/hardware/interfaces/graphics/composer/2.1)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++/gen/android/hardware/graphics/composer/2.1/ComposerAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++/gen/android/hardware/graphics/composer/2.1/ComposerCallbackAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++/gen/android/hardware/graphics/composer/2.1/ComposerClientAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++/gen/android/hardware/graphics/composer/2.1/types.cpp
        )

add_library(android.hardware.graphics.composer-2.1 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.graphics.composer-2.1 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers/gen
        )
target_compile_options(android.hardware.graphics.composer-2.1 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.graphics.composer-2.1
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils

        android.hardware.graphics.common-1.0
        )