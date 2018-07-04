project(libstagefright_http_support)

set(STAGEFRIGHT_HTTP_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/http)

include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright)
include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)
include_directories(${ANDROID_ROOT}/frameworks/base/core/jni)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_library(libstagefright_http_support SHARED ${STAGEFRIGHT_HTTP_ROOT}/HTTPHelper.cpp)
target_include_directories(libstagefright_http_support PUBLIC
        ${STAGEFRIGHT_HTTP_ROOT}
        )
target_compile_options(libstagefright_http_support PRIVATE
        -Wno-multichar
        -Werror
        -Wall
        -fsanitize=signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_http_support
        liblog
        libutils
        libbinder
        libandroid_runtime
        libmedia
        )