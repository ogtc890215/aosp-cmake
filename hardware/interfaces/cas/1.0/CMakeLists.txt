project(android.hardware.cas@1.0)

set(ANDROID_HARDWARE_CAS_1_0_ROOT ${ANDROID_ROOT}/hardware/interfaces/cas/1.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++/gen/android/hardware/cas/1.0/CasAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++/gen/android/hardware/cas/1.0/CasListenerAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++/gen/android/hardware/cas/1.0/DescramblerBaseAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++/gen/android/hardware/cas/1.0/MediaCasServiceAll.cpp
        ${INTERMEDIATES_ROOT}/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++/gen/android/hardware/cas/1.0/types.cpp
        )

add_library(android.hardware.cas-1.0 SHARED ${SOURCE_FILES})
target_include_directories(android.hardware.cas-1.0 PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++_headers/gen
        )
target_compile_options(android.hardware.cas-1.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.hardware.cas-1.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils
        )