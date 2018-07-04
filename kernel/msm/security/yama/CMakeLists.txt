set(LOCAL_PATH ${KERNEL_ROOT}/security/yama)

set(SOURCE_FILES "")

if (${CONFIG_SECURITY_YAMA})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} yama_lsm)
endif ()

add_library(security-yama STATIC ${SOURCE_FILES})