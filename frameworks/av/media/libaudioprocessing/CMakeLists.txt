project(libaudioprocessing)

set(AUDIOPROCESSING_ROOT ${ANDROID_ROOT}/frameworks/av/media/libaudioprocessing)

set(SOURCE_FILES
        ${AUDIOPROCESSING_ROOT}/AudioMixer.cpp
        ${AUDIOPROCESSING_ROOT}/AudioResampler.cpp
        ${AUDIOPROCESSING_ROOT}/AudioResamplerCubic.cpp
        ${AUDIOPROCESSING_ROOT}/AudioResamplerSinc.cpp
        ${AUDIOPROCESSING_ROOT}/AudioResamplerDyn.cpp
        ${AUDIOPROCESSING_ROOT}/BufferProviders.cpp
        ${AUDIOPROCESSING_ROOT}/RecordBufferConverter.cpp
        )

include_directories(${ANDROID_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/system/media/audio_utils/include)

add_library(libaudioprocessing SHARED ${SOURCE_FILES})
target_include_directories(libaudioprocessing PUBLIC
        ${AUDIOPROCESSING_ROOT}/include
        )
target_compile_options(libaudioprocessing PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(libaudioprocessing
        libaudiohal
        libaudioutils
        libcutils
        liblog
        libnbaio
        libsonic
        libutils
        )