project(libmediandk)

set(MEDIANDK_ROOT ${ANDROID_ROOT}/frameworks/av/media/ndk)

set(SOURCE_FILES
        ${MEDIANDK_ROOT}/NdkMediaCodec.cpp
        ${MEDIANDK_ROOT}/NdkMediaCrypto.cpp
        ${MEDIANDK_ROOT}/NdkMediaExtractor.cpp
        ${MEDIANDK_ROOT}/NdkMediaFormat.cpp
        ${MEDIANDK_ROOT}/NdkMediaMuxer.cpp
        ${MEDIANDK_ROOT}/NdkMediaDrm.cpp
        ${MEDIANDK_ROOT}/NdkImage.cpp
        ${MEDIANDK_ROOT}/NdkImageReader.cpp
        )

include_directories(${ANDROID_ROOT}/bionic/libc/private)
include_directories(${ANDROID_ROOT}/frameworks/base/core/jni)
include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)
include_directories(${ANDROID_ROOT}/system/media/camera/include)
include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_library(libmediandk SHARED ${SOURCE_FILES})
target_include_directories(libmediandk PUBLIC
        ${MEDIANDK_ROOT}/include
        )
target_compile_definitions(libmediandk PRIVATE
        "-DEXPORT=__attribute__((visibility(\"default\")))"
        )
target_compile_options(libmediandk PRIVATE
        -fvisibility=hidden
        -Werror
        -Wall
        )
target_link_libraries(libmediandk
        libbinder
        libmedia
        libmedia_jni
        libmediadrm
        libskia
        libstagefright
        libstagefright_foundation
        liblog
        libutils
        libcutils
        libandroid
        libandroid_runtime
        libbinder
        libgui
        libui
        )