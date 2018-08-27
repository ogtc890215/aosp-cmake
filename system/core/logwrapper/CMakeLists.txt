project(logwrapper)

set(LOGWRAPPER_ROOT ${ANDROID_ROOT}/system/core/logwrapper)

set(SOURCE_FILES
        ${LOGWRAPPER_ROOT}/logwrap.c
        )


add_library(libwrap SHARED ${SOURCE_FILES})
target_include_directories(libwrap PUBLIC
        ${LOGWRAPPER_ROOT}/include
        )
target_compile_options(libwrap PRIVATE
        -Werror
        )
target_link_libraries(libwrap
        libcutils
        liblog
        )