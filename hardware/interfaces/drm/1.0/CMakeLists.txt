project(android.hardware.drm@1.0)

set(ANDROID_HARDWARE_DRM_1_0_ROOT ${ANDROID_ROOT}/hardware/interfaces/drm/1.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++/gen/android/hardware/drm/1.0/CryptoFactoryAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++/gen/android/hardware/drm/1.0/CryptoPluginAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++/gen/android/hardware/drm/1.0/DrmFactoryAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++/gen/android/hardware/drm/1.0/DrmPluginAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++/gen/android/hardware/drm/1.0/DrmPluginListenerAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++/gen/android/hardware/drm/1.0/types.cpp
        )

add_library(android.hardware.drm-1.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.drm-1.0 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++_headers/gen
        )
target_compile_options(android.hardware.drm-1.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.drm-1.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils
        )