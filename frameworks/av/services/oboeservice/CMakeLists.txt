project(libaaudioservice)

set(AAUDIOSERVICE_ROOT ${ANDROID_ROOT}/frameworks/av/services/oboeservice)

set(SOURCE_FILES
        ${AAUDIOSERVICE_ROOT}/SharedMemoryProxy.cpp
        ${AAUDIOSERVICE_ROOT}/SharedRingBuffer.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioClientTracker.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioEndpointManager.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioMixer.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioService.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioServiceEndpoint.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioServiceEndpointCapture.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioServiceEndpointMMAP.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioServiceEndpointPlay.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioServiceEndpointShared.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioServiceStreamBase.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioServiceStreamMMAP.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioServiceStreamShared.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioStreamTracker.cpp
        ${AAUDIOSERVICE_ROOT}/TimestampScheduler.cpp
        ${AAUDIOSERVICE_ROOT}/AAudioThread.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_library(libaaudioservice SHARED ${SOURCE_FILES})
target_include_directories(libaaudioservice PRIVATE
        ${ANDROID_ROOT}/frameworks/av/services/audioflinger
        ${ANDROID_ROOT}/system/media/audio_utils/include
        ${ANDROID_ROOT}/frameworks/native/include
        ${ANDROID_ROOT}/system/core/base/include
        ${ANDROID_ROOT}/frameworks/native/media/libaaudio/include/include
        ${ANDROID_ROOT}/frameworks/av/media/libaaudio/include
        ${ANDROID_ROOT}/frameworks/av/media/utils/include
        ${ANDROID_ROOT}/frameworks/native/include
        ${ANDROID_ROOT}/external/tinyalsa/include
        ${ANDROID_ROOT}/frameworks/av/media/libaaudio/src
        )
target_compile_options(libaaudioservice PRIVATE
        -Wno-unused-parameter
        -Wall
        -Werror
        )
target_link_libraries(libaaudioservice
        libaaudio
        libaudioflinger
        libaudioclient
        libbinder
        libcutils
        libmediautils
        libserviceutility
        libutils
        liblog
        )