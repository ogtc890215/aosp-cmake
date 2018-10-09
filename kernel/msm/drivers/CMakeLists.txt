set(LOCAL_PATH ${KERNEL_ROOT}/drivers/staging)

add_subdirectory(base)
add_subdirectory(char)
add_subdirectory(i2c)

if (${CONFIG_STAGING})
    add_subdirectory(staging)
endif ()

if (${CONFIG_OF})
    add_subdirectory(of)
endif()
