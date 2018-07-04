project(libnativebridge)

set(NATIVEBRIDGE_ROOT ${ANDROID_ROOT}/system/core/libnativebridge)


add_library(libnativebridge SHARED ${NATIVEBRIDGE_ROOT}/native_bridge.cc)
target_include_directories(libnativebridge PUBLIC
        ${NATIVEBRIDGE_ROOT}/include
        )
target_compile_options(libnativebridge PRIVATE
        -Werror
        -Wall
        -fvisibility=protected
        )
target_link_libraries(libnativebridge
        liblog
        )