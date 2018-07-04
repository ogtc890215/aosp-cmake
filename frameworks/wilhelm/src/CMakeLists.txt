project(wilhelm)

set(WILHELM_ROOT ${ANDROID_ROOT}/frameworks/wilhelm/src)

set(SOURCE_FILES
        ${WILHELM_ROOT}/assert.cpp
        ${WILHELM_ROOT}/ut/OpenSLESUT.c
        ${WILHELM_ROOT}/ut/slesutResult.c
        )


add_compile_options(-Wall)
add_compile_options(-Werror)
add_definitions(-UNDEBUG)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)

add_library(libOpenSLESUT STATIC ${SOURCE_FILES})
target_include_directories(libOpenSLESUT PUBLIC
        ${WILHELM_ROOT}/ut
        ${ANDROID_ROOT}/frameworks/wilhelm/include
        )
target_compile_options(libOpenSLESUT PRIVATE
        -fvisibility=hidden
        )

set(SOURCE_FILES
        ${WILHELM_ROOT}/assert.cpp
        ${WILHELM_ROOT}/MPH_to.c
        ${WILHELM_ROOT}/handlers.c
        )
add_library(libopensles_helper STATIC ${SOURCE_FILES})
target_include_directories(libopensles_helper PUBLIC
        ${ANDROID_ROOT}/frameworks/wilhelm/include
        )
target_compile_definitions(libopensles_helper PRIVATE
        -DUSE_DESIGNATED_INITIALIZERS
        )
target_compile_options(libopensles_helper PRIVATE
        -Wno-initializer-overrides
        )

set(SOURCE_FILES
        ${WILHELM_ROOT}/OpenSLES_IID.cpp
        ${WILHELM_ROOT}/assert.cpp
        ${WILHELM_ROOT}/classes.cpp
        ${WILHELM_ROOT}/data.cpp
        ${WILHELM_ROOT}/devices.cpp
        ${WILHELM_ROOT}/entry.cpp
        ${WILHELM_ROOT}/handler_bodies.cpp
        ${WILHELM_ROOT}/trace.cpp
        ${WILHELM_ROOT}/locks.cpp
        ${WILHELM_ROOT}/sles.cpp
        ${WILHELM_ROOT}/sl_iid.cpp
        ${WILHELM_ROOT}/sllog.cpp
        ${WILHELM_ROOT}/ThreadPool.cpp
        ${WILHELM_ROOT}/android/AudioPlayer_to_android.cpp
        ${WILHELM_ROOT}/android/AudioRecorder_to_android.cpp
        ${WILHELM_ROOT}/android/MediaPlayer_to_android.cpp
        ${WILHELM_ROOT}/android/OutputMix_to_android.cpp
        ${WILHELM_ROOT}/android/VideoCodec_to_android.cpp
        ${WILHELM_ROOT}/android/BufferQueueSource.cpp
        ${WILHELM_ROOT}/android/CallbackProtector.cpp
        ${WILHELM_ROOT}/android/AacBqToPcmCbRenderer.cpp
        ${WILHELM_ROOT}/android/android_AudioSfDecoder.cpp
        ${WILHELM_ROOT}/android/android_AudioToCbRenderer.cpp
        ${WILHELM_ROOT}/android/android_GenericMediaPlayer.cpp
        ${WILHELM_ROOT}/android/android_GenericPlayer.cpp
        ${WILHELM_ROOT}/android/android_LocAVPlayer.cpp
        ${WILHELM_ROOT}/android/android_StreamPlayer.cpp
        ${WILHELM_ROOT}/android/android_Effect.cpp
        ${WILHELM_ROOT}/android/util/AacAdtsExtractor.cpp
        ${WILHELM_ROOT}/android/channels.cpp
        ${WILHELM_ROOT}/autogen/IID_to_MPH.cpp
        ${WILHELM_ROOT}/objects/C3DGroup.cpp
        ${WILHELM_ROOT}/objects/CAudioPlayer.cpp
        ${WILHELM_ROOT}/objects/CAudioRecorder.cpp
        ${WILHELM_ROOT}/objects/CEngine.cpp
        ${WILHELM_ROOT}/objects/COutputMix.cpp
        ${WILHELM_ROOT}/objects/CMediaPlayer.cpp
        ${WILHELM_ROOT}/itf/IAndroidBufferQueue.cpp
        ${WILHELM_ROOT}/itf/IAndroidConfiguration.cpp
        ${WILHELM_ROOT}/itf/IAndroidEffect.cpp
        ${WILHELM_ROOT}/itf/IAndroidEffectCapabilities.cpp
        ${WILHELM_ROOT}/itf/IAndroidEffectSend.cpp
        ${WILHELM_ROOT}/itf/IAcousticEchoCancellation.cpp
        ${WILHELM_ROOT}/itf/IAutomaticGainControl.cpp
        ${WILHELM_ROOT}/itf/IBassBoost.cpp
        ${WILHELM_ROOT}/itf/IBufferQueue.cpp
        ${WILHELM_ROOT}/itf/IDynamicInterfaceManagement.cpp
        ${WILHELM_ROOT}/itf/IEffectSend.cpp
        ${WILHELM_ROOT}/itf/IEngine.cpp
        ${WILHELM_ROOT}/itf/IEngineCapabilities.cpp
        ${WILHELM_ROOT}/itf/IEnvironmentalReverb.cpp
        ${WILHELM_ROOT}/itf/IEqualizer.cpp
        ${WILHELM_ROOT}/itf/IMetadataExtraction.cpp
        ${WILHELM_ROOT}/itf/INoiseSuppression.cpp
        ${WILHELM_ROOT}/itf/IMuteSolo.cpp
        ${WILHELM_ROOT}/itf/IObject.cpp
        ${WILHELM_ROOT}/itf/IOutputMix.cpp
        ${WILHELM_ROOT}/itf/IPlay.cpp
        ${WILHELM_ROOT}/itf/IPlaybackRate.cpp
        ${WILHELM_ROOT}/itf/IPrefetchStatus.cpp
        ${WILHELM_ROOT}/itf/IPresetReverb.cpp
        ${WILHELM_ROOT}/itf/IRecord.cpp
        ${WILHELM_ROOT}/itf/ISeek.cpp
        ${WILHELM_ROOT}/itf/IStreamInformation.cpp
        ${WILHELM_ROOT}/itf/IVideoDecoderCapabilities.cpp
        ${WILHELM_ROOT}/itf/IVirtualizer.cpp
        ${WILHELM_ROOT}/itf/IVolume.cpp
        )

