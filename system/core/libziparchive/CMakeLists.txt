project(libziparchive)

set(ZIPARCHIVE_ROOT ${ANDROID_ROOT}/system/core/libziparchive)

set(SOURCE_FILES
        ${ZIPARCHIVE_ROOT}/zip_archive.cc
        ${ZIPARCHIVE_ROOT}/zip_archive_stream_entry.cc
        ${ZIPARCHIVE_ROOT}/zip_writer.cc
        )


add_library(libziparchive SHARED ${SOURCE_FILES})
target_include_directories(libziparchive PUBLIC
        ${ZIPARCHIVE_ROOT}/include
        )
target_compile_definitions(libziparchive PRIVATE
        -DZLIB_CONST
        -D_FILE_OFFSET_BITS=64
        )
target_compile_options(libziparchive PRIVATE
        -Werror
        -Wall
        -Wold-style-cast
        -Wno-missing-field-initializers
        )
target_link_libraries(libziparchive
        libbase
        liblog
        libz
        libutils
        )
