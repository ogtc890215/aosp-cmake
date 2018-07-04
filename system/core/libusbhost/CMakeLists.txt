project(libusbhost)

set(USBHOST_ROOT ${ANDROID_ROOT}/system/core/libusbhost)


add_library(libusbhost SHARED ${USBHOST_ROOT}/usbhost.c)
target_include_directories(libusbhost PUBLIC
        ${USBHOST_ROOT}/include
        )
target_compile_definitions(libusbhost PRIVATE
        -DUSE_LIBLOG
        )
target_compile_options(libusbhost PRIVATE
        -Werror
        -g
        )
target_link_libraries(libusbhost
        liblog
        )