project(libaudioclient)

set(AUDIOCLIENT_ROOT ${ANDROID_ROOT}/frameworks/av/media/libaudioclient)

set(SOURCE_FILES
        ${AUDIOCLIENT_ROOT}/AudioEffect.cpp
        ${AUDIOCLIENT_ROOT}/AudioPolicy.cpp
        ${AUDIOCLIENT_ROOT}/AudioRecord.cpp
        ${AUDIOCLIENT_ROOT}/AudioSystem.cpp
        ${AUDIOCLIENT_ROOT}/AudioTrack.cpp
        ${AUDIOCLIENT_ROOT}/AudioTrackShared.cpp
        ${AUDIOCLIENT_ROOT}/IAudioFlinger.cpp
        ${AUDIOCLIENT_ROOT}/IAudioFlingerClient.cpp
        ${AUDIOCLIENT_ROOT}/IAudioPolicyService.cpp
        ${AUDIOCLIENT_ROOT}/IAudioPolicyServiceClient.cpp
        ${AUDIOCLIENT_ROOT}/IAudioRecord.cpp
        ${AUDIOCLIENT_ROOT}/IAudioTrack.cpp
        ${AUDIOCLIENT_ROOT}/IEffect.cpp
        ${AUDIOCLIENT_ROOT}/IEffectClient.cpp
        ${AUDIOCLIENT_ROOT}/ToneGenerator.cpp
        ${AUDIOCLIENT_ROOT}/PlayerBase.cpp
        ${AUDIOCLIENT_ROOT}/TrackPlayerBase.cpp
        )

include_directories(${AUDIOCLIENT_ROOT}/include/media)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libaudioclient SHARED ${SOURCE_FILES})
target_include_directories(libaudioclient PUBLIC
        ${AUDIOCLIENT_ROOT}/include
        ${ANDROID_ROOT}/frameworks/native/libs/binder/include
        ${ANDROID_ROOT}/system/core/base/include
)
target_compile_options(libaudioclient PRIVATE
        -Werror
        -Wall
        -Wno-error=deprecated-declarations
        -fsanitize=unsigned-integer-overflow,signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libaudioclient
        liblog
        libcutils
        libutils
        libbinder
        libaudioutils
        libaudiomanager

        libc_malloc_debug_backtrace
        )