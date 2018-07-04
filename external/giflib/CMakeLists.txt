project(libgif)

set(GIF_ROOT ${ANDROID_ROOT}/external/giflib)

set(SOURCE_FILES
        ${GIF_ROOT}/dgif_lib.c
        ${GIF_ROOT}/egif_lib.c
        ${GIF_ROOT}/gifalloc.c
        ${GIF_ROOT}/gif_err.c
        ${GIF_ROOT}/gif_hash.c
        ${GIF_ROOT}/openbsd-reallocarray.c
        ${GIF_ROOT}/quantize.c
        )


add_library(libgif STATIC ${SOURCE_FILES})
target_include_directories(libgif PUBLIC
        ${GIF_ROOT}
        )
target_compile_definitions(libgif PRIVATE
        -DHAVE_CONFIG_H
        )
target_compile_options(libgif PRIVATE
        -Wno-format
        -Wno-sign-compare
        -Wno-unused-parameter
        )