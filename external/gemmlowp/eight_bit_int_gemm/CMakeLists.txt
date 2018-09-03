project(libbnnmlowp)

set(BNNMLOWP_ROOT ${ANDROID_ROOT}/external/gemmlowp/eight_bit_int_gemm)

set(SOURCE_FILES
        ${BNNMLOWP_ROOT}/eight_bit_int_gemm.cc
        )

add_library(libbnnmlowp STATIC ${SOURCE_FILES})
target_include_directories(libbnnmlowp PUBLIC
        ${BNNMLOWP_ROOT}
        )
target_compile_options(libbnnmlowp PRIVATE
        -Wno-unused-parameter
        )
target_compile_definitions(libbnnmlowp PRIVATE
        -DGEMMLOWP_USE_META_FASTPATH
        )