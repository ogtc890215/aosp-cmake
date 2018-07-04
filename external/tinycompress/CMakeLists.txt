project(tinycompress)

set(TINYCOMPRESS_ROOT ${ANDROID_ROOT}/external/tinycompress)

set(SOURCE_FILES
        ${TINYCOMPRESS_ROOT}/compress.c
        ${TINYCOMPRESS_ROOT}/utils.c
        )


add_library(libtinycompress SHARED ${SOURCE_FILES})
target_include_directories(libtinycompress PUBLIC
        ${TINYCOMPRESS_ROOT}/include
        )
target_compile_options(libtinycompress PRIVATE
        -Wno-macro-redefined
        )
target_link_libraries(libtinycompress
        libcutils
        libutils
        )