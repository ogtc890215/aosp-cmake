project(libmemtrack)

set(MEMTRACK_ROOT ${ANDROID_ROOT}/system/core/libmemtrack)


add_library(libmemtrack SHARED ${MEMTRACK_ROOT}/memtrack.cpp)
target_include_directories(libmemtrack PUBLIC
        ${MEMTRACK_ROOT}/include
        )
target_compile_options(libmemtrack PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(libmemtrack
        libhardware
        liblog
        libbase
        libhidlbase
        libhidltransport
        libhwbinder
        libutils

        android.hardware.memtrack-1.0
        )