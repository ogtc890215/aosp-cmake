project(libz)

set(ZLIB_ROOT ${ANDROID_ROOT}/external/zlib)

set(SOURCE_FILES
        ${ZLIB_ROOT}/src/adler32.c
        ${ZLIB_ROOT}/src/compress.c
        ${ZLIB_ROOT}/src/crc32.c
        ${ZLIB_ROOT}/src/deflate.c
        ${ZLIB_ROOT}/src/gzclose.c
        ${ZLIB_ROOT}/src/gzlib.c
        ${ZLIB_ROOT}/src/gzread.c
        ${ZLIB_ROOT}/src/gzwrite.c
        ${ZLIB_ROOT}/src/infback.c
        ${ZLIB_ROOT}/src/inflate.c
        ${ZLIB_ROOT}/src/inftrees.c
        ${ZLIB_ROOT}/src/inffast.c
        ${ZLIB_ROOT}/src/trees.c
        ${ZLIB_ROOT}/src/uncompr.c
        ${ZLIB_ROOT}/src/zutil.c
        )


add_library(libz SHARED ${SOURCE_FILES})
target_include_directories(libz PUBLIC
        ${ZLIB_ROOT}
        )
target_compile_definitions(libz PRIVATE
        -DUSE_MMAP
        -DZLIB_CONST
        )
target_compile_options(libz PRIVATE
        -O3
        )