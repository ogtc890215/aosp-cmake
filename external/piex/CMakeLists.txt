project(libpiex)

set(PIEX_ROOT ${ANDROID_ROOT}/external/piex)

set(SOURCE_FILES
        ${PIEX_ROOT}/src/binary_parse/cached_paged_byte_array.cc
        ${PIEX_ROOT}/src/binary_parse/range_checked_byte_ptr.cc

        ${PIEX_ROOT}/src/image_type_recognition/image_type_recognition_lite.cc

        ${PIEX_ROOT}/src/tiff_directory/tiff_directory.cc

        ${PIEX_ROOT}/src/tiff_parser.cc
        ${PIEX_ROOT}/src/piex.cc
        )


add_library(libpiex SHARED ${SOURCE_FILES})
target_include_directories(libpiex PUBLIC
        ${PIEX_ROOT}
        )
target_compile_options(libpiex PRIVATE
        -Wsign-compare
        )