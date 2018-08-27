project(libsparse)

set(SPARSE_ROOT ${ANDROID_ROOT}/system/core/libsparse)

set(SOURCE_FILES
        ${SPARSE_ROOT}/backed_block.c
        ${SPARSE_ROOT}/output_file.c
        ${SPARSE_ROOT}/sparse.c
        ${SPARSE_ROOT}/sparse_crc32.c
        ${SPARSE_ROOT}/sparse_err.c
        ${SPARSE_ROOT}/sparse_read.cpp
        )


add_library(libsparse SHARED ${SOURCE_FILES})
target_include_directories(libsparse PUBLIC
        ${SPARSE_ROOT}/include
        )
target_compile_options(libsparse PRIVATE
        -Werror
        )
target_link_libraries(libsparse
        libz
        libbase
        )