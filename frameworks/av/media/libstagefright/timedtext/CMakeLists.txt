project(libstagefright_timedtext)

set(STAGEFRIGHT_TIMEDTEXT_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/timedtext)

include_directories(${STAGEFRIGHT_TIMEDTEXT_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
#include_directories(${ANDROID_ROOT}/system/core/base/include)
#include_directories(${ANDROID_ROOT}/system/media/audio/include)


add_library(libstagefright_timedtext STATIC ${STAGEFRIGHT_TIMEDTEXT_ROOT}/TextDescriptions.cpp)
target_compile_options(libstagefright_timedtext PRIVATE
        -Wno-multichar
        -Wall
        -Werror
        -fsanitize=signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_timedtext
        libmedia
        )