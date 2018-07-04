project(android.frameworks.vr.composer@1.0)

set(ANDROID_FRAMEWORKS_VR_COMPOSER_1_0_ROOT ${ANDROID_ROOT}/frameworks/hardware/interfaces/vr/composer/1.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/frameworks/hardware/interfaces/vr/composer/1.0/android.frameworks.vr.composer@1.0_genc++/gen/android/frameworks/vr/composer/1.0/VrComposerClientAll.cpp
        )

add_library(android.frameworks.vr.composer-1.0 SHARED ${SOURCE_FILES})
target_include_directories(android.frameworks.vr.composer-1.0 PUBLIC
        ${INTERMEDIATES_ROOT}/frameworks/hardware/interfaces/vr/composer/1.0/android.frameworks.vr.composer@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++_headers/gen
        )
target_compile_options(android.frameworks.vr.composer-1.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.frameworks.vr.composer-1.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils

        android.hardware.graphics.common-1.0
        android.hardware.graphics.composer-2.1
        )