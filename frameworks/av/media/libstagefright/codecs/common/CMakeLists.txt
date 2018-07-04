project(libstagefright_enc_common)

set(STAGEFRIGHT_ENCCOMMON_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/codecs/common)


add_library(libstagefright_enc_common SHARED ${STAGEFRIGHT_ENCCOMMON_ROOT}/cmnMemory.c)
target_include_directories(libstagefright_enc_common PUBLIC
        ${STAGEFRIGHT_ENCCOMMON_ROOT}/include
        )
target_compile_options(libstagefright_enc_common PRIVATE
        -Werror
        )