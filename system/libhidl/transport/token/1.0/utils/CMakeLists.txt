project(android.hidl.token@1.0-utils)

set(ANDROID_HIDL_TOKEN_1_0_UTILS_ROOT ${ANDROID_ROOT}/system/libhidl/transport/token/1.0/utils)

set(SOURCE_FILES
        ${ANDROID_HIDL_TOKEN_1_0_UTILS_ROOT}/HybridInterface.cpp
        )

add_library(android.hidl.token-1.0-utils SHARED ${SOURCE_FILES})
target_include_directories(android.hidl.token-1.0-utils PUBLIC
        ${ANDROID_HIDL_TOKEN_1_0_UTILS_ROOT}/include
        )
target_link_libraries(android.hidl.token-1.0-utils
        libhidlbase
        libutils
        libbinder
        liblog

        android.hidl.token-1.0
        )