project(libheif)

set(HEIF_ROOT ${ANDROID_ROOT}/frameworks/av/media/libheif)

include_directories(${HEIF_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)


add_library(libheif SHARED ${HEIF_ROOT}/HeifDecoderImpl.cpp)
target_include_directories(libheif PUBLIC
        ${HEIF_ROOT}/include
        )
target_compile_options(libheif PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(libheif
        libbinder
        liblog
        libutils
        libmedia
        )