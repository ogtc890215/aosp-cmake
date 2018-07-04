project(libsonic)

set(SONIC_ROOT ${ANDROID_ROOT}/external/sonic)

add_library(libsonic SHARED ${SONIC_ROOT}/sonic.c)
target_compile_options(libsonic PRIVATE
        -Wno-sequence-point
        -Wno-extra
        )