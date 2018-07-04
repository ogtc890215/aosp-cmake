project(libhidlmemory)

set(HIDLMEMORY_ROOT ${ANDROID_ROOT}/system/libhidl/libhidlmemory)


add_library(libhidlmemory SHARED ${HIDLMEMORY_ROOT}/mapping.cpp)
target_include_directories(libhidlmemory PUBLIC
        ${HIDLMEMORY_ROOT}/include
        ${ANDROID_ROOT}/system/libhidl/base/include
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers/gen
        )
target_compile_definitions(libhidlmemory PRIVATE
        -DLIBHIDL_TARGET_DEBUGGABLE
        )
target_link_libraries(libhidlmemory
        libbase
        liblog
        libutils
        libcutils
        libhidlbase
        libhidltransport

        android.hidl.memory-1.0
        )