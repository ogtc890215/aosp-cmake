project(libvndksupport)

set(VNDKSUPPORT_ROOT ${ANDROID_ROOT}/system/core/libvndksupport)

include_directories(${VNDKSUPPORT_ROOT}/include/vndksupport)

add_library(libvndksupport SHARED ${VNDKSUPPORT_ROOT}/linker.c)
target_include_directories(libvndksupport PUBLIC
        ${VNDKSUPPORT_ROOT}/include
        )
target_link_libraries(libvndksupport
        liblog
        )