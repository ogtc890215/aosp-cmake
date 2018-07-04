project(android.hidl.token@1.0)

set(ANDROID_HIDL_TOKEN_1_0_ROOT ${ANDROID_ROOT}/system/libhidl/transport/token/1.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/token/1.0/android.hidl.token@1.0_genc++/gen/android/hidl/token/1.0/TokenManagerAll.cpp
        )

add_library(android.hidl.token-1.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hidl.token-1.0 PUBLIC
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/token/1.0/android.hidl.token@1.0_genc++_headers/gen
        )
target_compile_options(android.hidl.token-1.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hidl.token-1.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils
        )