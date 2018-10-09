set(LOCAL_PATH ${KERNEL_ROOT}/drivers/i2c)

set(SOURCE_FILES "")

if (${CONFIG_I2C_BOARDINFO})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} i2c-boardinfo)
endif ()
if (${CONFIG_I2C})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} i2c-core)
endif ()
if (${CONFIG_I2C_SMBUS})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} i2c-smbus)
endif ()
if (${CONFIG_I2C_CHARDEV})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} i2c-dev)
endif ()
if (${CONFIG_I2C_MUX})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} i2c-mux)
endif ()

add_subdirectory(algos)
add_subdirectory(busses)
add_subdirectory(muxes)

add_library(drivers-i2c STATIC ${SOURCE_FILES})
target_include_directories(drivers-i2c PRIVATE ${LOCAL_PATH})
target_link_libraries(drivers-i2c
        drivers-i2c-algos
        drivers-i2c-busses
        drivers-i2c-muxes
        )