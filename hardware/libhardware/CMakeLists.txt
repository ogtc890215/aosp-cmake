project(libhardware)

set(LIBHARDWARE_ROOT ${ANDROID_ROOT}/hardware/libhardware)

add_library(libhardware SHARED ${LIBHARDWARE_ROOT}/hardware.c)
target_include_directories(libhardware PUBLIC
        ${LIBHARDWARE_ROOT}/include
        ${ANDROID_ROOT}/system/media/audio/include
        ${ANDROID_ROOT}/system/core/libsystem/include
        )
target_compile_definitions(libhardware PRIVATE
        -DQEMU_HARDWARE
        )
target_link_libraries(libhardware
        libcutils
        liblog
        libvndksupport
        )