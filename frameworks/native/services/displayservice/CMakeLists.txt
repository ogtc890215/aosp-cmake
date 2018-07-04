project(libdisplayservicehidl)

set(DISPLAYSERVICEHIDL_ROOT ${ANDROID_ROOT}/frameworks/native/services/displayservice)

set(SOURCE_FILES
        ${DISPLAYSERVICEHIDL_ROOT}/DisplayService.cpp
        ${DISPLAYSERVICEHIDL_ROOT}/DisplayEventReceiver.cpp
        )

add_library(libdisplayservicehidl SHARED ${SOURCE_FILES})
target_include_directories(libdisplayservicehidl PUBLIC
        ${DISPLAYSERVICEHIDL_ROOT}/include
        ${INTERMEDIATES_ROOT}/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++_headers/gen
        ${ANDROID_ROOT}/frameworks/native/libs/gui/include
        ${ANDROID_ROOT}/hardware/libhardware/include
        ${ANDROID_ROOT}/frameworks/native/libs/ui/include
        ${ANDROID_ROOT}/frameworks/native/libs/math/include
        ${ANDROID_ROOT}/frameworks/native/libs/nativebase/include
        ${ANDROID_ROOT}/frameworks/native/libs/nativewindow/include
        ${ANDROID_ROOT}/frameworks/native/libs/arect/include
        ${ANDROID_ROOT}/frameworks/native/libs/binder/include
        ${ANDROID_ROOT}/frameworks/native/opengl/include
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/token/1.0/android.hidl.token@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers/gen
        ${ANDROID_ROOT}/system/core/libsystem/include
        )
target_compile_options(libdisplayservicehidl PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(libdisplayservicehidl
        libbase
        liblog
        libgui
        libhidlbase
        libhidltransport
        libutils
        android.frameworks.displayservice-1.0
        )