project(libqcomvisualizer)

set(QCOM_VISUALIZER_ROOT ${ANDROID_ROOT}/hardware/qcom/audio/visualizer)

set(SOURCE_FILES
        ${QCOM_VISUALIZER_ROOT}/offload_visualizer.c
        )

include_directories(${ANDROID_ROOT}/external/tinyalsa/include)
include_directories(${ANDROID_ROOT}/system/media/audio_effects/include)
include_directories(${ANDROID_ROOT}/system/core/libsystem/include)
include_directories(${ANDROID_ROOT}/system/media/audio/include)
include_directories(${ANDROID_ROOT}/hardware/libhardware/include)

add_library(libqcomvisualizer SHARED ${SOURCE_FILES})
target_compile_definitions(libqcomvisualizer PRIVATE
        -DCAPTURE_DEVICE=7
        )
target_compile_options(libqcomvisualizer PRIVATE
        -O2
        -fvisibility=hidden
        )
target_link_libraries(libqcomvisualizer
        libcutils
        liblog
        libtinyalsa
        )