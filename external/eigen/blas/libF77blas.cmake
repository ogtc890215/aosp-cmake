set(F77BLAS_ROOT ${ANDROID_ROOT}/external/eigen/blas)

set(SOURCE_FILES
        ${F77BLAS_ROOT}/single.cpp
        ${F77BLAS_ROOT}/double.cpp
        ${F77BLAS_ROOT}/complex_single.cpp
        ${F77BLAS_ROOT}/complex_double.cpp
        ${F77BLAS_ROOT}/xerbla.cpp
        ${F77BLAS_ROOT}/f2c/complexdots.c
        ${F77BLAS_ROOT}/f2c/srotm.c
        ${F77BLAS_ROOT}/f2c/srotmg.c
        ${F77BLAS_ROOT}/f2c/drotm.c
        ${F77BLAS_ROOT}/f2c/drotmg.c
        ${F77BLAS_ROOT}/f2c/lsame.c
        ${F77BLAS_ROOT}/f2c/dspmv.c
        ${F77BLAS_ROOT}/f2c/ssbmv.c
        ${F77BLAS_ROOT}/f2c/chbmv.c
        ${F77BLAS_ROOT}/f2c/sspmv.c
        ${F77BLAS_ROOT}/f2c/zhbmv.c
        ${F77BLAS_ROOT}/f2c/chpmv.c
        ${F77BLAS_ROOT}/f2c/dsbmv.c
        ${F77BLAS_ROOT}/f2c/zhpmv.c
        ${F77BLAS_ROOT}/f2c/dtbmv.c
        ${F77BLAS_ROOT}/f2c/stbmv.c
        ${F77BLAS_ROOT}/f2c/ctbmv.c
        ${F77BLAS_ROOT}/f2c/ztbmv.c
        ${F77BLAS_ROOT}/f2c/d_cnjg.c
        ${F77BLAS_ROOT}/f2c/r_cnjg.c
        )

add_library(libF77blas STATIC ${SOURCE_FILES})
target_include_directories(libF77blas PUBLIC
        ${F77BLAS_ROOT}
        )
target_compile_options(libF77blas PRIVATE
        -Wno-unused-parameter
        )