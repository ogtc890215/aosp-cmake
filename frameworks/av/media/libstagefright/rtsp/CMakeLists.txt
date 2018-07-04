project(libstagefright_rtsp)

set(STAGEFRIGHT_RTSP_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/rtsp)

set(SOURCE_FILES
        ${STAGEFRIGHT_RTSP_ROOT}/AAMRAssembler.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/AAVCAssembler.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/AH263Assembler.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/AMPEG2TSAssembler.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/AMPEG4AudioAssembler.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/AMPEG4ElementaryAssembler.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/APacketSource.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/ARawAudioAssembler.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/ARTPAssembler.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/ARTPConnection.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/ARTPSource.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/ARTPWriter.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/ARTSPConnection.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/ASessionDescription.cpp
        ${STAGEFRIGHT_RTSP_ROOT}/SDPLoader.cpp
        )

include_directories(${STAGEFRIGHT_RTSP_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright)
include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)

add_library(libstagefright_rtsp STATIC ${SOURCE_FILES})
target_compile_options(libstagefright_rtsp PRIVATE
        -Werror
        -Wall
        -fsanitize=signed-integer-overflow,unsigned-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_rtsp
        libcrypto
        libmedia
        )