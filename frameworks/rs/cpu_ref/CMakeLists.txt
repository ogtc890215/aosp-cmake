project(libRSCpuRef)

set(RS_CPU_REF_ROOT ${ANDROID_ROOT}/frameworks/rs/cpu_ref)

set(ASM_FILES
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsics_advsimd_3DLUT.S
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsics_advsimd_Convolve.S
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsics_advsimd_Blur.S
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsics_advsimd_ColorMatrix.S
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsics_advsimd_Resize.S
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsics_advsimd_YuvToRGB.S
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsics_advsimd_Blend.S
        )

set(SOURCE_FILES
        ${RS_CPU_REF_ROOT}/rsCpuCore.cpp
        ${RS_CPU_REF_ROOT}/rsCpuExecutable.cpp
        ${RS_CPU_REF_ROOT}/rsCpuScript.cpp
        ${RS_CPU_REF_ROOT}/rsCpuRuntimeMath.cpp
        ${RS_CPU_REF_ROOT}/rsCpuScriptGroup.cpp
        ${RS_CPU_REF_ROOT}/rsCpuScriptGroup2.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsic.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsic3DLUT.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsicBLAS.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsicBlend.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsicBlur.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsicColorMatrix.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsicConvolve3x3.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsicConvolve5x5.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsicHistogram.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsicResize.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsicLUT.cpp
        ${RS_CPU_REF_ROOT}/rsCpuIntrinsicYuvToRGB.cpp
        ${ASM_FILES}
        )

set_property(SOURCE ${ASM_FILES} PROPERTY LANGUAGE C)

include_directories(${ANDROID_ROOT}/hardware/libhardware/include)

add_library(libRSCpuRef SHARED ${SOURCE_FILES})
target_compile_definitions(libRSCpuRef PRIVATE
        -DFORCE_ARM64_CODEGEN
        -DARCH_ARM_HAVE_NEON
        -DARCH_ARM_HAVE_VFP
        -DARCH_ARM_HAVE_VFP_D32
        -DDISABLE_CLCORE_NEON
        -DARCH_ARM_USE_INTRINSICS
        -DARCH_ARM64_USE_INTRINSICS
        -DARCH_ARM64_HAVE_NEON
        )
target_compile_options(libRSCpuRef PRIVATE
        -Werror
        -Wall
        -Wextra
        -Wno-unused-parameter
        -Wno-unused-variable
        )
target_link_libraries(libRSCpuRef
        libRS_internal
        liblog
        libz
        libbcinfo
        libblas
        libbnnmlowp
        )