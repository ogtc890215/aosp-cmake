project(speex)

set(SPEEX_ROOT ${ANDROID_ROOT}/external/speex)


#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fprefetch-loop-arrays")

add_library(libspeexresampler SHARED ${SPEEX_ROOT}/libspeex/resample.c)
target_include_directories(libspeexresampler PUBLIC
        ${SPEEX_ROOT}/include
        )
target_compile_definitions(libspeexresampler PRIVATE
        -DEXPORT=
        -DFIXED_POINT
        -DRESAMPLE_FORCE_FULL_SINC_TABLE
        )
target_compile_options(libspeexresampler PRIVATE
        -O3
        -fstrict-aliasing
        )