project(libcap)

set(CAP_ROOT ${ANDROID_ROOT}/external/libcap)

set(SOURCE_FILES
        ${CAP_ROOT}/libcap/cap_alloc.c
        ${CAP_ROOT}/libcap/cap_extint.c
        ${CAP_ROOT}/libcap/cap_file.c
        ${CAP_ROOT}/libcap/cap_flag.c
        ${CAP_ROOT}/libcap/cap_proc.c
        ${CAP_ROOT}/libcap/cap_text.c
        )


add_library(libcap SHARED ${SOURCE_FILES})
target_include_directories(libcap PUBLIC
        ${CAP_ROOT}/libcap/include
        )
target_compile_options(libcap PRIVATE
        -Wno-unused-parameter
        -Wno-tautological-compare
        )