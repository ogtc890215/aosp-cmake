project(libkeyutils)

set(KEYUTILS_ROOT ${ANDROID_ROOT}/system/core/libkeyutils)

set(SOURCE_FILES
        ${KEYUTILS_ROOT}/keyutils.cpp
        )

add_library(libkeyutils SHARED ${SOURCE_FILES})
target_include_directories(libkeyutils PUBLIC
        ${KEYUTILS_ROOT}/include
        )
target_compile_options(libkeyutils PRIVATE
        -Werror
        )