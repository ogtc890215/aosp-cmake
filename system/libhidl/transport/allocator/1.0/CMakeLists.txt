project(android.hidl.allocator@1.0)

set(ANDROID_HIDL_ALLOCATOR_1_0_ROOT ${ANDROID_ROOT}/system/libhidl/transport/allocator/1.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++/gen/android/hidl/allocator/1.0/AllocatorAll.cpp
        )

add_library(android.hidl.allocator-1.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hidl.allocator-1.0 PUBLIC
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers/gen
        )
target_compile_options(android.hidl.allocator-1.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hidl.allocator-1.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils
        )