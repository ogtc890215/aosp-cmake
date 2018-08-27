project(f2fs_utils)

set(F2FS_UTILS_ROOT ${ANDROID_ROOT}/system/extras/f2fs_utils)

set(SOURCE_FILES
        ${F2FS_UTILS_ROOT}/f2fs_sparseblock.c
        )


include_directories(${ANDROID_ROOT}/external/f2fs-tools/include)
include_directories(${ANDROID_ROOT}/system/core/include/log)

add_library(libf2fs_sparseblock SHARED ${SOURCE_FILES})
target_include_directories(libf2fs_sparseblock PUBLIC
        ${F2FS_UTILS_ROOT}
        )
target_link_libraries(libf2fs_sparseblock
        liblog
        libcutils
        )