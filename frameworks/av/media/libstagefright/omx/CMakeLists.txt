project(libstagefright_omx)

set(STAGEFRIGHT_OMX_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/omx)


include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_library(libstagefright_omx_utils SHARED ${STAGEFRIGHT_OMX_ROOT}/OMXUtils.cpp)
target_include_directories(libstagefright_omx_utils PUBLIC
        ${STAGEFRIGHT_OMX_ROOT}/include
        ${ANDROID_ROOT}/frameworks/native/headers/media_plugin
        ${ANDROID_ROOT}/frameworks/native/headers/media_plugin/media/openmax
        ${ANDROID_ROOT}/frameworks/av/media/libmedia/include
        ${ANDROID_ROOT}/frameworks/av/media/libmedia/aidl
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/foundation/include
        ${INTERMEDIATES_ROOT}/frameworks/av/media/libmedia/libmedia/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl
        ${ANDROID_ROOT}/system/libhidl/libhidlmemory/include
        ${ANDROID_ROOT}/system/libhidl/transport/memory/1.0/default
        ${ANDROID_ROOT}/system/libhidl/transport/token/1.0/utils/include
        ${INTERMEDIATES_ROOT}/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers/gen
        )
target_compile_options(libstagefright_omx_utils PRIVATE
        -fsanitize=signed-integer-overflow,unsigned-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_omx_utils
        libmedia_omx
        liblog
        )

set(SOURCE_FILES
        ${STAGEFRIGHT_OMX_ROOT}/FrameDropper.cpp
        ${STAGEFRIGHT_OMX_ROOT}/GraphicBufferSource.cpp
        ${STAGEFRIGHT_OMX_ROOT}/BWGraphicBufferSource.cpp
        ${STAGEFRIGHT_OMX_ROOT}/OMX.cpp
        ${STAGEFRIGHT_OMX_ROOT}/OMXStore.cpp
        ${STAGEFRIGHT_OMX_ROOT}/OMXMaster.cpp
        ${STAGEFRIGHT_OMX_ROOT}/OMXNodeInstance.cpp
        ${STAGEFRIGHT_OMX_ROOT}/OMXUtils.cpp
        ${STAGEFRIGHT_OMX_ROOT}/SimpleSoftOMXComponent.cpp
        ${STAGEFRIGHT_OMX_ROOT}/SoftOMXComponent.cpp
        ${STAGEFRIGHT_OMX_ROOT}/SoftOMXPlugin.cpp
        ${STAGEFRIGHT_OMX_ROOT}/SoftVideoDecoderOMXComponent.cpp
        ${STAGEFRIGHT_OMX_ROOT}/SoftVideoEncoderOMXComponent.cpp
        ${STAGEFRIGHT_OMX_ROOT}/1.0/Omx.cpp
        ${STAGEFRIGHT_OMX_ROOT}/1.0/OmxStore.cpp
        ${STAGEFRIGHT_OMX_ROOT}/1.0/WGraphicBufferProducer.cpp
        ${STAGEFRIGHT_OMX_ROOT}/1.0/WProducerListener.cpp
        ${STAGEFRIGHT_OMX_ROOT}/1.0/WGraphicBufferSource.cpp
        ${STAGEFRIGHT_OMX_ROOT}/1.0/WOmxNode.cpp
        ${STAGEFRIGHT_OMX_ROOT}/1.0/WOmxObserver.cpp
        ${STAGEFRIGHT_OMX_ROOT}/1.0/WOmxBufferSource.cpp
        )


include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright/include)


add_library(libstagefright_omx SHARED ${SOURCE_FILES})
target_include_directories(libstagefright_omx PUBLIC
        ${STAGEFRIGHT_OMX_ROOT}/include
        ${ANDROID_ROOT}/frameworks/native/headers/media_plugin
        ${ANDROID_ROOT}/frameworks/native/headers/media_plugin/media/openmax
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/foundation/include
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/xmlparser/include
        ${ANDROID_ROOT}/frameworks/av/media/libmedia/include
        ${ANDROID_ROOT}/frameworks/av/media/libmedia/aidl
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/foundation/include
        ${INTERMEDIATES_ROOT}/frameworks/av/media/libmedia/libmedia/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl
        ${ANDROID_ROOT}/system/libhidl/libhidlmemory/include
        ${ANDROID_ROOT}/system/libhidl/transport/memory/1.0/default
        ${ANDROID_ROOT}/system/libhidl/transport/token/1.0/utils/include
        ${INTERMEDIATES_ROOT}/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers/gen
        )
target_compile_options(libstagefright_omx PRIVATE
        -Werror
        -Wall
        -Wno-unused-parameter
        -Wno-documentation
        -fsanitize=signed-integer-overflow,unsigned-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_omx
        libbase
        libbinder
        libmedia_omx
        libutils
        liblog
        libui
        libgui
        libcutils
        libstagefright_foundation
        libstagefright_xmlparser
        libhidlbase
        libhidlmemory
        libhidltransport

        android.hidl.memory-1.0
        android.hidl.token-1.0-utils
        android.hardware.graphics.common-1.0
        android.hardware.graphics.bufferqueue-1.0
        android.hardware.media-1.0
        android.hardware.media.omx-1.0
        )