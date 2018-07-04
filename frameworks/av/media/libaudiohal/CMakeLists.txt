project(libaudiohal)

set(AUDIOHAL_ROOT ${ANDROID_ROOT}/frameworks/av/media/libaudiohal)

set(SOURCE_FILES
        ${AUDIOHAL_ROOT}/DeviceHalLocal.cpp
        ${AUDIOHAL_ROOT}/DevicesFactoryHalHybrid.cpp
        ${AUDIOHAL_ROOT}/DevicesFactoryHalLocal.cpp
        ${AUDIOHAL_ROOT}/StreamHalLocal.cpp
        ${AUDIOHAL_ROOT}/ConversionHelperHidl.cpp
        ${AUDIOHAL_ROOT}/HalDeathHandlerHidl.cpp
        ${AUDIOHAL_ROOT}/DeviceHalHidl.cpp
        ${AUDIOHAL_ROOT}/DevicesFactoryHalHidl.cpp
        ${AUDIOHAL_ROOT}/EffectBufferHalHidl.cpp
        ${AUDIOHAL_ROOT}/EffectHalHidl.cpp
        ${AUDIOHAL_ROOT}/EffectsFactoryHalHidl.cpp
        ${AUDIOHAL_ROOT}/StreamHalHidl.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_library(libaudiohal SHARED ${SOURCE_FILES})
target_include_directories(libaudiohal PUBLIC
        ${AUDIOHAL_ROOT}/include
        )
target_compile_options(libaudiohal PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libaudiohal
        libaudioutils
        libcutils
        liblog
        libutils
        libhardware
        libbase
        libfmq
        libhwbinder
        libhidlbase
        libhidlmemory
        libhidltransport
        android.hardware.audio-2.0
        android.hardware.audio.common-2.0
        android.hardware.audio.common-2.0-util
        android.hardware.audio.effect-2.0
        android.hidl.allocator-1.0
        android.hidl.memory-1.0
        libmedia_helper
        libmediautils
        )