project(libpowermanager)

set(POWERMANAGER_ROOT ${ANDROID_ROOT}/frameworks/native/services/powermanager)

include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/hardware/libhardware/include)


add_library(libpowermanager SHARED ${POWERMANAGER_ROOT}/IPowerManager.cpp)
target_compile_options(libpowermanager PRIVATE
        -Wall
        -Werror
        -Wunused
        -Wunreachable-code
        )
target_link_libraries(libpowermanager
        libutils
        libbinder
        )