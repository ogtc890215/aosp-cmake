project(android.hardware.configstore@1.0)

set(ANDROID_HARDWARE_CONFIGSTORE_1_0_ROOT ${ANDROID_ROOT}/hardware/interfaces/configstore/1.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++/gen/android/hardware/configstore/1.0/SurfaceFlingerConfigsAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++/gen/android/hardware/configstore/1.0/types.cpp
        )

add_library(android.hardware.configstore-1.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.configstore-1.0 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++_headers/gen
        )
target_compile_options(android.hardware.configstore-1.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.configstore-1.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils
        )