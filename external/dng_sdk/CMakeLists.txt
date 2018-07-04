project(libdng_sdk)

set(DNG_SDK_ROOT ${ANDROID_ROOT}/external/dng_sdk)

set(SOURCE_FILES
        ${DNG_SDK_ROOT}/source/dng_1d_function.cpp
        ${DNG_SDK_ROOT}/source/dng_1d_table.cpp
        ${DNG_SDK_ROOT}/source/dng_abort_sniffer.cpp
        ${DNG_SDK_ROOT}/source/dng_area_task.cpp
        ${DNG_SDK_ROOT}/source/dng_bad_pixels.cpp
        ${DNG_SDK_ROOT}/source/dng_bottlenecks.cpp
        ${DNG_SDK_ROOT}/source/dng_camera_profile.cpp
        ${DNG_SDK_ROOT}/source/dng_color_space.cpp
        ${DNG_SDK_ROOT}/source/dng_color_spec.cpp
        ${DNG_SDK_ROOT}/source/dng_date_time.cpp
        ${DNG_SDK_ROOT}/source/dng_exceptions.cpp
        ${DNG_SDK_ROOT}/source/dng_exif.cpp
        ${DNG_SDK_ROOT}/source/dng_file_stream.cpp
        ${DNG_SDK_ROOT}/source/dng_filter_task.cpp
        ${DNG_SDK_ROOT}/source/dng_fingerprint.cpp
        ${DNG_SDK_ROOT}/source/dng_gain_map.cpp
        ${DNG_SDK_ROOT}/source/dng_globals.cpp
        ${DNG_SDK_ROOT}/source/dng_host.cpp
        ${DNG_SDK_ROOT}/source/dng_hue_sat_map.cpp
        ${DNG_SDK_ROOT}/source/dng_ifd.cpp
        ${DNG_SDK_ROOT}/source/dng_image.cpp
        ${DNG_SDK_ROOT}/source/dng_image_writer.cpp
        ${DNG_SDK_ROOT}/source/dng_info.cpp
        ${DNG_SDK_ROOT}/source/dng_iptc.cpp
        ${DNG_SDK_ROOT}/source/dng_jpeg_image.cpp
        ${DNG_SDK_ROOT}/source/dng_jpeg_memory_source.cpp
        ${DNG_SDK_ROOT}/source/dng_lens_correction.cpp
        ${DNG_SDK_ROOT}/source/dng_linearization_info.cpp
        ${DNG_SDK_ROOT}/source/dng_lossless_jpeg.cpp
        ${DNG_SDK_ROOT}/source/dng_matrix.cpp
        ${DNG_SDK_ROOT}/source/dng_memory.cpp
        ${DNG_SDK_ROOT}/source/dng_memory_stream.cpp
        ${DNG_SDK_ROOT}/source/dng_misc_opcodes.cpp
        ${DNG_SDK_ROOT}/source/dng_mosaic_info.cpp
        ${DNG_SDK_ROOT}/source/dng_mutex.cpp
        ${DNG_SDK_ROOT}/source/dng_negative.cpp
        ${DNG_SDK_ROOT}/source/dng_opcode_list.cpp
        ${DNG_SDK_ROOT}/source/dng_opcodes.cpp
        ${DNG_SDK_ROOT}/source/dng_orientation.cpp
        ${DNG_SDK_ROOT}/source/dng_parse_utils.cpp
        ${DNG_SDK_ROOT}/source/dng_pixel_buffer.cpp
        ${DNG_SDK_ROOT}/source/dng_point.cpp
        ${DNG_SDK_ROOT}/source/dng_preview.cpp
        ${DNG_SDK_ROOT}/source/dng_pthread.cpp
        ${DNG_SDK_ROOT}/source/dng_rational.cpp
        ${DNG_SDK_ROOT}/source/dng_read_image.cpp
        ${DNG_SDK_ROOT}/source/dng_rect.cpp
        ${DNG_SDK_ROOT}/source/dng_ref_counted_block.cpp
        ${DNG_SDK_ROOT}/source/dng_reference.cpp
        ${DNG_SDK_ROOT}/source/dng_render.cpp
        ${DNG_SDK_ROOT}/source/dng_resample.cpp
        ${DNG_SDK_ROOT}/source/dng_safe_arithmetic.cpp
        ${DNG_SDK_ROOT}/source/dng_shared.cpp
        ${DNG_SDK_ROOT}/source/dng_simple_image.cpp
        ${DNG_SDK_ROOT}/source/dng_spline.cpp
        ${DNG_SDK_ROOT}/source/dng_stream.cpp
        ${DNG_SDK_ROOT}/source/dng_string.cpp
        ${DNG_SDK_ROOT}/source/dng_string_list.cpp
        ${DNG_SDK_ROOT}/source/dng_tag_types.cpp
        ${DNG_SDK_ROOT}/source/dng_temperature.cpp
        ${DNG_SDK_ROOT}/source/dng_tile_iterator.cpp
        ${DNG_SDK_ROOT}/source/dng_tone_curve.cpp
        ${DNG_SDK_ROOT}/source/dng_utils.cpp
        ${DNG_SDK_ROOT}/source/dng_xy_coord.cpp
        ${DNG_SDK_ROOT}/source/dng_xmp.cpp
        )



add_library(libdng_sdk SHARED ${SOURCE_FILES})
target_include_directories(libdng_sdk PUBLIC
        ${DNG_SDK_ROOT}/source
        )
target_compile_definitions(libdng_sdk PRIVATE
        -DUNIX_ENV=1
        -DqDNGBigEndian=0
        -DqDNGThreadSafe=1
        -DqDNGUseLibJPEG=1
        -DqDNGUseXMP=0
        -DqDNGValidateTarget=1
        -DqAndroid=1
        -DqDNGValidate=0
        )
target_compile_options(libdng_sdk PRIVATE
        -frtti
        -fexceptions
        -fsanitize=unsigned-integer-overflow,signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        -Wsign-compare
        -Wno-reorder
        -Wframe-larger-than=20000
        -Wno-unused-parameter
        -Wno-ignored-qualifiers
        )
target_link_libraries(libdng_sdk
        libz
        libjpeg

        ${INTERMEDIATES_ROOT}/bionic/libc/crtbegin_so/android_arm64_armv8-a_cortex-a53_core/crtbegin_so.o
        )