project(libsoundtriggerservice)

set(SOUNDTRIGGERSERVICE_ROOT ${ANDROID_ROOT}/frameworks/av/services/soundtrigger)

set(SOURCE_FILES
        ${SOUNDTRIGGERSERVICE_ROOT}/SoundTriggerHwService.cpp
        ${SOUNDTRIGGERSERVICE_ROOT}/SoundTriggerHalHidl.cpp
        )

include_directories(${SOUNDTRIGGERSERVICE_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/services/audioflinger)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libsoundtriggerservice SHARED ${SOURCE_FILES})
target_compile_definitions(libsoundtriggerservice PRIVATE
        -DSOUND_TRIGGER_USE_STUB_MODULE
        )
target_compile_options(libsoundtriggerservice PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libsoundtriggerservice
        liblog
        libutils
        libbinder
        libcutils
        libhardware
        libsoundtrigger
        libaudioclient
        libserviceutility

        libhwbinder
        libhidlbase
        libhidltransport
        libbase
        libaudiohal
        android.hardware.soundtrigger-2.0
        android.hardware.audio.common-2.0
        )