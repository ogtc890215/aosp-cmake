project(libdiskconfig)

set(DISKCONFIG_ROOT ${ANDROID_ROOT}/system/core/libdiskconfig)

set(SOURCE_FILES
        ${DISKCONFIG_ROOT}/diskconfig.c
        ${DISKCONFIG_ROOT}/diskutils.c
        ${DISKCONFIG_ROOT}/write_lst.c
        ${DISKCONFIG_ROOT}/config_mbr.c
        )


add_library(libdiskconfig SHARED ${SOURCE_FILES})
target_include_directories(libdiskconfig PUBLIC
        ${DISKCONFIG_ROOT}/include
        )
target_compile_options(libdiskconfig PRIVATE
        -Werror
        )
target_link_libraries(libdiskconfig
        libcutils
        liblog
        )