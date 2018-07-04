set(LOCAL_PATH ${KERNEL_ROOT}/drivers/staging)

set(SOURCE_FILES "")

if (${CONFIG_STAGING})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} staging)
endif ()

add_library(drivers-staging STATIC ${SOURCE_FILES})

if (${CONFIG_ANDROID})
    add_subdirectory(android)
    target_link_libraries(drivers-staging
            drivers-staging-android
            )
endif ()