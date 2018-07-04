project(libstagefright_matroska)

set(STAGEFRIGHT_MATROSKA_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/matroska)

include_directories(${STAGEFRIGHT_MATROSKA_ROOT})
include_directories(${ANDROID_ROOT}/external/flac/include)
include_directories(${ANDROID_ROOT}/external/libvpx/libwebm)
include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright/flac/dec)
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright/include)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/system/core/base/include)
include_directories(${ANDROID_ROOT}/system/media/audio/include)


add_library(libstagefright_matroska STATIC ${STAGEFRIGHT_MATROSKA_ROOT}/MatroskaExtractor.cpp)
target_compile_options(libstagefright_matroska PRIVATE
        -Wno-multichar
        -Werror
        -Wall
        -fsanitize=signed-integer-overflow,unsigned-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_matroska
        libmedia
        libstagefright_flacdec
        )