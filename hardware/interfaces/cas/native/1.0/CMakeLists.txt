project(android.hardware.cas.native@1.0)

set(ANDROID_HADWARE_CAS_NATIVE_1_0_ROOT ${ANDROID_ROOT}/hardware/interfaces/cas/native/1.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++/gen/android/hardware/cas/native/1.0/DescramblerAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++/gen/android/hardware/cas/native/1.0/types.cpp
        )


add_library(android.hardware.cas.native-1.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.cas.native-1.0 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++_headers/gen
        )
target_compile_options(android.hardware.cas.native-1.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.cas.native-1.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils

        android.hardware.cas-1.0
        )