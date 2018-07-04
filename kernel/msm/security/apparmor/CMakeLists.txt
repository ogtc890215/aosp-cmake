set(LOCAL_PATH ${KERNEL_ROOT}/security)

set(SOURCE_FILES "")

if (${CONFIG_SECURITY_APPARMOR})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} apparmorfs)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} audit)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} capability)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} context)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} ipc)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} lib)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} match)

    add_c_source(SOURCE_FILES ${LOCAL_PATH} path)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} domain)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} policy)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} policy_unpack)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} procattr)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} lsm)

    add_c_source(SOURCE_FILES ${LOCAL_PATH} resource)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} sid)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} file)
endif ()

add_library(security-apparmor STATIC ${SOURCE_FILES})