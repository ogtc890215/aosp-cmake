set(LOCAL_PATH ${KERNEL_ROOT}/security/selinux)

set(SOURCE_FILES "")

if (${CONFIG_SECURITY_SELINUX})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} avc)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} hooks)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} selinuxfs)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} netlink)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} nlmsgtab)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} netif)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} netnode)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} netport)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} exports)
    add_c_source(SOURCE_FILES ${LOCAL_PATH}/ss ebitmap)
    add_c_source(SOURCE_FILES ${LOCAL_PATH}/ss hashtab)
    add_c_source(SOURCE_FILES ${LOCAL_PATH}/ss symtab)
    add_c_source(SOURCE_FILES ${LOCAL_PATH}/ss sidtab)
    add_c_source(SOURCE_FILES ${LOCAL_PATH}/ss avtab)
    add_c_source(SOURCE_FILES ${LOCAL_PATH}/ss policydb)
    add_c_source(SOURCE_FILES ${LOCAL_PATH}/ss services)
    add_c_source(SOURCE_FILES ${LOCAL_PATH}/ss conditional)
    add_c_source(SOURCE_FILES ${LOCAL_PATH}/ss mls)
    add_c_source(SOURCE_FILES ${LOCAL_PATH}/ss status)
endif ()

if (${CONFIG_SECURITY_NETWORK_XFRM})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} xfrm)
endif ()
if (${CONFIG_NETLABEL})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} netlabel)
endif ()

add_library(security-selinux STATIC ${SOURCE_FILES})
target_include_directories(security-selinux PRIVATE
        ${LOCAL_PATH}
        ${LOCAL_PATH}/include
        )
