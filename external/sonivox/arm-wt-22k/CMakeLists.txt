project(libsonivox)

set(SONIVOX_ROOT ${ANDROID_ROOT}/external/sonivox/arm-wt-22k)

set(SOURCE_FILES
        ${SONIVOX_ROOT}/lib_src/eas_chorus.c
        ${SONIVOX_ROOT}/lib_src/eas_chorusdata.c
        ${SONIVOX_ROOT}/lib_src/eas_data.c
        ${SONIVOX_ROOT}/lib_src/eas_dlssynth.c
        ${SONIVOX_ROOT}/lib_src/eas_flog.c
        ${SONIVOX_ROOT}/lib_src/eas_ima_tables.c
        ${SONIVOX_ROOT}/lib_src/eas_imaadpcm.c
        ${SONIVOX_ROOT}/lib_src/eas_imelody.c
        ${SONIVOX_ROOT}/lib_src/eas_imelodydata.c
        ${SONIVOX_ROOT}/lib_src/eas_math.c
        ${SONIVOX_ROOT}/lib_src/eas_mdls.c
        ${SONIVOX_ROOT}/lib_src/eas_midi.c
        ${SONIVOX_ROOT}/lib_src/eas_mididata.c
        ${SONIVOX_ROOT}/lib_src/eas_mixbuf.c
        ${SONIVOX_ROOT}/lib_src/eas_mixer.c
        ${SONIVOX_ROOT}/lib_src/eas_ota.c
        ${SONIVOX_ROOT}/lib_src/eas_otadata.c
        ${SONIVOX_ROOT}/lib_src/eas_pan.c
        ${SONIVOX_ROOT}/lib_src/eas_pcm.c
        ${SONIVOX_ROOT}/lib_src/eas_pcmdata.c
        ${SONIVOX_ROOT}/lib_src/eas_public.c
        ${SONIVOX_ROOT}/lib_src/eas_reverb.c
        ${SONIVOX_ROOT}/lib_src/eas_reverbdata.c
        ${SONIVOX_ROOT}/lib_src/eas_rtttl.c
        ${SONIVOX_ROOT}/lib_src/eas_rtttldata.c
        ${SONIVOX_ROOT}/lib_src/eas_smf.c
        ${SONIVOX_ROOT}/lib_src/eas_smfdata.c
        ${SONIVOX_ROOT}/lib_src/eas_voicemgt.c
        ${SONIVOX_ROOT}/lib_src/eas_wtengine.c
        ${SONIVOX_ROOT}/lib_src/eas_wtsynth.c
        ${SONIVOX_ROOT}/lib_src/eas_xmf.c
        ${SONIVOX_ROOT}/lib_src/eas_xmfdata.c
        ${SONIVOX_ROOT}/lib_src/wt_22khz.c
        ${SONIVOX_ROOT}/lib_src/jet.c
        ${SONIVOX_ROOT}/host_src/eas_config.c
        ${SONIVOX_ROOT}/host_src/eas_hostmm.c
        ${SONIVOX_ROOT}/host_src/eas_report.c
        )

include_directories(${SONIVOX_ROOT}/host_src)
include_directories(${SONIVOX_ROOT}/lib_src)
include_directories(${ANDROID_ROOT}/frameworks/av/include)


add_library(libsonivox SHARED ${SOURCE_FILES})
target_include_directories(libsonivox PUBLIC
        ${SONIVOX_ROOT}/include
        )
target_compile_definitions(libsonivox PRIVATE
        -DUNIFIED_DEBUG_MESSAGES
        -DEAS_WT_SYNTH
        -D_IMELODY_PARSER
        -D_RTTTL_PARSER
        -D_OTA_PARSER
        -D_XMF_PARSER
        -DNUM_OUTPUT_CHANNELS=2
        -D_SAMPLE_RATE_22050
        -DMAX_SYNTH_VOICES=64
        -D_8_BIT_SAMPLES
        -D_FILTER_ENABLED
        -DDLS_SYNTHESIZER
        -D_REVERB_ENABLED
        )
target_compile_options(libsonivox PRIVATE
        -O2
        -Wno-unused-parameter
        -Werror
        )
target_link_libraries(libsonivox
        liblog
        )