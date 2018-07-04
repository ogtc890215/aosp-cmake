project(qcompostproc)

set(QCOM_POST_PROC_ROOT ${ANDROID_ROOT}/hardware/qcom/audio/post_proc)

set(SOURCE_FILES
        ${QCOM_POST_PROC_ROOT}/bundle.c
        ${QCOM_POST_PROC_ROOT}/equalizer.c
        ${QCOM_POST_PROC_ROOT}/bass_boost.c
        ${QCOM_POST_PROC_ROOT}/virtualizer.c
        ${QCOM_POST_PROC_ROOT}/reverb.c
        ${QCOM_POST_PROC_ROOT}/effect_api.c
        )

include_directories(${ANDROID_ROOT}/system/media/audio_effects/include)
include_directories(${ANDROID_ROOT}/system/core/libsystem/include)
include_directories(${ANDROID_ROOT}/system/media/audio/include)
include_directories(${ANDROID_ROOT}/hardware/libhardware/include)

add_library(libqcompostprocbundle SHARED ${SOURCE_FILES})
target_include_directories(libqcompostprocbundle PRIVATE
        ${ANDROID_ROOT}/external/tinyalsa/include
        )
target_compile_options(libqcompostprocbundle PRIVATE
        -O2
        -fvisibility=hidden
        )
target_link_libraries(libqcompostprocbundle
        libcutils
        liblog
        libtinyalsa
        )

set(SOURCE_FILES
        ${QCOM_POST_PROC_ROOT}/volume_listener.c
        )

add_library(libvolumelistener SHARED ${SOURCE_FILES})
target_include_directories(libvolumelistener PRIVATE
        ${ANDROID_ROOT}/hardware/qcom/audio/hal
        )
target_compile_definitions(libvolumelistener PRIVATE
        -DLIB_AUDIO_HAL=\"audio.primary.${TARGET_BOARD_PLATFORM}.so\"
        )
target_compile_options(libvolumelistener PRIVATE
        -O2
        -fvisibility=hidden
        )
target_link_libraries(libvolumelistener
        libcutils
        liblog
        )

