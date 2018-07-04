project(android.hardware.configstore-utils)

set(ANDROID_HARDWARE_CONFIGSTORE_UTILS_ROOT ${ANDROID_ROOT}/hardware/interfaces/configstore/utils)

set(SOURCE_FILES
        ${ANDROID_HARDWARE_CONFIGSTORE_UTILS_ROOT}/ConfigStoreUtils.cpp
        )

add_library(android.hardware.configstore-utils SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.configstore-utils PUBLIC
        ${ANDROID_HARDWARE_CONFIGSTORE_UTILS_ROOT}/include
        )
target_compile_options(android.hardware.configstore-utils PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.configstore-utils
        android.hardware.configstore-1.0
        libbase
        libhidlbase
        )