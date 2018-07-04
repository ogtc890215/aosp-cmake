#project(libjpeg)

set(JPEG_ROOT ${ANDROID_ROOT}/external/libjpeg-turbo)

set(SOURCE_FILES
        ${JPEG_ROOT}/jcapimin.c
        ${JPEG_ROOT}/jcapistd.c
        ${JPEG_ROOT}/jaricom.c
        ${JPEG_ROOT}/jcarith.c
        ${JPEG_ROOT}/jccoefct.c
        ${JPEG_ROOT}/jccolor.c
        ${JPEG_ROOT}/jcdctmgr.c
        ${JPEG_ROOT}/jchuff.c
        ${JPEG_ROOT}/jcinit.c
        ${JPEG_ROOT}/jcmainct.c
        ${JPEG_ROOT}/jcmarker.c
        ${JPEG_ROOT}/jcmaster.c
        ${JPEG_ROOT}/jcomapi.c
        ${JPEG_ROOT}/jcparam.c
        ${JPEG_ROOT}/jcphuff.c
        ${JPEG_ROOT}/jcprepct.c
        ${JPEG_ROOT}/jcsample.c
        ${JPEG_ROOT}/jctrans.c
        ${JPEG_ROOT}/jdapimin.c
        ${JPEG_ROOT}/jdapistd.c
        ${JPEG_ROOT}/jdarith.c
        ${JPEG_ROOT}/jdatadst.c
        ${JPEG_ROOT}/jdatasrc.c
        ${JPEG_ROOT}/jdcoefct.c
        ${JPEG_ROOT}/jdcolor.c
        ${JPEG_ROOT}/jddctmgr.c
        ${JPEG_ROOT}/jdhuff.c
        ${JPEG_ROOT}/jdinput.c
        ${JPEG_ROOT}/jdmainct.c
        ${JPEG_ROOT}/jdmarker.c
        ${JPEG_ROOT}/jdmaster.c
        ${JPEG_ROOT}/jdmerge.c
        ${JPEG_ROOT}/jdphuff.c
        ${JPEG_ROOT}/jdpostct.c
        ${JPEG_ROOT}/jdsample.c
        ${JPEG_ROOT}/jdtrans.c
        ${JPEG_ROOT}/jerror.c
        ${JPEG_ROOT}/jfdctflt.c
        ${JPEG_ROOT}/jfdctfst.c
        ${JPEG_ROOT}/jfdctint.c
        ${JPEG_ROOT}/jidctflt.c
        ${JPEG_ROOT}/jidctfst.c
        ${JPEG_ROOT}/jidctint.c
        ${JPEG_ROOT}/jidctred.c
        ${JPEG_ROOT}/jmemmgr.c
        ${JPEG_ROOT}/jmemnobs.c
        ${JPEG_ROOT}/jquant1.c
        ${JPEG_ROOT}/jquant2.c
        ${JPEG_ROOT}/jutils.c

        ${JPEG_ROOT}/simd/jsimd_arm64_neon.S
        ${JPEG_ROOT}/simd/jsimd_arm64.c
        )

set_property(SOURCE ${JPEG_ROOT}/simd/jsimd_arm64_neon.S PROPERTY LANGUAGE C)

add_library(libjpeg SHARED ${SOURCE_FILES})
target_include_directories(libjpeg PUBLIC
        ${JPEG_ROOT}
        )
target_compile_options(libjpeg PRIVATE
        -O3
        -fstrict-aliasing
        -Wno-unused-parameter
        -Werror
        )