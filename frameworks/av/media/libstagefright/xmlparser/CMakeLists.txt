project(libstagefright_xmlparser)

set(STAGEFRIGHT_XMLPARSER_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/xmlparser)

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libstagefright_xmlparser SHARED ${STAGEFRIGHT_XMLPARSER_ROOT}/MediaCodecsXmlParser.cpp)
target_include_directories(libstagefright_xmlparser PUBLIC
        ${STAGEFRIGHT_XMLPARSER_ROOT}/include
        )
target_compile_options(libstagefright_xmlparser PRIVATE
        -Wall
        -Werror
        -fsanitize=unsigned-integer-overflow,signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_xmlparser
        libexpat
        libutils
        liblog
        libcutils
        libstagefright_foundation
        libstagefright_omx_utils
        )