include_directories(${WILHELM_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright/mpeg2ts)


add_library(libwilhelm SHARED ${SOURCE_FILES})
target_include_directories(libwilhelm PUBLIC
        ${ANDROID_ROOT}/frameworks/wilhelm/include
        ${ANDROID_ROOT}/frameworks/native/headers/media_plugin
        ${ANDROID_ROOT}/frameworks/native/headers/media_plugin/media/openmax
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/include
        ${ANDROID_ROOT}/frameworks/av/media/libmedia/include
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
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers/gen
        ${ANDROID_ROOT}/frameworks/av/media/libaudioclient/include
        ${ANDROID_ROOT}/frameworks/native/libs/binder/include
        ${ANDROID_ROOT}/system/core/base/include
        )
target_compile_definitions(libwilhelm PRIVATE -DUSE_PROFILES=0
        -DUSE_TRACE
        -DUSE_LOG=SLAndroidLogLevel_Info
        "LI_API=__attribute__ ((visibility (\"default\")))"
        )
target_compile_options(libwilhelm PRIVATE
        -fvisibility=hidden
        -Wno-multichar
        -Wno-invalid-offsetof
        -Wextra
        -Wno-unused-parameter
        )
target_link_libraries(libwilhelm
        liblog
        libutils
        libmedia
        libaudioclient
        libaudiomanager
        libbinder
        libstagefright
        libstagefright_foundation
        libcutils
        libnativewindow
        libgui
        libandroid_runtime

        libstagefright_http_support
        libopensles_helper
        libOpenSLESUT
        )

set(SOURCE_FILES
        ${WILHELM_ROOT}/sl_entry.cpp
        ${WILHELM_ROOT}/sl_iid.cpp
        ${WILHELM_ROOT}/assert.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)

add_library(libOpenSLES SHARED ${SOURCE_FILES})
target_include_directories(libOpenSLES PUBLIC
        ${ANDROID_ROOT}/frameworks/wilhelm/include
        ${ANDROID_ROOT}/frameworks/native/headers/media_plugin
        ${ANDROID_ROOT}/frameworks/native/headers/media_plugin/media/openmax
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/include
        ${ANDROID_ROOT}/frameworks/av/media/libmedia/include
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
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers/gen
        ${ANDROID_ROOT}/frameworks/av/media/libaudioclient/include
        ${ANDROID_ROOT}/frameworks/native/libs/binder/include
        ${ANDROID_ROOT}/system/core/base/include
        ${ANDROID_ROOT}/frameworks/native/libs/nativewindow/include
        ${ANDROID_ROOT}/frameworks/native/libs/nativebase/include
        ${ANDROID_ROOT}/frameworks/native/libs/arect/include

        )
target_compile_definitions(libOpenSLES PRIVATE
        -DLI_API=
        "DSL_API=__attribute__((visibility(\"default\")))"
        )
target_compile_options(libOpenSLES PRIVATE
        -Wall
        -Werror
        -fvisibility=hidden
        )
target_link_libraries(libOpenSLES
        libwilhelm
        liblog
        libnativewindow
        )
