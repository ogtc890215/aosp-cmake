project(libFLAC)

set(FLAC_ROOT ${ANDROID_ROOT}/external/flac/libFLAC)

set(SOURCE_FILES
        ${FLAC_ROOT}/bitmath.c
        ${FLAC_ROOT}/bitreader.c
        ${FLAC_ROOT}/bitwriter.c
        ${FLAC_ROOT}/cpu.c
        ${FLAC_ROOT}/crc.c
        ${FLAC_ROOT}/fixed.c
        ${FLAC_ROOT}/float.c
        ${FLAC_ROOT}/format.c
        ${FLAC_ROOT}/lpc.c
        ${FLAC_ROOT}/memory.c
        ${FLAC_ROOT}/md5.c
        ${FLAC_ROOT}/stream_decoder.c
        ${FLAC_ROOT}/stream_encoder.c
        ${FLAC_ROOT}/stream_encoder_framing.c
        ${FLAC_ROOT}/window.c
        )

include_directories(${FLAC_ROOT}/include)
include_directories(${ANDROID_ROOT}/external/flac)


add_library(libFLAC STATIC ${SOURCE_FILES})
target_include_directories(libFLAC PUBLIC
        ${ANDROID_ROOT}/external/flac/include
        )
target_compile_definitions(libFLAC PRIVATE
        -DHAVE_CONFIG_H
        -DFLAC__NO_MD5
        -DFLAC__INTEGER_ONLY_LIBRARY
        -D_REENTRANT
        -DPIC
        -DU_COMMON_IMPLEMENTATION
        )
target_compile_options(libFLAC PRIVATE
        -fPIC
        -O3
        -funroll-loops
        -finline-functions
        -Werror
        )