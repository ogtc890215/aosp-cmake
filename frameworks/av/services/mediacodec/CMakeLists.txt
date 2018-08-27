project(mediacodecservice)

set(MEDIACODECSERVICE_ROOT ${ANDROID_ROOT}/frameworks/av/services/mediacodec)

set(SOURCE_FILES
        ${MEDIACODECSERVICE_ROOT}/MediaCodecService.cpp)

include_directories(${MEDIACODECSERVICE_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_library(libmediacodecservice SHARED ${SOURCE_FILES})
target_link_libraries(libmediacodecservice
        libmedia_omx
        libbinder
        libgui
        libutils
        liblog
        libstagefright_omx
        libstagefright_xmlparser
        )


set(SOURCE_FILES
        ${MEDIACODECSERVICE_ROOT}/main_codecservice.cpp)

add_executable(android.hardware.media.omx-1.0-service ${SOURCE_FILES})
target_link_libraries(android.hardware.media.omx-1.0-service
        libmedia_omx
        libmediacodecservice
        libbinder
        libutils
        libgui
        liblog
        libbase
        libavservices_minijail
        libcutils
        libhwbinder
        libhidltransport
        libstagefright_omx
        libstagefright_xmlparser
        android.hardware.media.omx-1.0
        android.hidl.memory-1.0
        )