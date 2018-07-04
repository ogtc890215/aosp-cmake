project(libstagefright_webm)

set(STAGEFRIGHT_WEBM_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/webm)

set(SOURCE_FILES
        ${STAGEFRIGHT_WEBM_ROOT}/EbmlUtil.cpp
        ${STAGEFRIGHT_WEBM_ROOT}/WebmElement.cpp
        ${STAGEFRIGHT_WEBM_ROOT}/WebmFrame.cpp
        ${STAGEFRIGHT_WEBM_ROOT}/WebmFrameThread.cpp
        ${STAGEFRIGHT_WEBM_ROOT}/WebmWriter.cpp
        )

include_directories(${STAGEFRIGHT_WEBM_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
#include_directories(${ANDROID_ROOT}/system/core/base/include)


add_library(libstagefright_webm STATIC ${SOURCE_FILES})
target_compile_definitions(libstagefright_webm PRIVATE
        -D__STDINT_LIMITS
        )
target_compile_options(libstagefright_webm PRIVATE
        -Werror
        -Wall
        -fsanitize=signed-integer-overflow,unsigned-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_webm
        libstagefright_foundation
        libutils
        liblog
        )