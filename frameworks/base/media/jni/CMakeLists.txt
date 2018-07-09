project(libmedia_jni)

set(MEDIA_JNI_ROOT ${ANDROID_ROOT}/frameworks/base/media/jni)

set(SOURCE_FILES
        ${MEDIA_JNI_ROOT}/android_media_ImageWriter.cpp
        ${MEDIA_JNI_ROOT}/android_media_ImageReader.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaCrypto.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaCodec.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaCodecList.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaDataSource.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaDescrambler.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaDrm.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaExtractor.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaHTTPConnection.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaMetricsJNI.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaMetadataRetriever.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaMuxer.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaPlayer.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaProfiles.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaRecorder.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaScanner.cpp
        ${MEDIA_JNI_ROOT}/android_media_MediaSync.cpp
        ${MEDIA_JNI_ROOT}/android_media_ResampleInputStream.cpp
        ${MEDIA_JNI_ROOT}/android_media_SyncParams.cpp
        ${MEDIA_JNI_ROOT}/android_media_Utils.cpp
        ${MEDIA_JNI_ROOT}/android_mtp_MtpDatabase.cpp
        ${MEDIA_JNI_ROOT}/android_mtp_MtpDevice.cpp
        ${MEDIA_JNI_ROOT}/android_mtp_MtpServer.cpp
        ${MEDIA_JNI_ROOT}/midi/android_media_midi_MidiDevice.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/base/core/jni)
include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)
include_directories(${ANDROID_ROOT}/system/media/camera/include)
include_directories(${ANDROID_ROOT}/hardware/libhardware/include})

add_library(libmedia_jni SHARED ${SOURCE_FILES})
target_include_directories(libmedia_jni PUBLIC
        ${MEDIA_JNI_ROOT}
        ${ANDROID_ROOT}/external/piex
        )
target_compile_options(libmedia_jni PRIVATE
        -Wall
        -Werror
        -Wno-error=deprecated-declarations
        -Wunused
        -Wunreachable-code
        )
target_link_libraries(libmedia_jni
        libandroid_runtime
        libnativehelper
        libutils
        libbinder
        libmedia
        libmediametrics
        libmediadrm
        libmidi
        libskia
        libui
        liblog
        libcutils
        libgui
        libstagefright
        libstagefright_foundation
        libcamera_client
        libmtp
        libexif
        libpiex
        libandroidfw
        libhidlbase
        libhidltransport
        android.hardware.cas-1.0
        android.hardware.cas.native-1.0
        android.hidl.memory-1.0
        android.hidl.token-1.0-utils
        )