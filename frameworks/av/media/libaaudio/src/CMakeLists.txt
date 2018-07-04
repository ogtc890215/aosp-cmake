project(libaaudio)

set(AAUDIO_ROOT ${ANDROID_ROOT}/frameworks/av/media/libaaudio/src)

set(SOURCE_FILES
        ${AAUDIO_ROOT}/core/AudioStream.cpp
        ${AAUDIO_ROOT}/core/AudioStreamBuilder.cpp
        ${AAUDIO_ROOT}/core/AAudioAudio.cpp
        ${AAUDIO_ROOT}/core/AAudioStreamParameters.cpp
        ${AAUDIO_ROOT}/legacy/AudioStreamLegacy.cpp
        ${AAUDIO_ROOT}/legacy/AudioStreamRecord.cpp
        ${AAUDIO_ROOT}/legacy/AudioStreamTrack.cpp
        ${AAUDIO_ROOT}/utility/AAudioUtilities.cpp
        ${AAUDIO_ROOT}/utility/FixedBlockAdapter.cpp
        ${AAUDIO_ROOT}/utility/FixedBlockReader.cpp
        ${AAUDIO_ROOT}/utility/FixedBlockWriter.cpp
        ${AAUDIO_ROOT}/utility/LinearRamp.cpp
        ${AAUDIO_ROOT}/fifo/FifoBuffer.cpp
        ${AAUDIO_ROOT}/fifo/FifoControllerBase.cpp
        ${AAUDIO_ROOT}/client/AudioEndpoint.cpp
        ${AAUDIO_ROOT}/client/AudioStreamInternal.cpp
        ${AAUDIO_ROOT}/client/AudioStreamInternalCapture.cpp
        ${AAUDIO_ROOT}/client/AudioStreamInternalPlay.cpp
        ${AAUDIO_ROOT}/client/IsochronousClockModel.cpp
        ${AAUDIO_ROOT}/binding/AudioEndpointParcelable.cpp
        ${AAUDIO_ROOT}/binding/AAudioBinderClient.cpp
        ${AAUDIO_ROOT}/binding/AAudioStreamRequest.cpp
        ${AAUDIO_ROOT}/binding/AAudioStreamConfiguration.cpp
        ${AAUDIO_ROOT}/binding/IAAudioClient.cpp
        ${AAUDIO_ROOT}/binding/IAAudioService.cpp
        ${AAUDIO_ROOT}/binding/RingBufferParcelable.cpp
        ${AAUDIO_ROOT}/binding/SharedMemoryParcelable.cpp
        ${AAUDIO_ROOT}/binding/SharedRegionParcelable.cpp
        )

add_library(libaaudio SHARED ${SOURCE_FILES})
target_include_directories(libaaudio PRIVATE
        ${ANDROID_ROOT}/system/media/audio_utils/include
        ${ANDROID_ROOT}/frameworks/native/include
        ${ANDROID_ROOT}/frameworks/av/include
        ${ANDROID_ROOT}/system/core/base/include
        ${ANDROID_ROOT}/frameworks/av/media/libaaudio/include
        $(AAUDIO_ROOT)
        $(AAUDIO_ROOT)/binding
        $(AAUDIO_ROOT)/client
        $(AAUDIO_ROOT)/core
        $(AAUDIO_ROOT)/fifo
        $(AAUDIO_ROOT)/legacy
        $(AAUDIO_ROOT)/utility
        )
target_compile_definitions(libaaudio PRIVATE
        "-DAAUDIO_API=__attribute__ ((visibility (\"default\")))"
        )
target_compile_options(libaaudio PRIVATE
        -Wno-unused-parameter
        -Wall
        -Werror
        )
target_link_libraries(libaaudio
        libaudioclient
        liblog
        libcutils
        libutils
        libbinder
        libaudiomanager
        )