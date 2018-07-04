set(LOCAL_PATH ${KERNEL_ROOT}/drivers/staging)

add_subdirectory(char)

if (${CONFIG_STAGING})
    add_subdirectory(staging)
endif ()

