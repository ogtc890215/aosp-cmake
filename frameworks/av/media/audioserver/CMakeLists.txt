project(audioserver)

set(AUDIOSERVER_ROOT ${ANDROID_ROOT}/frameworks/av/media/audioserver)

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)

add_executable(audioserver
        ${AUDIOSERVER_ROOT}/main_audioserver.cpp)
target_include_directories(audioserver PRIVATE
        ${ANDROID_ROOT}/frameworks/av/services/audioflinger
        ${ANDROID_ROOT}/frameworks/av/services/audiopolicy
        ${ANDROID_ROOT}/frameworks/av/services/audiopolicy/common/managerdefinitions/include
        ${ANDROID_ROOT}/frameworks/av/services/audiopolicy/common/include
        ${ANDROID_ROOT}/frameworks/av/services/audiopolicy/engine/interface
        ${ANDROID_ROOT}/frameworks/av/services/audiopolicy/service
        ${ANDROID_ROOT}/frameworks/av/services/medialog
        ${ANDROID_ROOT}/frameworks/av/services/oboeservice
        ${ANDROID_ROOT}/frameworks/av/services/radio
        ${ANDROID_ROOT}/frameworks/av/services/soundtrigger
        ${ANDROID_ROOT}/frameworks/av/media/libaaudio/include
        ${ANDROID_ROOT}/frameworks/av/media/libaaudio/src
        ${ANDROID_ROOT}/frameworks/av/media/libaaudio/src/binding
        ${ANDROID_ROOT}/external/sonic
        ${ANDROID_ROOT}/system/media/audio_utils/include
        )
target_link_libraries(audioserver
        libaaudioservice
        libaudioflinger
        libaudiopolicyservice
        libbinder
        libcutils
        liblog
        libmedialogservice
        libnbaio
        libsoundtriggerservice
        libutils
        libhwbinder
        )