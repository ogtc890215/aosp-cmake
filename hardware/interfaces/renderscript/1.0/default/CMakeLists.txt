project(android.hardware.renderscript@1.0-impl)

set(ANDROID_HARDWARE_RENDERSCRIPT_1_0_DEFAULT_ROOT ${ANDROID_ROOT}/hardware/interfaces/renderscript/1.0/default)

set(SOURCE_FILES
        ${ANDROID_HARDWARE_RENDERSCRIPT_1_0_DEFAULT_ROOT}/Context.cpp
        ${ANDROID_HARDWARE_RENDERSCRIPT_1_0_DEFAULT_ROOT}/Device.cpp
        )

include_directories(${ANDROID_HARDWARE_RENDERSCRIPT_1_0_DEFAULT_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/rs)

add_library(android.hardware.renderscript-1.0-impl SHARED ${SOURCE_FILES})
target_link_libraries(android.hardware.renderscript-1.0-impl
        liblog
        libhidlbase
        libhidltransport
        libutils
        android.hardware.renderscript-1.0
        )