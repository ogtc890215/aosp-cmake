project(libpackagelistparser)

set(PACKAGELISTPARSER_ROOT ${ANDROID_ROOT}/system/core/libpackagelistparser)


add_library(libpackagelistparser SHARED ${PACKAGELISTPARSER_ROOT}/packagelistparser.c)
target_include_directories(libpackagelistparser PUBLIC
        ${PACKAGELISTPARSER_ROOT}/include
        )
target_compile_options(libpackagelistparser PRIVATE
        -fsanitize=integer
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libpackagelistparser
        liblog
        )