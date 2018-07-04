project(audioflinger)

set(AUDIOFLINGER_ROOT ${ANDROID_ROOT}/frameworks/av/services/audioflinger)

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${AUDIOFLINGER_ROOT})

add_library(libserviceutility SHARED ${AUDIOFLINGER_ROOT}/ServiceUtilities.cpp)
target_compile_options(libserviceutility PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libserviceutility
        libcutils
        libutils
        liblog
        libbinder
        )

set(SOURCE_FILES
        ${AUDIOFLINGER_ROOT}/AudioFlinger.cpp
        ${AUDIOFLINGER_ROOT}/Threads.cpp
        ${AUDIOFLINGER_ROOT}/Tracks.cpp
        ${AUDIOFLINGER_ROOT}/AudioHwDevice.cpp
        ${AUDIOFLINGER_ROOT}/AudioStreamOut.cpp
        ${AUDIOFLINGER_ROOT}/SpdifStreamOut.cpp
        ${AUDIOFLINGER_ROOT}/Effects.cpp
        ${AUDIOFLINGER_ROOT}/PatchPanel.cpp
        ${AUDIOFLINGER_ROOT}/StateQueue.cpp
        ${AUDIOFLINGER_ROOT}/BufLog.cpp
        ${AUDIOFLINGER_ROOT}/TypedLogger.cpp
        ${AUDIOFLINGER_ROOT}/AudioWatchdog.cpp
        ${AUDIOFLINGER_ROOT}/FastCapture.cpp
        ${AUDIOFLINGER_ROOT}/FastCaptureDumpState.cpp
        ${AUDIOFLINGER_ROOT}/FastCaptureState.cpp
        ${AUDIOFLINGER_ROOT}/FastMixer.cpp
        ${AUDIOFLINGER_ROOT}/FastMixerDumpState.cpp
        ${AUDIOFLINGER_ROOT}/FastMixerState.cpp
        ${AUDIOFLINGER_ROOT}/FastThread.cpp
        ${AUDIOFLINGER_ROOT}/FastThreadDumpState.cpp
        ${AUDIOFLINGER_ROOT}/FastThreadState.cpp
        )

add_library(libaudioflinger SHARED ${SOURCE_FILES})
target_include_directories(libaudioflinger PRIVATE
        ${ANDROID_ROOT}/frameworks/av/services/audiopolicy
        ${ANDROID_ROOT}/frameworks/av/services/medialog
        ${ANDROID_ROOT}/system/media/audio_utils/include
        )
target_compile_definitions(libaudioflinger PRIVATE
        "-DSTATE_QUEUE_INSTANTIATIONS=\"StateQueueInstantiations.cpp\""
        )
target_compile_options(libaudioflinger PRIVATE
        -fvisibility=hidden
        -Werror
        -Wall
        )
target_link_libraries(libaudioflinger
        libcpustats

        libaudiohal
        libaudioprocessing
        libaudiospdif
        libaudioutils
        libcutils
        libutils
        liblog
        libbinder
        libaudioclient
        libmedialogservice
        libmediautils
        libnbaio
        libpowermanager
        libserviceutility
        libmediautils
        libmemunreachable
        libmedia_helper
        )

