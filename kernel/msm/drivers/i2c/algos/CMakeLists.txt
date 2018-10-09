set(LOCAL_PATH ${KERNEL_ROOT}/drivers/i2c/algos)

set(SOURCE_FILES "")

if (${CONFIG_I2C_ALGOBIT})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} i2c-algo-bit)
endif ()
if (${CONFIG_I2C_ALGOPCF})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} i2c-algo-pcf)
endif ()
if (${CONFIG_I2C_ALGOPCA})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} i2c-algo-pca)
endif ()

if (NOT ("${SOURCE_FILES}" STREQUAL ""))
    add_library(drivers-i2c-algos STATIC ${SOURCE_FILES})
    target_include_directories(drivers-i2c-algos PRIVATE ${LOCAL_PATH})
endif ()