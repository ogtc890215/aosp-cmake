project(libwebp)

set(WEBP_ROOT ${ANDROID_ROOT}/external/webp/src)

set(SOURCE_FILES
        ${WEBP_ROOT}/dsp/alpha_processing.c
        ${WEBP_ROOT}/dsp/alpha_processing_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/alpha_processing_neon.c
        ${WEBP_ROOT}/dsp/alpha_processing_sse2.c
        ${WEBP_ROOT}/dsp/alpha_processing_sse41.c
        ${WEBP_ROOT}/dsp/argb.c
        ${WEBP_ROOT}/dsp/argb_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/argb_sse2.c
        ${WEBP_ROOT}/dsp/cost.c
        ${WEBP_ROOT}/dsp/cost_mips32.c
        ${WEBP_ROOT}/dsp/cost_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/cost_sse2.c
        ${WEBP_ROOT}/dsp/cpu.c
        ${WEBP_ROOT}/dsp/enc.c
        ${WEBP_ROOT}/dsp/enc_avx2.c
        ${WEBP_ROOT}/dsp/enc_mips32.c
        ${WEBP_ROOT}/dsp/enc_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/enc_msa.c
        ${WEBP_ROOT}/dsp/enc_neon.c
        ${WEBP_ROOT}/dsp/enc_sse2.c
        ${WEBP_ROOT}/dsp/enc_sse41.c
        ${WEBP_ROOT}/dsp/lossless_enc.c
        ${WEBP_ROOT}/dsp/lossless_enc_mips32.c
        ${WEBP_ROOT}/dsp/lossless_enc_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/lossless_enc_msa.c
        ${WEBP_ROOT}/dsp/lossless_enc_neon.c
        ${WEBP_ROOT}/dsp/lossless_enc_sse2.c
        ${WEBP_ROOT}/dsp/lossless_enc_sse41.c
        ${WEBP_ROOT}/enc/alpha_enc.c
        ${WEBP_ROOT}/enc/analysis_enc.c
        ${WEBP_ROOT}/enc/backward_references_enc.c
        ${WEBP_ROOT}/enc/config_enc.c
        ${WEBP_ROOT}/enc/cost_enc.c
        ${WEBP_ROOT}/enc/delta_palettization_enc.c
        ${WEBP_ROOT}/enc/filter_enc.c
        ${WEBP_ROOT}/enc/frame_enc.c
        ${WEBP_ROOT}/enc/histogram_enc.c
        ${WEBP_ROOT}/enc/iterator_enc.c
        ${WEBP_ROOT}/enc/near_lossless_enc.c
        ${WEBP_ROOT}/enc/picture_csp_enc.c
        ${WEBP_ROOT}/enc/picture_enc.c
        ${WEBP_ROOT}/enc/picture_psnr_enc.c
        ${WEBP_ROOT}/enc/picture_rescale_enc.c
        ${WEBP_ROOT}/enc/picture_tools_enc.c
        ${WEBP_ROOT}/enc/predictor_enc.c
        ${WEBP_ROOT}/enc/quant_enc.c
        ${WEBP_ROOT}/enc/syntax_enc.c
        ${WEBP_ROOT}/enc/token_enc.c
        ${WEBP_ROOT}/enc/tree_enc.c
        ${WEBP_ROOT}/enc/vp8l_enc.c
        ${WEBP_ROOT}/enc/webp_enc.c
        ${WEBP_ROOT}/mux/anim_encode.c
        ${WEBP_ROOT}/mux/muxedit.c
        ${WEBP_ROOT}/mux/muxinternal.c
        ${WEBP_ROOT}/mux/muxread.c
        ${WEBP_ROOT}/utils/bit_reader_utils.c
        ${WEBP_ROOT}/utils/bit_writer_utils.c
        ${WEBP_ROOT}/utils/color_cache_utils.c
        ${WEBP_ROOT}/utils/filters_utils.c
        ${WEBP_ROOT}/utils/huffman_encode_utils.c
        ${WEBP_ROOT}/utils/huffman_utils.c
        ${WEBP_ROOT}/utils/quant_levels_utils.c
        ${WEBP_ROOT}/utils/random_utils.c
        ${WEBP_ROOT}/utils/rescaler_utils.c
        ${WEBP_ROOT}/utils/thread_utils.c
        ${WEBP_ROOT}/utils/utils.c
        )

include_directories(${WEBP_ROOT}/enc)


