#project(libyuv)

set(YUV_ROOT ${ANDROID_ROOT}/external/libyuv/files)

set(SOURCE_FILES
        ${YUV_ROOT}/source/compare.cc
        ${YUV_ROOT}/source/compare_common.cc
        ${YUV_ROOT}/source/compare_gcc.cc
        ${YUV_ROOT}/source/compare_neon.cc
        ${YUV_ROOT}/source/compare_neon64.cc
        ${YUV_ROOT}/source/convert.cc
        ${YUV_ROOT}/source/convert_argb.cc
        ${YUV_ROOT}/source/convert_from.cc
        ${YUV_ROOT}/source/convert_from_argb.cc
        ${YUV_ROOT}/source/convert_to_argb.cc
        ${YUV_ROOT}/source/convert_to_i420.cc
        ${YUV_ROOT}/source/cpu_id.cc
        ${YUV_ROOT}/source/planar_functions.cc
        ${YUV_ROOT}/source/rotate.cc
        ${YUV_ROOT}/source/rotate_any.cc
        ${YUV_ROOT}/source/rotate_argb.cc
        ${YUV_ROOT}/source/rotate_common.cc
        ${YUV_ROOT}/source/rotate_dspr2.cc
        ${YUV_ROOT}/source/rotate_gcc.cc
        ${YUV_ROOT}/source/rotate_msa.cc
        ${YUV_ROOT}/source/rotate_neon.cc
        ${YUV_ROOT}/source/rotate_neon64.cc
        ${YUV_ROOT}/source/row_any.cc
        ${YUV_ROOT}/source/row_common.cc
        ${YUV_ROOT}/source/row_dspr2.cc
        ${YUV_ROOT}/source/row_gcc.cc
        ${YUV_ROOT}/source/row_msa.cc
        ${YUV_ROOT}/source/row_neon.cc
        ${YUV_ROOT}/source/row_neon64.cc
        ${YUV_ROOT}/source/scale.cc
        ${YUV_ROOT}/source/scale_any.cc
        ${YUV_ROOT}/source/scale_argb.cc
        ${YUV_ROOT}/source/scale_common.cc
        ${YUV_ROOT}/source/scale_dspr2.cc
        ${YUV_ROOT}/source/scale_gcc.cc
        ${YUV_ROOT}/source/scale_msa.cc
        ${YUV_ROOT}/source/scale_neon.cc
        ${YUV_ROOT}/source/scale_neon64.cc
        ${YUV_ROOT}/source/video_common.cc

        ${YUV_ROOT}/source/convert_jpeg.cc
        ${YUV_ROOT}/source/mjpeg_decoder.cc
        ${YUV_ROOT}/source/mjpeg_validate.cc
        )

add_library(libyuv_static STATIC ${SOURCE_FILES})
target_include_directories(libyuv_static PUBLIC
        ${YUV_ROOT}/include
        )
target_compile_definitions(libyuv_static PRIVATE
        -DHAVE_JPEG
        )
target_compile_options(libyuv_static PRIVATE
        -Wall
        -Wno-unused-parameter
        -fexceptions
        )
target_link_libraries(libyuv_static
        libjpeg
        )

