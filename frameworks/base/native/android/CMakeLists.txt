project(libandroid)

set(NATIVE_ANDROID_ROOT ${ANDROID_ROOT}/frameworks/base/native/android)

set(SOURCE_FILES
        ${NATIVE_ANDROID_ROOT}/asset_manager.cpp
        ${NATIVE_ANDROID_ROOT}/choreographer.cpp
        ${NATIVE_ANDROID_ROOT}/configuration.cpp
        ${NATIVE_ANDROID_ROOT}/hardware_buffer_jni.cpp
        ${NATIVE_ANDROID_ROOT}/input.cpp
        ${NATIVE_ANDROID_ROOT}/looper.cpp
        ${NATIVE_ANDROID_ROOT}/native_activity.cpp
        ${NATIVE_ANDROID_ROOT}/native_window_jni.cpp
        ${NATIVE_ANDROID_ROOT}/net.c
        ${NATIVE_ANDROID_ROOT}/obb.cpp
        ${NATIVE_ANDROID_ROOT}/sensor.cpp
        ${NATIVE_ANDROID_ROOT}/sharedmem.cpp
        ${NATIVE_ANDROID_ROOT}/storage_manager.cpp
        ${NATIVE_ANDROID_ROOT}/trace.cpp
        )

include_directories(${ANDROID_ROOT}/bionic/libc/dns/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libandroid SHARED ${SOURCE_FILES})
target_include_directories(libandroid PUBLIC
        ${ANDROID_ROOT}/frameworks/native/libs/arect/include
        )
target_compile_options(libandroid PRIVATE
        -Wall
        -Werror
        -Wunused
        -Wunreachable-code
        )
target_link_libraries(libandroid
        liblog
        libcutils
        libandroidfw
        libinput
        libutils
        libbinder
        libui
        libgui
        libsensor
        libandroid_runtime
        libnetd_client
        libnativewindow
        libstorage
        )