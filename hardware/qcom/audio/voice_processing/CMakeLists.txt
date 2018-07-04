project(libqcomvoiceprocessing)

set(QCOM_VOICEPROCESSING_ROOT ${ANDROID_ROOT}/hardware/qcom/audio/voice_processing)

set(SOURCE_FILES
        ${QCOM_VOICEPROCESSING_ROOT}/voice_processing.c
        )

include_directories(${ANDROID_ROOT}/system/media/audio_effects/include)
include_directories(${ANDROID_ROOT}/system/media/audio/include)
include_directories(${ANDROID_ROOT}/hardware/libhardware/include)

add_library(libqcomvoiceprocessing SHARED ${SOURCE_FILES})
target_compile_options(libqcomvoiceprocessing PRIVATE
        -fvisibility=hidden
        )
target_link_libraries(libqcomvoiceprocessing
        liblog
        libcutils
        )
