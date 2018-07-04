project(libbinder)

set(BINDER_ROOT ${ANDROID_ROOT}/frameworks/native/libs/binder)

set(SOURCE_FILES
        ${BINDER_ROOT}/AppOpsManager.cpp
        ${BINDER_ROOT}/Binder.cpp
        ${BINDER_ROOT}/BpBinder.cpp
        ${BINDER_ROOT}/BufferedTextOutput.cpp
        ${BINDER_ROOT}/Debug.cpp
        ${BINDER_ROOT}/IActivityManager.cpp
        ${BINDER_ROOT}/IAppOpsCallback.cpp
        ${BINDER_ROOT}/IAppOpsService.cpp
        ${BINDER_ROOT}/IBatteryStats.cpp
        ${BINDER_ROOT}/IInterface.cpp
        ${BINDER_ROOT}/IMediaResourceMonitor.cpp
        ${BINDER_ROOT}/IMemory.cpp
        ${BINDER_ROOT}/IPCThreadState.cpp
        ${BINDER_ROOT}/IPermissionController.cpp
        ${BINDER_ROOT}/IProcessInfoService.cpp
        ${BINDER_ROOT}/IResultReceiver.cpp
        ${BINDER_ROOT}/IServiceManager.cpp
        ${BINDER_ROOT}/IShellCallback.cpp
        ${BINDER_ROOT}/MemoryBase.cpp
        ${BINDER_ROOT}/MemoryDealer.cpp
        ${BINDER_ROOT}/MemoryHeapBase.cpp
        ${BINDER_ROOT}/Parcel.cpp
        ${BINDER_ROOT}/PermissionCache.cpp
        ${BINDER_ROOT}/PersistableBundle.cpp
        ${BINDER_ROOT}/ProcessInfoService.cpp
        ${BINDER_ROOT}/ProcessState.cpp
        ${BINDER_ROOT}/Static.cpp
        ${BINDER_ROOT}/Status.cpp
        ${BINDER_ROOT}/TextOutput.cpp
        ${BINDER_ROOT}/IpPrefix.cpp
        ${BINDER_ROOT}/Value.cpp

        ${ANDROID_ROOT}/out/soong/.intermediates/frameworks/native/libs/binder/libbinder/android_arm64_armv8-a_cortex-a53_static_core/gen/aidl/frameworks/native/libs/binder/aidl/android/content/pm/IPackageManagerNative.cpp
        )



add_library(libbinder SHARED ${SOURCE_FILES})
target_include_directories(libbinder PUBLIC
        ${BINDER_ROOT}/include
        ${ANDROID_ROOT}/system/core/base/include
        ${INTERMEDIATES_ROOT}/frameworks/native/libs/binder/libbinder/android_arm64_armv8-a_cortex-a53_static_core/gen/aidl
        )
target_compile_options(libbinder PRIVATE
        -Wall
        -Wextra
        -Werror
        -fsanitize=integer
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libbinder
        libbase
        liblog
        libcutils
        libutils
        )