project(libhidltransport)

set(HIDLTRANSPORT_ROOT ${ANDROID_ROOT}/system/libhidl/transport)

set(SOURCE_FILES
        ${HIDLTRANSPORT_ROOT}/HidlBinderSupport.cpp
        ${HIDLTRANSPORT_ROOT}/HidlTransportSupport.cpp
        ${HIDLTRANSPORT_ROOT}/HidlTransportUtils.cpp
        ${HIDLTRANSPORT_ROOT}/ServiceManagement.cpp
        ${HIDLTRANSPORT_ROOT}/Static.cpp

        ${INTERMEDIATES_ROOT}/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++/gen/android/hidl/manager/1.0/ServiceManagerAll.cpp
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++/gen/android/hidl/manager/1.0/ServiceNotificationAll.cpp
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++/gen/android/hidl/manager/1.1/ServiceManagerAll.cpp
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++/gen/android/hidl/base/1.0/BaseAll.cpp
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++/gen/android/hidl/base/1.0/types.cpp
        )


add_library(libhidltransport SHARED ${SOURCE_FILES})
target_include_directories(libhidltransport PUBLIC
        ${HIDLTRANSPORT_ROOT}/include
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers/gen
        )
target_compile_definitions(libhidltransport PRIVATE
        -DLIBHIDL_TARGET_DEBUGGABLE
        )
target_compile_options(libhidltransport PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libhidltransport
        libbase
        libcutils
        liblog
        libutils
        libhidlbase
        libhwbinder
        libvndksupport
        )