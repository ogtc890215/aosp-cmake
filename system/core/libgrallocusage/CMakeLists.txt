project(libgrallocusage)

set(GRALLOCUSAGE_ROOT ${ANDROID_ROOT}/system/core/libgrallocusage)

include_directories(${ANDROID_ROOT}/hardware/libhardware/include)


add_library(libgrallocusage STATIC ${GRALLOCUSAGE_ROOT}/GrallocUsageConversion.cpp)
target_include_directories(libgrallocusage PUBLIC
        ${GRALLOCUSAGE_ROOT}/include
        )
target_compile_options(libgrallocusage PRIVATE
        -Weverything
        -Werror
        -Wno-c++98-compat-pedantic
        -Wno-global-constructors
        -Wno-exit-time-destructors
        -Wno-padded
        )