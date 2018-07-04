project(vulkan)

set(VULKAN_ROOT ${ANDROID_ROOT}/frameworks/native/vulkan)


set(LIBVULKAN_ROOT ${VULKAN_ROOT}/libvulkan)
set(SOURCE_FILES
        ${LIBVULKAN_ROOT}/api.cpp
        ${LIBVULKAN_ROOT}/api_gen.cpp
        ${LIBVULKAN_ROOT}/debug_report.cpp
        ${LIBVULKAN_ROOT}/driver.cpp
        ${LIBVULKAN_ROOT}/driver_gen.cpp
        ${LIBVULKAN_ROOT}/layers_extensions.cpp
        ${LIBVULKAN_ROOT}/stubhal.cpp
        ${LIBVULKAN_ROOT}/swapchain.cpp
        ${LIBVULKAN_ROOT}/vulkan_loader_data.cpp
        )



add_library(libvulkan SHARED ${SOURCE_FILES})
target_include_directories(libvulkan PUBLIC
        ${VULKAN_ROOT}/include
        ${ANDROID_ROOT}/hardware/libhardware/include
        )
target_compile_definitions(libvulkan PRIVATE
        -DLOG_TAG=\"vulkan\"
        -DVK_USE_PLATFORM_ANDROID_KHR
        -DVK_NO_PROTOTYPES
        )
target_compile_options(libvulkan PRIVATE
        -fvisibility=hidden
        -fstrict-aliasing
        -Weverything
        -Werror
        -Wno-padded
        -Wno-switch-enum
        -Wno-undef
        -std=c++14
        -Wno-c99-extensions
        -Wno-c++98-compat-pedantic
        -Wno-exit-time-destructors
        -Wno-float-equal
        -Wno-global-constructors
        -Wno-zero-length-array
        -fsanitize=integer
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libvulkan
        libziparchive
        libhardware
        libsync
        libbase
        liblog
        libui
        libgraphicsenv
        libutils
        libcutils
        libz
        libnativewindow

        libgrallocusage
        )