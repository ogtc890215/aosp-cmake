project(libstagefright_httplive)

set(STAGEFRIGHT_HTTPLIVE_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/httplive)

set(SOURCE_FILES
        ${STAGEFRIGHT_HTTPLIVE_ROOT}/HTTPDownloader.cpp
        ${STAGEFRIGHT_HTTPLIVE_ROOT}/LiveDataSource.cpp
        ${STAGEFRIGHT_HTTPLIVE_ROOT}/LiveSession.cpp
        ${STAGEFRIGHT_HTTPLIVE_ROOT}/M3UParser.cpp
        ${STAGEFRIGHT_HTTPLIVE_ROOT}/PlaylistFetcher.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright)

add_library(libstagefright_httplive SHARED ${SOURCE_FILES})
target_compile_options(libstagefright_httplive PRIVATE
        -Werror
        -Wall
        -fsanitize=signed-integer-overflow,unsigned-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_httplive
        liblog
        libbinder
        libcrypto
        libcutils
        libmedia
        libstagefright
        libstagefright_foundation
        libutils
        )