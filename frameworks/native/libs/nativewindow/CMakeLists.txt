project(libnativewindow)

set(NATIVEWINDOW_ROOT ${ANDROID_ROOT}/frameworks/native/libs/nativewindow)

set(SOURCE_FILES
        ${NATIVEWINDOW_ROOT}/AHardwareBuffer.cpp
        ${NATIVEWINDOW_ROOT}/ANativeWindow.cpp
        )


add_library(libnativewindow SHARED ${SOURCE_FILES})
target_include_directories(libnativewindow PUBLIC
        ${NATIVEWINDOW_ROOT}/include
        ${ANDROID_ROOT}/frameworks/native/libs/nativebase/include
        ${ANDROID_ROOT}/frameworks/native/libs/arect/include
        )
target_compile_options(libnativewindow PRIVATE
        -std=c++1z
        )
target_link_libraries(libnativewindow
        libhardware
        libcutils
        liblog
        libutils
        libui
        libgrallocusage

        android.hardware.graphics.common-1.0
        )