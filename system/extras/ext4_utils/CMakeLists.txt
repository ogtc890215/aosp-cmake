project(ext4_utils)

set(EXT4_UTILS_ROOT ${ANDROID_ROOT}/system/extras/ext4_utils)

set(SOURCE_FILES
        ${EXT4_UTILS_ROOT}/make_ext4fs.c
        ${EXT4_UTILS_ROOT}/ext4fixup.c
        ${EXT4_UTILS_ROOT}/ext4_utils.c
        ${EXT4_UTILS_ROOT}/allocate.c
        ${EXT4_UTILS_ROOT}/contents.c
        ${EXT4_UTILS_ROOT}/extent.c
        ${EXT4_UTILS_ROOT}/indirect.c
        ${EXT4_UTILS_ROOT}/sha1.c
        ${EXT4_UTILS_ROOT}/wipe.c
        ${EXT4_UTILS_ROOT}/crc16.c
        ${EXT4_UTILS_ROOT}/ext4_sb.c
        ${EXT4_UTILS_ROOT}/ext4_crypt.cpp
        ${EXT4_UTILS_ROOT}/ext4_crypt_init_extensions.cpp
        )


add_library(libext4_utils SHARED ${SOURCE_FILES})
target_include_directories(libext4_utils PUBLIC
        ${EXT4_UTILS_ROOT}/include
        )
target_compile_definitions(libext4_utils PRIVATE
        -DREAL_UUID
        )
target_compile_options(libext4_utils PRIVATE
        -fno-strict-aliasing
        )
target_link_libraries(libext4_utils
        libsparse
        libselinux
        libbase
        libkeyutils
        liblogwrap
        libext2_uuid
        libcutils
        libz
        )