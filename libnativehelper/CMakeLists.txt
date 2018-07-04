project(libnativehelper)

set(NATIVEHELPER_ROOT ${ANDROID_ROOT}/libnativehelper)

set(SOURCE_FILES
        ${NATIVEHELPER_ROOT}/JNIHelp.cpp
        ${NATIVEHELPER_ROOT}/JniConstants.cpp
        ${NATIVEHELPER_ROOT}/toStringArray.cpp
        ${NATIVEHELPER_ROOT}/JniInvocation.cpp

        ${NATIVEHELPER_ROOT}/AsynchronousCloseMonitor.cpp
        )

add_library(libnativehelper SHARED ${SOURCE_FILES})
target_include_directories(libnativehelper PUBLIC
        ${NATIVEHELPER_ROOT}/include_jni
        ${NATIVEHELPER_ROOT}/platform_include
        ${NATIVEHELPER_ROOT}/include
        )
target_compile_options(libnativehelper PRIVATE
        -Werror
        -fvisibility=protected
        )
target_link_libraries(libnativehelper
        liblog
        ${INTERMEDIATES_ROOT}/bionic/libc/crtbegin_so/android_arm64_armv8-a_cortex-a53_core/crtbegin_so.o
        )