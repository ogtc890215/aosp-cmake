project(libstagefright_wfd)

set(STAGEFRIGHT_WFD_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/wifi-display)

set(SOURCE_FILES
        ${STAGEFRIGHT_WFD_ROOT}/MediaSender.cpp
        ${STAGEFRIGHT_WFD_ROOT}/Parameters.cpp
        ${STAGEFRIGHT_WFD_ROOT}/rtp/RTPSender.cpp
        ${STAGEFRIGHT_WFD_ROOT}/source/Converter.cpp
        ${STAGEFRIGHT_WFD_ROOT}/source/MediaPuller.cpp
        ${STAGEFRIGHT_WFD_ROOT}/source/PlaybackSession.cpp
        ${STAGEFRIGHT_WFD_ROOT}/source/RepeaterSource.cpp
        ${STAGEFRIGHT_WFD_ROOT}/source/TSPacketizer.cpp
        ${STAGEFRIGHT_WFD_ROOT}/source/WifiDisplaySource.cpp
        ${STAGEFRIGHT_WFD_ROOT}/VideoFormats.cpp
        )

include_directories(${STAGEFRIGHT_WFD_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright)
include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)
include_directories(${ANDROID_ROOT}/frameworks/native/include/media/hardware)
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright/mpeg2ts)

add_library(libstagefright_wfd SHARED ${SOURCE_FILES})
target_compile_options(libstagefright_wfd PRIVATE
        -Wno-multichar
        -Werror
        -Wall
        -fsanitize=signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_wfd
        libbinder
        libcutils
        liblog
        libmedia
        libstagefright
        libstagefright_foundation
        libui
        libgui
        libutils
        )