project(libsync)

set(SYNC_ROOT ${ANDROID_ROOT}/system/core/libsync)

set(SOURCE_FILES
        ${SYNC_ROOT}/sync.c
        )


add_library(libsync SHARED ${SOURCE_FILES})
target_include_directories(libsync PUBLIC
        ${SYNC_ROOT}/include
        )
target_compile_options(libsync PRIVATE
        -Werror
        )