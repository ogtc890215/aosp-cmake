project(libstagefright_color_conversion)

set(STAGEFRIGHT_COLORCONVERSION_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/colorconversion)

set(SOURCE_FILES
        ${STAGEFRIGHT_COLORCONVERSION_ROOT}/ColorConverter.cpp
        ${STAGEFRIGHT_COLORCONVERSION_ROOT}/SoftwareRenderer.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
#include_directories(${ANDROID_ROOT}/hardware/libhardware/include)


add_library(libstagefright_color_conversion STATIC ${SOURCE_FILES})
target_compile_options(libstagefright_color_conversion PRIVATE
        -Werror
        -fsanitize=signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_color_conversion
        libui
        libnativewindow

        libyuv_static
        )