project(libtinyalsa)

set(TINYALSA_ROOT ${ANDROID_ROOT}/external/tinyalsa)

set(SOURCE_FILES
        ${TINYALSA_ROOT}/mixer.c
        ${TINYALSA_ROOT}/pcm.c
        )


add_library(libtinyalsa SHARED ${SOURCE_FILES})
target_include_directories(libtinyalsa PUBLIC
        ${TINYALSA_ROOT}/include
        )
target_compile_options(libtinyalsa PRIVATE
        -Werror
        -Wno-macro-redefined
        )