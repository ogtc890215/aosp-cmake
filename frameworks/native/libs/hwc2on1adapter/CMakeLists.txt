project(hwc2on1adapter)

set(HWC2_ADAPTER ${ANDROID_ROOT}/frameworks/native/libs/hwc2on1adapter)

set(SOURCE_FILES
        ${HWC2_ADAPTER}/HWC2On1Adapter.cpp
        ${HWC2_ADAPTER}/MiniFence.cpp
        )

add_library(libhwc2on1adapter SHARED ${SOURCE_FILES})
target_compile_options(libhwc2on1adapter PRIVATE
        -Weverything
        -Wall
        -Wunused
        -Wunreachable-code

        -Wno-exit-time-destructors
        -Wno-global-constructors

        -Wno-c++98-compat-pedantic

        -Wno-nested-anon-types
        -Wno-gnu-anonymous-struct

        -Wno-padded

        -Wno-covered-switch-default

        -Wno-zero-length-array

        -Wno-double-promotion
        -Wno-sign-conversion
        -Wno-switch-enum
        -Wno-float-equal
        -Wno-shorten-64-to-32
        -Wno-sign-compare
        -Wno-missing-prototypes
        )
target_include_directories(libhwc2on1adapter PUBLIC
        ${HWC2_ADAPTER}/include
        )
target_link_libraries(libhwc2on1adapter
        libutils
        libcutils
        liblog
        libhardware
        )