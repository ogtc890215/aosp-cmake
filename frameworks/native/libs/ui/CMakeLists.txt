project(libui)

set(UI_ROOT ${ANDROID_ROOT}/frameworks/native/libs/ui)

set(SOURCE_FILES
        ${UI_ROOT}/ColorSpace.cpp
        ${UI_ROOT}/DebugUtils.cpp
        ${UI_ROOT}/Fence.cpp
        ${UI_ROOT}/FenceTime.cpp
        ${UI_ROOT}/FrameStats.cpp
        ${UI_ROOT}/Gralloc2.cpp
        ${UI_ROOT}/GraphicBuffer.cpp
        ${UI_ROOT}/GraphicBufferAllocator.cpp
        ${UI_ROOT}/GraphicBufferMapper.cpp
        ${UI_ROOT}/HdrCapabilities.cpp
        ${UI_ROOT}/PixelFormat.cpp
        ${UI_ROOT}/Rect.cpp
        ${UI_ROOT}/Region.cpp
        ${UI_ROOT}/UiConfig.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libui SHARED ${SOURCE_FILES})
target_include_directories(libui PUBLIC
        ${UI_ROOT}/include
        ${ANDROID_ROOT}/hardware/libhardware/include
        ${ANDROID_ROOT}/frameworks/native/libs/math/include
        ${ANDROID_ROOT}/frameworks/native/libs/nativebase/include
        ${ANDROID_ROOT}/frameworks/native/libs/arect/include
        )
target_compile_options(libui PRIVATE
        -Weverything
        -Werror
        -Wno-exit-time-destructors
        -Wno-global-constructors
        -Wno-c++98-compat-pedantic
        -Wno-float-equal
        -Wno-four-char-constants
        -Wno-padded
        -fsanitize=integer
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libui
        libbase
        libcutils
        libhardware
        libhidlbase
        libhidltransport
        libhwbinder
        libsync
        libutils
        liblog
        libgrallocusage

        android.hardware.graphics.allocator-2.0
        android.hardware.graphics.mapper-2.0
        android.hardware.configstore-1.0
        android.hardware.configstore-utils
        )