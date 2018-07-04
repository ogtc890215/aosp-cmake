project(libstagefright_mediafilter)

set(STAGEFRIGHT_MEDIAFILTER_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/filters)

set(SOURCE_FILES
        ${STAGEFRIGHT_MEDIAFILTER_ROOT}/ColorConvert.cpp
        ${STAGEFRIGHT_MEDIAFILTER_ROOT}/GraphicBufferListener.cpp
        ${STAGEFRIGHT_MEDIAFILTER_ROOT}/IntrinsicBlurFilter.cpp
        ${STAGEFRIGHT_MEDIAFILTER_ROOT}/MediaFilter.cpp
        ${STAGEFRIGHT_MEDIAFILTER_ROOT}/RSFilter.cpp
        ${STAGEFRIGHT_MEDIAFILTER_ROOT}/SaturationFilter.cpp
        ${STAGEFRIGHT_MEDIAFILTER_ROOT}/SimpleFilter.cpp
        ${STAGEFRIGHT_MEDIAFILTER_ROOT}/ZeroFilter.cpp

        ${INTERMEDIATES_ROOT}/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter/android_arm64_armv8-a_cortex-a53_static_core/gen/rs/ScriptC_saturationARGB.cpp
        )

include_directories(${INTERMEDIATES_ROOT}/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter/android_arm64_armv8-a_cortex-a53_static_core/gen/rs)

include_directories(${STAGEFRIGHT_MEDIAFILTER_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/rs/cpp)
include_directories(${ANDROID_ROOT}/frameworks/rs)
include_directories(${ANDROID_ROOT}/system/libhidl/transport/token/1.0/utils/include)
include_directories(${ANDROID_ROOT}/system/libhidl/transport/memory/1.0/default)
include_directories(${ANDROID_ROOT}/hardware/libhardware/include)
include_directories(${INTERMEDIATES_ROOT}/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers/gen)
include_directories(${INTERMEDIATES_ROOT}/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers/gen)
include_directories(${INTERMEDIATES_ROOT}/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers/gen)
include_directories(${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers/gen)
include_directories(${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers/gen)
include_directories(${INTERMEDIATES_ROOT}/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers/gen)
include_directories(${INTERMEDIATES_ROOT}/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers/gen)


add_library(libstagefright_mediafilter STATIC ${SOURCE_FILES})
target_compile_options(libstagefright_mediafilter PRIVATE
        -Wno-multichar
        -Werror
        -Wall
        )
target_link_libraries(libstagefright_mediafilter
        libmedia
        libgui
        libhidlmemory
        )