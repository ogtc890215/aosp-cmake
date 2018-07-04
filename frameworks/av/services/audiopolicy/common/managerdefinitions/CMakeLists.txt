project(libaudiopolicycomponents)

set(AUDIOPOLICYCOMPONENTS_ROOT ${ANDROID_ROOT}/frameworks/av/services/audiopolicy/common/managerdefinitions)

set(SOURCE_FILES
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/DeviceDescriptor.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/AudioGain.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/HwModule.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/IOProfile.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/AudioPort.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/AudioProfile.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/AudioRoute.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/AudioPolicyMix.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/AudioPatch.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/AudioInputDescriptor.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/AudioOutputDescriptor.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/AudioCollections.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/EffectDescriptor.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/SoundTriggerSession.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/SessionRoute.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/AudioSourceDescriptor.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/VolumeCurve.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/TypeConverter.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/AudioSession.cpp
        ${AUDIOPOLICYCOMPONENTS_ROOT}/src/Serializer.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audiopolicy/common/include)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audiopolicy)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audiopolicy/utilities)

add_library(libaudiopolicycomponents STATIC ${SOURCE_FILES})
target_include_directories(libaudiopolicycomponents PUBLIC
        ${AUDIOPOLICYCOMPONENTS_ROOT}/include
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
target_compile_options(libaudiopolicycomponents PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libaudiopolicycomponents
        libcutils
        libmedia
        libutils
        liblog
        libicuuc
        libxml2
        )