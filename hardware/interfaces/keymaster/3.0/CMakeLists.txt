project(android.hardware.keymaster@3.0)

set(ANDROID_HARDWARE_KEYMASTER_3_0_ROOT ${ANROID_ROOT}/hardware/interfaces/keymaster/3.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0_genc++/gen/android/hardware/keymaster/3.0/types.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0_genc++/gen/android/hardware/keymaster/3.0/KeymasterDeviceAll.cpp
        )

add_library(android.hardware.keymaster-3.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.keymaster-3.0 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0_genc++_headers/gen
        )
target_compile_options(android.hardware.keymaster-3.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.keymaster-3.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils
        )