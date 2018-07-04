project(libexpat)

set(EXPAT_ROOT ${ANDROID_ROOT}/external/expat)

set(SOURCE_FILES
        ${EXPAT_ROOT}/lib/xmlparse.c
        ${EXPAT_ROOT}/lib/xmlrole.c
        ${EXPAT_ROOT}/lib/xmltok.c
        )

include_directories(${EXPAT_ROOT})


add_library(libexpat SHARED ${SOURCE_FILES})
target_include_directories(libexpat PUBLIC
        ${EXPAT_ROOT}/lib
        )
target_compile_definitions(libexpat PRIVATE
        -DHAVE_EXPAT_CONFIG_H
        )
target_compile_options(libexpat PRIVATE
        -Wall
        -Wmissing-prototypes
        -Wstrict-prototypes
        -Wno-unused-parameter
        -Wno-missing-field-initializers
        -fexceptions
        )