project(libprocessgroup)

set(PROCESSGROUP_ROOT ${ANDROID_ROOT}/system/core/libprocessgroup)


add_library(libprocessgroup SHARED ${PROCESSGROUP_ROOT}/processgroup.cpp)
target_include_directories(libprocessgroup PUBLIC
        ${PROCESSGROUP_ROOT}/include
        )
target_compile_options(libprocessgroup PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(libprocessgroup
        libbase
        )