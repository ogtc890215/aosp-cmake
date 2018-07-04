project(libstagefright_aacenc)

set(STAGEFRIGHT_AACENC_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/codecs/aacenc)

set(SOURCE_FILES
        ${STAGEFRIGHT_AACENC_ROOT}/basic_op/basicop2.c
        ${STAGEFRIGHT_AACENC_ROOT}/basic_op/oper_32b.c

        ${STAGEFRIGHT_AACENC_ROOT}/AACEncoder.cpp
        ${STAGEFRIGHT_AACENC_ROOT}/src/aac_rom.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/aacenc.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/aacenc_core.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/adj_thr.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/band_nrg.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/bit_cnt.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/bitbuffer.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/bitenc.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/block_switch.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/channel_map.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/dyn_bits.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/grp_data.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/interface.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/line_pe.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/ms_stereo.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/pre_echo_control.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/psy_configuration.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/psy_main.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/qc_main.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/quantize.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/sf_estim.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/spreading.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/stat_bits.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/tns.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/transform.c
        ${STAGEFRIGHT_AACENC_ROOT}/src/memalign.c
        )

include_directories(${STAGEFRIGHT_AACENC_ROOT}/inc)
include_directories(${STAGEFRIGHT_AACENC_ROOT}/src)
include_directories(${STAGEFRIGHT_AACENC_ROOT}/basic_op)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libstagefright_aacenc STATIC ${SOURCE_FILES})
target_compile_options(libstagefright_aacenc PRIVATE
        -Werror
        -fsanitize=signed-integer-overflow,unsigned-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_aacenc
        libbinder
        libstagefright_enc_common
        )