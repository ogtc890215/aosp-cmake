project(libhardware_legacy)

set(HARDWARE_LEGACY_ROOT ${ANDROID_ROOT}/hardware/libhardware_legacy)

set(SOURCE_FILES
        ${HARDWARE_LEGACY_ROOT}/power.c
        ${HARDWARE_LEGACY_ROOT}/uevent.c
        )


add_library(libhardware_legacy SHARED ${SOURCE_FILES})
target_include_directories(libhardware_legacy PUBLIC
        ${HARDWARE_LEGACY_ROOT}/include
        )
target_compile_definitions(libhardware_legacy PRIVATE
        -DQEMU_HARDWARE
        )
target_compile_options(libhardware_legacy PRIVATE
        -Wno-unused-parameter
        -Wno-gnu-designator
        )
target_link_libraries(libhardware_legacy
        libbase
        libcutils
        liblog
        )