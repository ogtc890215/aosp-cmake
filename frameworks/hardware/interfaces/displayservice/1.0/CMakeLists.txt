project(android.frameworks.displayservice@1.0)

set(ANDROID_FRAMEWORKS_DISPLAYSERVICE_1_0_ROOT ${ANDROID_ROOT}/frameworks/hardware/interfaces/displayservice/1.0)

set(SOURCE_FILES
        ${INTERMEDIATES_ROOT}/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++/gen/android/frameworks/displayservice/1.0/DisplayEventReceiverAll.cpp
        ${INTERMEDIATES_ROOT}/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++/gen/android/frameworks/displayservice/1.0/DisplayServiceAll.cpp
        ${INTERMEDIATES_ROOT}/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++/gen/android/frameworks/displayservice/1.0/EventCallbackAll.cpp
        ${INTERMEDIATES_ROOT}/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++/gen/android/frameworks/displayservice/1.0/types.cpp
        )

add_library(android.frameworks.displayservice-1.0 SHARED ${SOURCE_FILES})
target_include_directories(android.frameworks.displayservice-1.0 PUBLIC
        ${INTERMEDIATES_ROOT}/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++_headers/gen
        )
target_compile_options(android.frameworks.displayservice-1.0 PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(android.frameworks.displayservice-1.0
        libhidlbase
        libhidltransport
        libhwbinder
        liblog
        libutils
        libcutils
        )