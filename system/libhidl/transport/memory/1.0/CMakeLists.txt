project(android.hidl.memory@1.0)

set(ANDROID_HIDL_MEMORY_1_0_ROOT ${ANDROID_ROOT}/system/libhidl/transport/memory/1.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++/gen/android/hidl/memory/1.0/MapperAll.cpp
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++/gen/android/hidl/memory/1.0/MemoryAll.cpp
        )

add_library(android.hidl.memory-1.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hidl.memory-1.0 PUBLIC
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers/gen
        )
target_compile_options(android.hidl.memory-1.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hidl.memory-1.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils
        )