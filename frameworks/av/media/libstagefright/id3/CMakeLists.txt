project(libstagefright_id3)

set(STAGEFRIGHT_ID3_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/id3)

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/system/core/base/include)
include_directories(${ANDROID_ROOT}/system/media/audio/include)


add_library(libstagefright_id3 STATIC ${STAGEFRIGHT_ID3_ROOT}/ID3.cpp)
target_compile_options(libstagefright_id3 PRIVATE
        -Werror
        -Wall
        -fsanitize=signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_id3
        libmedia
        )