add_library(libwebp-encode STATIC ${SOURCE_FILES})
target_include_directories(libwebp-encode PUBLIC
        ${ANDROID_ROOT}/external/webp/include
        )
target_compile_definitions(libwebp-encode PRIVATE
        -DANDROID
        -DWEBP_SWAP_16BIT_CSP
        )
target_compile_options(libwebp-encode PRIVATE
        -O2
        )


set(SOURCE_FILES
        ${WEBP_ROOT}/dec/alpha_dec.c
        ${WEBP_ROOT}/dec/buffer_dec.c
        ${WEBP_ROOT}/dec/frame_dec.c
        ${WEBP_ROOT}/dec/idec_dec.c
        ${WEBP_ROOT}/dec/io_dec.c
        ${WEBP_ROOT}/dec/quant_dec.c
        ${WEBP_ROOT}/dec/tree_dec.c
        ${WEBP_ROOT}/dec/vp8_dec.c
        ${WEBP_ROOT}/dec/vp8l_dec.c
        ${WEBP_ROOT}/dec/webp_dec.c
        ${WEBP_ROOT}/demux/demux.c
        ${WEBP_ROOT}/dsp/alpha_processing.c
        ${WEBP_ROOT}/dsp/alpha_processing_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/alpha_processing_sse2.c
        ${WEBP_ROOT}/dsp/alpha_processing_sse41.c
        ${WEBP_ROOT}/dsp/cpu.c
        ${WEBP_ROOT}/dsp/dec.c
        ${WEBP_ROOT}/dsp/dec_clip_tables.c
        ${WEBP_ROOT}/dsp/dec_mips32.c
        ${WEBP_ROOT}/dsp/dec_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/dec_msa.c
        ${WEBP_ROOT}/dsp/dec_neon.c
        ${WEBP_ROOT}/dsp/dec_sse2.c
        ${WEBP_ROOT}/dsp/dec_sse41.c
        ${WEBP_ROOT}/dsp/filters.c
        ${WEBP_ROOT}/dsp/filters_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/filters_msa.c
        ${WEBP_ROOT}/dsp/filters_neon.c
        ${WEBP_ROOT}/dsp/filters_sse2.c
        ${WEBP_ROOT}/dsp/lossless.c
        ${WEBP_ROOT}/dsp/lossless_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/lossless_msa.c
        ${WEBP_ROOT}/dsp/lossless_neon.c
        ${WEBP_ROOT}/dsp/lossless_sse2.c
        ${WEBP_ROOT}/dsp/rescaler.c
        ${WEBP_ROOT}/dsp/rescaler_mips32.c
        ${WEBP_ROOT}/dsp/rescaler_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/rescaler_msa.c
        ${WEBP_ROOT}/dsp/rescaler_neon.c
        ${WEBP_ROOT}/dsp/rescaler_sse2.c
        ${WEBP_ROOT}/dsp/upsampling.c
        ${WEBP_ROOT}/dsp/upsampling_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/upsampling_msa.c
        ${WEBP_ROOT}/dsp/upsampling_neon.c
        ${WEBP_ROOT}/dsp/upsampling_sse2.c
        ${WEBP_ROOT}/dsp/yuv.c
        ${WEBP_ROOT}/dsp/yuv_mips32.c
        ${WEBP_ROOT}/dsp/yuv_mips_dsp_r2.c
        ${WEBP_ROOT}/dsp/yuv_sse2.c
        ${WEBP_ROOT}/utils/bit_reader_utils.c
        ${WEBP_ROOT}/utils/color_cache_utils.c
        ${WEBP_ROOT}/utils/filters_utils.c
        ${WEBP_ROOT}/utils/huffman_utils.c
        ${WEBP_ROOT}/utils/quant_levels_dec_utils.c
        ${WEBP_ROOT}/utils/random_utils.c
        ${WEBP_ROOT}/utils/rescaler_utils.c
        ${WEBP_ROOT}/utils/thread_utils.c
        ${WEBP_ROOT}/utils/utils.c
        )

include_directories(${WEBP_ROOT}/dec)

add_library(libwebp-decode STATIC ${SOURCE_FILES})
target_include_directories(libwebp-decode PUBLIC
        ${ANDROID_ROOT}/external/webp/include
        )
target_compile_definitions(libwebp-decode PRIVATE
        -DANDROID
        -DWEBP_SWAP_16BIT_CSP
        )
target_compile_options(libwebp-decode PRIVATE
        -O2
        )