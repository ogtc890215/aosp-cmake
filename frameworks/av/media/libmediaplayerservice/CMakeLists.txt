project(libmediaplayerservice)

set(MEDIAPLAYERSERVICE_ROOT ${ANDROID_ROOT}/frameworks/av/media/libmediaplayerservice)

set(SOURCE_FILES
        ${MEDIAPLAYERSERVICE_ROOT}/ActivityManager.cpp
        ${MEDIAPLAYERSERVICE_ROOT}/HDCP.cpp
        ${MEDIAPLAYERSERVICE_ROOT}/MediaPlayerFactory.cpp
        ${MEDIAPLAYERSERVICE_ROOT}/MediaPlayerService.cpp
        ${MEDIAPLAYERSERVICE_ROOT}/MediaRecorderClient.cpp
        ${MEDIAPLAYERSERVICE_ROOT}/MetadataRetrieverClient.cpp
        ${MEDIAPLAYERSERVICE_ROOT}/RemoteDisplay.cpp
        ${MEDIAPLAYERSERVICE_ROOT}/StagefrightRecorder.cpp
        ${MEDIAPLAYERSERVICE_ROOT}/TestPlayerStub.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)

add_library(libmediaplayerservice SHARED ${SOURCE_FILES})
target_include_directories(libmediaplayerservice PUBLIC
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/include
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/rtsp
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/wifi-display
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/webm
        ${MEDIAPLAYERSERVICE_ROOT}/include/media
        ${ANDROID_ROOT}/frameworks/av/include/camera
        ${ANDROID_ROOT}/frameworks/native/include/media/openmax
        ${ANDROID_ROOT}/frameworks/native/include/media/hardware
        ${ANDROID_ROOT}/external/tremolo/Tremolo

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
        )
target_compile_options(libmediaplayerservice PRIVATE
        -Werror
        -Wno-error=deprecated-declarations
        -Wall
        )
target_link_libraries(libmediaplayerservice
        libbinder
        libcrypto
        libcutils
        libdrmframework
        liblog
        libgui
        libaudioclient
        libmedia
        libmediametrics
        libmediadrm
        libmediautils
        libmemunreachable
        libstagefright
        libstagefright_foundation
        libstagefright_httplive
        libstagefright_omx
        libstagefright_wfd
        libutils
        libnativewindow
        libhidlbase
        android.hardware.media.omx-1.0

        libstagefright_nuplayer
        libstagefright_rtsp
        libstagefright_timedtext
        )