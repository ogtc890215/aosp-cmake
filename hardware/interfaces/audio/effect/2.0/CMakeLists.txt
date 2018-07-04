project(android.hardware.audio.effect@2.0)

set(ANDROID_HARDWARE_AUDIO_EFFECT_2_0_ROOT ${ANDROID_ROOT}/hardware/interfaces/audio/effect/2.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/AcousticEchoCancelerEffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/AutomaticGainControlEffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/BassBoostEffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/DownmixEffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/EffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/EffectBufferProviderCallbackAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/EffectsFactoryAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/EnvironmentalReverbEffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/EqualizerEffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/LoudnessEnhancerEffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/NoiseSuppressionEffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/PresetReverbEffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/VirtualizerEffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/VisualizerEffectAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++/gen/android/hardware/audio/effect/2.0/types.cpp
        )

add_library(android.hardware.audio.effect-2.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.audio.effect-2.0 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0_genc++_headers/gen
        )
target_compile_options(android.hardware.audio.effect-2.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.audio.effect-2.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils
        android.hardware.audio.common-2.0
        )