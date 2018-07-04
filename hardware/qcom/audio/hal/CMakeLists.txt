project(libqcomaudiohal)

set(QCOM_AUDIO_HAL_ROOT ${ANDROID_ROOT}/hardware/qcom/audio/hal)

set(SOURCE_FILES
        ${QCOM_AUDIO_HAL_ROOT}/audio_hw.c
        ${QCOM_AUDIO_HAL_ROOT}/voice.c
        ${QCOM_AUDIO_HAL_ROOT}/platform_info.c
        ${QCOM_AUDIO_HAL_ROOT}/audio_extn/ext_speaker.c
        ${QCOM_AUDIO_HAL_ROOT}/audio_extn/audio_extn.c
        ${QCOM_AUDIO_HAL_ROOT}/audio_extn/utils.c
        ${QCOM_AUDIO_HAL_ROOT}/msm8974/platform.c
        ${QCOM_AUDIO_HAL_ROOT}/msm8974/hw_info.c
        ${QCOM_AUDIO_HAL_ROOT}/acdb.c
        ${QCOM_AUDIO_HAL_ROOT}/audio_extn/hwdep_cal.c
        )

include_directories(${QCOM_AUDIO_HAL_ROOT})
include_directories(${QCOM_AUDIO_HAL_ROOT}/msm8974)
include_directories(${QCOM_AUDIO_HAL_ROOT}/audio_extn)
include_directories(${QCOM_AUDIO_HAL_ROOT}/voice_extn)
include_directories(${ANDROID_ROOT}/system/media/audio/include)
include_directories(${ANDROID_ROOT}/hardware/libhardware/include)
include_directories(${ANDROID_ROOT}/system/media/audio_effects/include)
include_directories(${ANDROID_ROOT}/system/media/audio_route/include)
include_directories(${ANDROID_ROOT}/kernel/msm/include/uapi)

add_library(libaudio-primary SHARED ${SOURCE_FILES})
target_compile_definitions(libaudio-primary PRIVATE
        -DPLATFORM_MSM8998
        -DMAX_TARGET_SPECIFIC_CHANNEL_CNT=\"4\"
        -DKPI_OPTIMIZE_ENABLED
        -DHW_VARIANTS_ENABLED
        -DHWDEP_CAL_ENABLED
        )
target_compile_options(libaudio-primary PRIVATE
        -Werror
        )
target_link_libraries(libaudio-primary
        libaudioutils
        liblog
        libcutils
        libtinyalsa
        libtinycompress
        libaudioroute
        libexpat
        )