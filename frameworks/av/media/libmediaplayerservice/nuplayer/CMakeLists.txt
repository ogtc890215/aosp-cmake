project(libstagefright_nuplayer)

set(STAGEFRIGHT_NUPLAYER_ROOT ${ANDROID_ROOT}/frameworks/av/media/libmediaplayerservice/nuplayer)

set(SOURCE_FILES
        ${STAGEFRIGHT_NUPLAYER_ROOT}/GenericSource.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/HTTPLiveSource.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/NuPlayer.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/NuPlayerCCDecoder.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/NuPlayerDecoder.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/NuPlayerDecoderBase.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/NuPlayerDecoderPassThrough.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/NuPlayerDriver.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/NuPlayerDrm.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/NuPlayerRenderer.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/NuPlayerStreamListener.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/RTSPSource.cpp
        ${STAGEFRIGHT_NUPLAYER_ROOT}/StreamingSource.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)

add_library(libstagefright_nuplayer STATIC ${SOURCE_FILES})
target_include_directories(libstagefright_nuplayer PUBLIC
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/httplive
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/include
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/mpeg2ts
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/rtsp
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/timedtext
        ${ANDROID_ROOT}/frameworks/av/media/libmediaplayerservice
        ${ANDROID_ROOT}/frameworks/native/include/media/openmax
        )
target_compile_definitions(libstagefright_nuplayer PRIVATE
        -DENABLE_STAGEFRIGHT_EXPERIMENTS
        )
target_compile_options(libstagefright_nuplayer PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(libstagefright_nuplayer
        libbinder
        libui
        libgui
        libmedia
        libmediadrm
        )