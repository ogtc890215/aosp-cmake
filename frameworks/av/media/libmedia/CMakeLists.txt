project(libmedia)

set(MEDIA_ROOT ${ANDROID_ROOT}/frameworks/av/media/libmedia)

include_directories(${MEDIA_ROOT}/include)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright/include)
include_directories(${ANDROID_ROOT}/frameworks/native/headers/media_plugin)
include_directories(${ANDROID_ROOT}/frameworks/native/headers/media_plugin/media/openmax)
include_directories(${ANDROID_ROOT}/frameworks/native/libs/gui/include)
include_directories(${ANDROID_ROOT}/system/media/audio/include)
include_directories(${ANDROID_ROOT}/frameworks/av/media/libaudioclient/include)

set(SOURCE_FILES
        ${MEDIA_ROOT}/AudioParameter.cpp
        ${MEDIA_ROOT}/TypeConverter.cpp
        )
add_library(libmedia_helper SHARED ${SOURCE_FILES})
target_compile_options(libmedia_helper PRIVATE
        -Werror
        -Wno-error=deprecated-declarations
        -Wall
        )
target_link_libraries(libmedia_helper
        libutils
        liblog
        libgui
        )

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/frameworks/av/media/libmedia/libmedia/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl/frameworks/av/media/libmedia/aidl/android/IGraphicBufferSource.cpp
        ${INTERMEDIATES_ROOT}/frameworks/av/media/libmedia/libmedia/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl/frameworks/av/media/libmedia/aidl/android/IOMXBufferSource.cpp

        ${MEDIA_ROOT}/IMediaCodecList.cpp
        ${MEDIA_ROOT}/IMediaCodecService.cpp
        ${MEDIA_ROOT}/IOMX.cpp
        ${MEDIA_ROOT}/IOMXStore.cpp
        ${MEDIA_ROOT}/MediaCodecBuffer.cpp
        ${MEDIA_ROOT}/MediaCodecInfo.cpp
        ${MEDIA_ROOT}/MediaDefs.cpp
        ${MEDIA_ROOT}/OMXBuffer.cpp
        ${MEDIA_ROOT}/omx/1.0/WGraphicBufferSource.cpp
        ${MEDIA_ROOT}/omx/1.0/WOmx.cpp
        ${MEDIA_ROOT}/omx/1.0/WOmxBufferSource.cpp
        ${MEDIA_ROOT}/omx/1.0/WOmxNode.cpp
        ${MEDIA_ROOT}/omx/1.0/WOmxObserver.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)



add_library(libmedia_omx SHARED ${SOURCE_FILES})
target_include_directories(libmedia_omx PUBLIC
        ${MEDIA_ROOT}/include
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
target_compile_options(libmedia_omx PRIVATE
        -Werror
        -Wno-error=deprecated-declarations
        -Wall
        -fsanitize=unsigned-integer-overflow,signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libmedia_omx
        libbase
        libbinder
        libcutils
        libgui
        libhidlbase
        libhidlmemory
        libhidltransport
        libhwbinder
        liblog
        libstagefright_foundation
        libui
        libutils

        android.hidl.memory-1.0
        android.hidl.token-1.0-utils
        android.hardware.media.omx-1.0
        android.hardware.media-1.0
        )

list(APPEND SOURCE_FILES
        ${MEDIA_ROOT}/IDataSource.cpp
        ${MEDIA_ROOT}/IHDCP.cpp
        ${MEDIA_ROOT}/BufferingSettings.cpp
        ${MEDIA_ROOT}/mediaplayer.cpp
        ${MEDIA_ROOT}/IMediaHTTPConnection.cpp
        ${MEDIA_ROOT}/IMediaHTTPService.cpp
        ${MEDIA_ROOT}/IMediaExtractor.cpp
        ${MEDIA_ROOT}/IMediaExtractorService.cpp
        ${MEDIA_ROOT}/IMediaPlayerService.cpp
        ${MEDIA_ROOT}/IMediaPlayerClient.cpp
        ${MEDIA_ROOT}/IMediaRecorderClient.cpp
        ${MEDIA_ROOT}/IMediaPlayer.cpp
        ${MEDIA_ROOT}/IMediaRecorder.cpp
        ${MEDIA_ROOT}/IMediaSource.cpp
        ${MEDIA_ROOT}/IRemoteDisplay.cpp
        ${MEDIA_ROOT}/IRemoteDisplayClient.cpp
        ${MEDIA_ROOT}/IResourceManagerClient.cpp
        ${MEDIA_ROOT}/IResourceManagerService.cpp
        ${MEDIA_ROOT}/IStreamSource.cpp
        ${MEDIA_ROOT}/MediaUtils.cpp
        ${MEDIA_ROOT}/Metadata.cpp
        ${MEDIA_ROOT}/mediarecorder.cpp
        ${MEDIA_ROOT}/IMediaMetadataRetriever.cpp
        ${MEDIA_ROOT}/mediametadataretriever.cpp
        ${MEDIA_ROOT}/MidiDeviceInfo.cpp
        ${MEDIA_ROOT}/MidiIoWrapper.cpp
        ${MEDIA_ROOT}/JetPlayer.cpp
        ${MEDIA_ROOT}/MediaScanner.cpp
        ${MEDIA_ROOT}/MediaScannerClient.cpp
        ${MEDIA_ROOT}/CharacterEncodingDetector.cpp
        ${MEDIA_ROOT}/IMediaDeathNotifier.cpp
        ${MEDIA_ROOT}/MediaProfiles.cpp
        ${MEDIA_ROOT}/MediaResource.cpp
        ${MEDIA_ROOT}/MediaResourcePolicy.cpp
        ${MEDIA_ROOT}/Visualizer.cpp
        ${MEDIA_ROOT}/StringArray.cpp
        )

include_directories(${ANDROID_ROOT}/bionic/libc)
include_directories(${ANDROID_ROOT}/bionic/libc/private)

add_library(libmedia SHARED ${SOURCE_FILES})
target_include_directories(libmedia PUBLIC
        ${MEDIA_ROOT}/include
        ${ANDROID_ROOT}/frameworks/av/media/libmedia/aidl
        ${INTERMEDIATES_ROOT}/frameworks/av/media/libmedia/libmedia/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl
        ${ANDROID_ROOT}/system/libhidl/libhidlmemory/include
        ${ANDROID_ROOT}/system/libhidl/transport/memory/1.0/default
        ${ANDROID_ROOT}/system/libhidl/transport/token/1.0/utils/include
        ${INTERMEDIATES_ROOT}/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers/gen
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/foundation/include
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers/gen
        ${ANDROID_ROOT}/external/icu/icu4c/source/i18n
        ${ANDROID_ROOT}/external/icu/icu4c/source/common
        ${ANDROID_ROOT}/external/sonivox/arm-wt-22k/include
        )
target_compile_options(libmedia PRIVATE
        -Werror
        -Wno-error=deprecated-declarations
        -Wall
        )
target_link_libraries(libmedia
        libui
        liblog
        libcutils
        libutils
        libbinder
        libsonivox
        libicuuc
        libicui18n
        libexpat
        libcamera_client
        libstagefright_foundation
        libgui
        libaudioutils
        libaudioclient
        libmedia_helper
        libmediadrm
        libmediametrics
        libbase
        libhidlbase
        libhidltransport
        libhwbinder
        libhidlmemory
        libc_malloc_debug_backtrace

        android.hidl.memory-1.0
        android.hidl.token-1.0-utils
        android.hardware.media.omx-1.0
        android.hardware.media-1.0
        android.hardware.graphics.common-1.0
        android.hardware.graphics.bufferqueue-1.0

        )