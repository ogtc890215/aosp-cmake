project(libdemangle)

set(DEMANGLE_ROOT ${ANDROID_ROOT}/system/core/demangle)

set(SOURCE_FILES
        ${DEMANGLE_ROOT}/Demangler.cpp
        )


add_library(libdemangle SHARED ${SOURCE_FILES})
target_include_directories(libdemangle PUBLIC
        ${DEMANGLE_ROOT}/include
        )
target_compile_options(libdemangle PRIVATE
        -Wall
        -Werror
        -Wextra
        )