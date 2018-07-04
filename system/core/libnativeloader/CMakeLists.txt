project(libnativeloader)

set(NATIVELOADER_ROOT ${ANDROID_ROOT}/system/core/libnativeloader)


add_library(libnativeloader SHARED ${NATIVELOADER_ROOT}/native_loader.cpp)
target_include_directories(libnativeloader PUBLIC
        ${NATIVELOADER_ROOT}/include
        )
target_compile_options(libnativeloader PRIVATE
        -Werror
        -Wall
        -fvisibility=hidden
        )
target_link_libraries(libnativeloader
        libnativehelper
        liblog
        libcutils
        libnativebridge
        libbase
        )