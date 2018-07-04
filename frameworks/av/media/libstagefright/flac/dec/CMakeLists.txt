project(libstagefright_flacdec)

set(STAGEFRIGHT_FLACDEC_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/flac/dec)

include_directories(${STAGEFRIGHT_FLACDEC_ROOT})
include_directories(${ANDROID_ROOT}/external/flac/include)
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright/include)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/system/core/base/include)


add_library(libstagefright_flacdec SHARED ${STAGEFRIGHT_FLACDEC_ROOT}/FLACDecoder.cpp)
target_compile_options(libstagefright_flacdec PRIVATE
        -Werror
        -fsanitize=signed-integer-overflow,unsigned-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_flacdec
        libcutils
        liblog
        libstagefright_foundation
        libutils

        libFLAC
        )