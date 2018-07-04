set(LOCAL_PATH ${KERNEL_ROOT}/fs/debugfs)

set(SOURCE_FILES "")

if (${CONFIG_DEBUG_FS})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} inode)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} file)

    add_library(fs-debugfs STATIC ${SOURCE_FILES})
endif ()