project(libaudioutils)

set(AUDIO_UTILS_ROOT ${ANDROID_ROOT}/system/media/audio_utils)

set(SOURCE_FILES
        ${AUDIO_UTILS_ROOT}/channels.c
        ${AUDIO_UTILS_ROOT}/ErrorLog.cpp
        ${AUDIO_UTILS_ROOT}/fifo.cpp
        ${AUDIO_UTILS_ROOT}/fifo_index.cpp
        ${AUDIO_UTILS_ROOT}/fifo_writer32.cpp
        ${AUDIO_UTILS_ROOT}/format.c
        ${AUDIO_UTILS_ROOT}/limiter.c
        ${AUDIO_UTILS_ROOT}/minifloat.c
        ${AUDIO_UTILS_ROOT}/power.cpp
        ${AUDIO_UTILS_ROOT}/PowerLog.cpp
        ${AUDIO_UTILS_ROOT}/primitives.c
        ${AUDIO_UTILS_ROOT}/roundup.c

        ${AUDIO_UTILS_ROOT}/mono_blend.cpp
        ${AUDIO_UTILS_ROOT}/resampler.c
        ${AUDIO_UTILS_ROOT}/echo_reference.c

        ${AUDIO_UTILS_ROOT}/fixedfft.cpp
        )


add_library(libaudioutils SHARED ${SOURCE_FILES})
target_include_directories(libaudioutils PUBLIC
        ${AUDIO_UTILS_ROOT}/include
        ${ANDROID_ROOT}/system/media/audio/include
        )
target_link_libraries(libaudioutils
        libcutils
        liblog
        libspeexresampler
        )


set(SOURCE_FILES
        ${AUDIO_UTILS_ROOT}/spdif/BitFieldParser.cpp
        ${AUDIO_UTILS_ROOT}/spdif/FrameScanner.cpp
        ${AUDIO_UTILS_ROOT}/spdif/AC3FrameScanner.cpp
        ${AUDIO_UTILS_ROOT}/spdif/DTSFrameScanner.cpp
        ${AUDIO_UTILS_ROOT}/spdif/SPDIFEncoder.cpp
        )

include_directories(${ANDROID_ROOT}/system/media/audio/include)

add_library(libaudiospdif SHARED ${SOURCE_FILES})
target_include_directories(libaudiospdif PUBLIC
        ${AUDIO_UTILS_ROOT}/include
        )
target_compile_options(libaudiospdif PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(libaudiospdif PRIVATE
        libcutils
        liblog
        )